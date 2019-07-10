package cn.edu.tjpu.service;

import cn.edu.tjpu.base.QueryParams;

import java.util.List;
import java.util.Map;

/**
 * @Interface: TeacherExtendService
 * @description:
 * @author: zhuangy
 * @date: 2019-06-14 07:02
 **/
public interface TeacherExtendService {
    public List<Map> getExperimentByTeacherId(QueryParams queryParams);
}
