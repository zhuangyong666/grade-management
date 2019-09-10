package cn.edu.tjpu.service;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.model.Clazz;

import java.util.List;

/**
 * @Interface: ClazzService
 * @description:
 * @author: zhuangy
 * @date: 2019-06-09 11:33
 **/
public interface ClazzService {
    public List<Clazz> getAllClazz();

    public List<Clazz> getClazzByTeacherId(QueryParams queryParams);

    public void deleteScoreByClass(QueryParams queryParams);
}
