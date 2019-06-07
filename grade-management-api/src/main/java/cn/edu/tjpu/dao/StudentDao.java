package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.Student;

import java.util.List;

/**
 * @Interface: StudentDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-05 14:51
 **/
public interface StudentDao {
    public void batchAddStudent(List<Student> student);

    public List<Student> getStudentByNumbers(List<String> numbers);

    public void batchUpdateStudent(List<Student> students);
}
