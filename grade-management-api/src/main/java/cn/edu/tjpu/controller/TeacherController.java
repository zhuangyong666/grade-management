package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.*;
import cn.edu.tjpu.model.Teacher;
import cn.edu.tjpu.service.TeacherExtendService;
import cn.edu.tjpu.service.TeacherService;
import cn.edu.tjpu.utils.JWTUtils;
import cn.edu.tjpu.utils.MenuUtils;
import cn.edu.tjpu.utils.RandomGUID;
import cn.edu.tjpu.utils.SemesterUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: TeacherController
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-02 16:17
 **/
@RequestMapping("teacher")
@RestController
public class TeacherController extends BaseController {
    private final static Log LOG = LogFactory.getLog(TeacherController.class);
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private TeacherExtendService teacherExtendService;

    @PostMapping("/login")
    public ResponseData login(Teacher teacher) {
        String number = teacher.getNumber();
        String name = teacher.getName();
        if (!StringUtils.hasText(name)) {
            return ResponseData.fail("用户名不能为空", ResponseCode.PARAM_ERROR_CODE.getCode());
        }
        if (!StringUtils.hasText(number)) {
            return ResponseData.fail("密码不能为空", ResponseCode.PARAM_ERROR_CODE.getCode());
        }
        Teacher dbTeacher = teacherService.getTeacherByNumber(teacher);
        if (dbTeacher != null) {
            if (dbTeacher.getName().equals("admin")) {
                Map<String, Object> result = new HashMap<>();
                result.put("token", JWTUtils.getToken(dbTeacher.getId()));
                result.put("meuns", MenuUtils.grantAdminToUser());
                result.put("routers", "/home_/teachers_/upload_/students_/courses_/scoreLevel");
                return ResponseData.ok(result);
            } else {
                Map<String, Object> result = new HashMap<>();
                result.put("token", JWTUtils.getToken(dbTeacher.getId()));
                result.put("meuns", MenuUtils.grantAdminToUser());
                result.put("routers", "/home_/teachers_/upload_/students_/courses_/scoreLevel");
                LOG.error("------------" + result.get("token"));
                return ResponseData.ok(result);
            }
        }
        return ResponseData.fail("账号或者密码错误", 400);
    }

    @PostMapping("/list")
    public ResponseData queryUsers(@Valid @RequestBody Page<Teacher> page) {
        return ResponseData.ok(teacherService.getTeacherByPage(page));
    }

    @PostMapping("update")
    public ResponseData updateTeacher(@RequestBody Teacher teacher) {
        teacherService.updateTeacherById(teacher);
        return ResponseData.ok("");
    }

    @PostMapping("delete")
    public ResponseData deleteTeacher(@RequestBody Teacher teacher) {
        teacherService.deleteTeacherById(teacher);
        return ResponseData.ok("");
    }

    @PostMapping("add")
    public ResponseData addTeacher(@RequestBody Teacher teacher) {
        List<String> numbers = new ArrayList<>();
        numbers.add(teacher.getNumber());
        List<Teacher> resultList = teacherService.getTeachersByNumbers(numbers);
        if (resultList.size() != 0) {
            return ResponseData.fail("工号已存在");
        }
        teacher.setId(RandomGUID.generatorGUID());
        teacherService.addTeacher(teacher);
        return ResponseData.ok("");
    }

    @GetMapping("getExperiment")
    public ResponseData getExperiment(Long courseId) {
        String auth = getAuth();
        if (JWTUtils.checkToken(auth).isStatus()) {
            String teacherId = JWTUtils.parser(auth);
            QueryParams queryParams = new QueryParams();
            queryParams.put("courseId",courseId);
            queryParams.put("teacherId",teacherId);
            queryParams.put("semesterNumber", SemesterUtils.getSemesterNumber());
            List<Map> resuliList = teacherExtendService.getExperimentByTeacherId(queryParams);
            return ResponseData.ok(resuliList);
        }
        return ResponseData.fail("token不正确");
    }

}
