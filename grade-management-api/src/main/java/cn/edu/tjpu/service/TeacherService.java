package cn.edu.tjpu.service;

import cn.edu.tjpu.base.Page;
import cn.edu.tjpu.model.Teacher;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Interface: TeacherService
 * @description:
 * @author: zhuangy
 * @date: 2019-06-02 15:46
 **/
public interface TeacherService {
    public Teacher getTeacherByNumber(Teacher teacher);

    public PageInfo<Teacher> getTeacherByPage(Page<Teacher> page);

    public void updateTeacherById(Teacher teacher);

    public void deleteTeacherById(Teacher teacher);

    public void addTeacher(Teacher teacher);

    public List<Teacher> getTeachersByNumbers(List<String> numbers);
}
