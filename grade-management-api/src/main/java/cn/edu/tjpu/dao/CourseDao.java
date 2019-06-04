package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.Course;

/**
 * @Interface: CourseDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-04 16:59
 **/
public interface CourseDao {
    public void addCourse(Course course);

    public Course getCourseByName(Course course);
}
