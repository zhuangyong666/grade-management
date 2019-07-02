package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.dao.CourseDao;
import cn.edu.tjpu.model.Course;
import cn.edu.tjpu.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName: CourseServiceImpl
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-04 17:01
 **/
@Service
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;

    @Override
    public List<Course> getCoursesByTeacherId(QueryParams queryParams) {
        return courseDao.getCoursesByTeacherId(queryParams);
    }

    @Override
    public List<Course> getAllCourse() {
        return courseDao.getAllCourse();
    }
}
