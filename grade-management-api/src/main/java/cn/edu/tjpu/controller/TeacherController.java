package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.BaseController;
import cn.edu.tjpu.base.ResponseCode;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.model.Teacher;
import cn.edu.tjpu.service.TeacherService;
import cn.edu.tjpu.utils.JWTUtils;
import cn.edu.tjpu.utils.MenuUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
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
    @Autowired
    private TeacherService teacherService;

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
            if (dbTeacher.getNumber().equals("admin")) {
                Map<String, Object> result = new HashMap<>();
                result.put("token", JWTUtils.getToken(dbTeacher.getNumber()));
                result.put("meuns", MenuUtils.grantAdminToUser());
                result.put("routers", "/home_/teachers_/upload");
                return ResponseData.ok(result);
            } else {
                Map<String, Object> result = new HashMap<>();
                result.put("token", JWTUtils.getToken(dbTeacher.getNumber()));
                result.put("meuns", MenuUtils.grantUserToUser());
                result.put("routers", "/home");
                return ResponseData.ok(result);
            }
        }
        return ResponseData.fail("账号或者密码错误");
    }

    @GetMapping("/list")
    public ResponseData queryUsers(String name, String address, Integer page, Integer pageSize) {
        /*if (page == null) {
            page = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        List<Teacher> users = new ArrayList<Teacher>();
        if (page == 1) {
            for (int i = 1; i < 11; i++) {
                users.add(new Teacher(i, "王小虎" + i, "上海市普陀区金沙江路 1518 弄", "2016-05-02"));
            }
        }
        if (page == 2) {
            for (int i = 11; i < 20; i++) {
                users.add(new Teacher(i, "王小虎" + i, "上海市普陀区金沙江路 1518 弄", "2016-05-02"));
            }
        }
        if (!address.equals("")) {
            users = new ArrayList<Teacher>();
            users.add(new Teacher(111, "王小虎111", "上海市普陀区金沙江路 1518 弄", "2016-05-02"));
        }
        Map<String, Object> result = new HashMap<>();
        result.put("list", users);
        result.put("currentPage", page);
        result.put("total", 19);
        result.put("pageSize", pageSize);
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }*/
        return ResponseData.ok("");
    }
}
