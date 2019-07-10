package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.dao.ClazzDao;
import cn.edu.tjpu.model.Clazz;
import cn.edu.tjpu.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName: ClazzServiceImpl
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-09 11:33
 **/
@Service
@Transactional
public class ClazzServiceImpl implements ClazzService {
    @Autowired
    private ClazzDao clazzDao;
    @Override
    public List<Clazz> getAllClazz() {
        return clazzDao.getAllClazz();
    }

    @Override
    public List<Clazz> getClazzByTeacherId(QueryParams queryParams) {
        return clazzDao.getClazzByTeacherId(queryParams);
    }
}
