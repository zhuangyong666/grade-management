package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.SystemDic;

import java.util.List;

/**
 * @Interface: SystemDicDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-04 09:03
 **/
public interface SystemDicDao {
    public List<SystemDic> getAll();
}
