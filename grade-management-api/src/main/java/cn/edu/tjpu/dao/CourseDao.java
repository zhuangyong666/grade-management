package cn.edu.tjpu.dao;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.model.Course;

import java.util.List;

/**
 * @Interface: CourseDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-04 16:59
 **/
public interface CourseDao {
    public void addCourse(Course course);

    public Course getCourseByName(Course course);

    public List<Course> getCoursesByTeacherId(QueryParams queryParams);

    public List<Course> getAllCourse();
}
