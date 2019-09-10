package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.BaseController;
import cn.edu.tjpu.base.Page;
import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.model.Student;
import cn.edu.tjpu.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: StudentController
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-09 09:26
 **/
@RestController
@RequestMapping("student")
public class StudentController extends BaseController {
    @Autowired
    private StudentService studentService;

    @PostMapping("list")
    public ResponseData findStudentByPage(@RequestBody @Valid Page<QueryParams> page) {
        PageInfo pageInfo = studentService.findStudentByPage(page);
        return ResponseData.ok(pageInfo);
    }

    @PostMapping("update")
    public ResponseData update(@RequestBody Student student) {
        studentService.updateStudentById(student);
        return ResponseData.ok("");
    }

    @PostMapping("delete")
    public ResponseData deleteStudent(@RequestBody Student student){
        studentService.deleteStudentById(student);
        return ResponseData.ok("");
    }

    @PostMapping("getStudentScore")
    public ResponseData getStudentScore(@RequestBody QueryParams queryParams){
        List<Map> resultList = studentService.getStudentScore(queryParams);
        return ResponseData.ok(resultList);
    }

    @PostMapping("updateStudentScore")
    public ResponseData updateStudentScore(@RequestBody QueryParams queryParams){
        studentService.updateStudentScore(queryParams);
        return ResponseData.ok("");
    }

    @PostMapping("add")
    public ResponseData addStudent(@RequestBody QueryParams queryParams){
        return studentService.addStudent(queryParams);
    }
}
