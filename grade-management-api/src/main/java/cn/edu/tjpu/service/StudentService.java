package cn.edu.tjpu.service;

import cn.edu.tjpu.base.Page;
import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.model.Student;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;
/**
 * @Interface: StudentService
 * @description:
 * @author: zhuangy
 * @date: 2019-06-09 10:08
 **/
public interface StudentService {
    public PageInfo findStudentByPage(Page<QueryParams> page);

    public void updateStudentById(Student student);

    public void deleteStudentById(Student student);

    public List<Map> getStudentScore(QueryParams queryParams);

    public void updateStudentScore(QueryParams queryParams);

    public ResponseData addStudent(QueryParams queryParams);
}
