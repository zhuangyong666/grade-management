package cn.edu.tjpu.dao;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.model.Clazz;

import java.util.List;

/**
 * @Interface: ClazzDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-04 17:14
 **/
public interface ClazzDao {
    public void addClazz(Clazz clazz);

    public Clazz getClazzByName(Clazz clazz);

    public List<Clazz> getAllClazz();

    public List<Clazz> getClazzByTeacherId(QueryParams queryParams);
}
