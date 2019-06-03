package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.Teacher;

/**
 * @ClassName: TeacherDao
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-02 15:47
 **/
public interface TeacherDao {
    public Teacher getTeacherByNumber(Teacher teacher);
}
