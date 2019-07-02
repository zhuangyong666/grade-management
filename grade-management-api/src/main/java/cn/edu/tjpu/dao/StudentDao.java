package cn.edu.tjpu.dao;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.model.Student;

import java.util.List;
import java.util.Map;

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

    public List<Map> findStudentByPage(QueryParams queryParams);

    public void updateStudentById(Student student);

    public void deleteStudentById(Student student);

    public List<Map> getStudentScore(QueryParams queryParams);

    public void addStudent(QueryParams queryParams);
}
