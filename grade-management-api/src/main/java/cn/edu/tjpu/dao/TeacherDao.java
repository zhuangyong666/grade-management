package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.Teacher;

import java.util.List;

/**
 * @ClassName: TeacherDao
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-02 15:47
 **/
public interface TeacherDao {
    public Teacher getTeacherByNumber(Teacher teacher);

    public void batchAddTeacher(List<Teacher> teachers);

    public List<Teacher> getTeachersByNumbers(List<String> numbers);

    public void batchUpdateTeacher(List<Teacher> teachers);
}
