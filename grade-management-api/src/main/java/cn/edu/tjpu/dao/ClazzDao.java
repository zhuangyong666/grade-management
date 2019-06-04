package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.Clazz;

/**
 * @Interface: ClazzDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-04 17:14
 **/
public interface ClazzDao {
    public void addClazz(Clazz clazz);

    public Clazz getClazzByName(Clazz clazz);
}
