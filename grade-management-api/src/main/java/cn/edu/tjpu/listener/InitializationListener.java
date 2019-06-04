package cn.edu.tjpu.listener;

import cn.edu.tjpu.base.SystemDicCache;
import cn.edu.tjpu.dao.SystemDicDao;
import cn.edu.tjpu.model.SystemDic;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * @描述 : web容器启动后执行数据初始化，执行时间点为spring加载完所有bean
 * @创建者：liuss
 * @创建时间： 2018/12/20
 */
@WebListener
public class InitializationListener implements ServletContextListener {

    private static final Log LOG = LogFactory.getLog(InitializationListener.class);

    @Autowired
    private SystemDicDao systemDicDao;
    
    private boolean initSystemDic() {
        LOG.info("############# init system dic. #############");
        try {
            List<SystemDic> systemDicList = systemDicDao.getAll();
            for (SystemDic systemDic : systemDicList) {
                ConcurrentMap<String, String> dicCache = SystemDicCache.getDicByType(systemDic.getType());
                if (dicCache == null) {
                    dicCache = new ConcurrentHashMap<>();
                    SystemDicCache.setDic(systemDic.getType(), dicCache);
                }
                SystemDicCache.setDicValue(systemDic.getType(), systemDic.getKey(), systemDic.getVal());
            }
            return true;
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return false;
        }
    }


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        LOG.info("############# init web data start. #############");
        boolean flag = this.initSystemDic();
        LOG.info("############# init dic:" + flag + " #############");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
