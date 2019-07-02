package cn.edu.tjpu.service;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.model.Course;

import java.util.List;

/**
 * @Interface: CourseService
 * @description:
 * @author: zhuangy
 * @date: 2019-06-04 17:00
 **/
public interface CourseService {
    public List<Course> getCoursesByTeacherId(QueryParams queryParams);

    public List<Course> getAllCourse();
}
