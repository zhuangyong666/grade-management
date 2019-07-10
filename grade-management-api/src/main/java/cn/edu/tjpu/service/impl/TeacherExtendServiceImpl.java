package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.dao.TeacherExtendDao;
import cn.edu.tjpu.service.TeacherExtendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: TeacherExtendServiceImpl
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-14 07:03
 **/
@Service
@Transactional
public class TeacherExtendServiceImpl implements TeacherExtendService {
    @Autowired
    private TeacherExtendDao teacherExtendDao;

    @Override
    public List<Map> getExperimentByTeacherId(QueryParams queryParams) {
        return teacherExtendDao.getExperimentByTeacherId(queryParams);
    }
}
