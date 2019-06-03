package cn.edu.tjpu.listener;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.alibaba.fastjson.JSON;
import com.bsoft.hip.cache.centre.clients.RedisClient;
import com.bsoft.hip.mdm.common.SystemDicCache;
import com.bsoft.hip.mdm.dao.DictionaryDao;
import com.bsoft.hip.mdm.dao.DictionaryItemDao;
import com.bsoft.hip.mdm.dao.SystemDicDao;
import com.bsoft.hip.mdm.model.DicItem;
import com.bsoft.hip.mdm.model.Dictionary;
import com.bsoft.hip.mdm.model.SystemDic;

/**
 * @描述 : web容器启动后执行数据初始化，执行时间点为spring加载完所有bean
 * @创建者：liuss
 * @创建时间： 2018/12/20
 */
public class InitializationListener implements ApplicationListener<ContextRefreshedEvent> {

    private static final Log LOG = LogFactory.getLog(InitializationListener.class);

    @Autowired
    private SystemDicDao systemDicDao;
    
    @Autowired
    private RedisClient redisClient;
    @Autowired
    private DictionaryDao dicDao;
    @Autowired
    private DictionaryItemDao dicItemDao;
    @Autowired
    private DictionaryDao dictionaryDao;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        LOG.info("############# init web data start. #############");
        boolean flag = this.initSystemDic();
        LOG.info("############# init dic:" + flag + " #############");
        boolean flagRedis = this.initRedisDic();
        LOG.info("############# init redisDic:" + flagRedis + " #############");
        LOG.info("############# init web data end. #############");
    }

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
                SystemDicCache.setDicValue(systemDic.getType(), systemDic.getKey(), systemDic.getValue());
            }
            return true;
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return false;
        }
    }
    
    /**
     * 
        * @Title: initRedisDic  
        * @Description: TODO(同步mdm字典到redis)  
        * @param @return    参数  
        * @return boolean    返回类型  
        * @throws e
     */
    private boolean initRedisDic() {
        LOG.info("############# init redis dic. #############");
        try {
        	//查询所有字典   因为字典只有不到400本，所以没有做分页
        	List<Dictionary> allDic = dicDao.getAllDic();
            for (Dictionary dic : allDic) {
            	// 这里有个问题 。idc10和icd9的字典项太多了   直接缓存的话  多半这个项目就要报内存溢出了。  所以不缓存
//            	if(dic.getCode().toUpperCase().contains("ICD-")) {
//            		continue;
//            	}
            	
            	//查询所有字典版本
            	String verCode = dictionaryDao.transformVerCodeToVerName(dic.getVersion(), dic.getCatalog());
            	//拼接key 格式为 dic-字典域-字典版本-字典编码
            	String dicInfoKey = new StringBuilder("dic-").append(dic.getCatalog()).append("-").append(verCode).append("-INFO-").append(dic.getCode()).toString();
            	String strMap = JSON.toJSONString(dic);
                redisClient.setObject(dicInfoKey, strMap);
            	
            	DicItem dicItem = new DicItem();
            	dicItem.setDicId(dic.getId());
            	//查询所有item 
            	List<DicItem> findDicItemByDicId = dicItemDao.findDicItemByDicId(dicItem);
            	String dicDataKey = new StringBuilder("dic-").append(dic.getCatalog()).append("-").append(verCode).append("-DATA-").append(dic.getCode()).toString();
            	for (DicItem item : findDicItemByDicId) {
            		String itemData = JSON.toJSONString(item);
            		if(StringUtils.isNotEmpty(itemData)) {
            			redisClient.hset(dicDataKey, item.getCode(), itemData);
            		}
				}
            }
        	
            return true;
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return false;
        }
    }
    
}
