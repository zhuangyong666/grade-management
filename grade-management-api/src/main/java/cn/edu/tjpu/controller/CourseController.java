package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.BaseController;
import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.model.Course;
import cn.edu.tjpu.service.CourseService;
import cn.edu.tjpu.utils.JWTUtils;
import cn.edu.tjpu.utils.SemesterUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName: CourseController
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-10 12:31
 **/
@RestController
@RequestMapping("course")
public class CourseController extends BaseController {
    @Autowired
    private CourseService courseService;

    @PostMapping("getCourse")
    public ResponseData getCourseByTeacher(@RequestBody QueryParams queryParams, HttpServletRequest httpRequest) {
        String auth = httpRequest.getHeader("Authorization");
        if (JWTUtils.checkToken(auth).isStatus()) {
            String teacherId = JWTUtils.parser(auth);
            queryParams.put("teacherId", teacherId);
            List<Course> courses = courseService.getCoursesByTeacherId(queryParams);
            return ResponseData.ok(courses);
        }
        return ResponseData.failByParam("您还没有登录");
    }

    @GetMapping("getAllCourse")
    public ResponseData getAllCourse() {
        List<Course> resultList = courseService.getAllCourse();
        return ResponseData.ok(resultList);
    }

    @GetMapping("getCourse")
    public ResponseData getCourse(HttpServletRequest httpRequest) {
        String auth = httpRequest.getHeader("Authorization");
        if (JWTUtils.checkToken(auth).isStatus()) {
            QueryParams queryParams = new QueryParams();
            String teacherId = JWTUtils.parser(auth);
            queryParams.put("teacherId", teacherId);
            queryParams.put("semesterNumber", SemesterUtils.getSemesterNumber());
            List<Course> courses = courseService.getCoursesByTeacherId(queryParams);
            return ResponseData.ok(courses);
        }
        return ResponseData.failByParam("您还没有登录");
    }

}
