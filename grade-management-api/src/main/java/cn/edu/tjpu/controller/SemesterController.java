package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.BaseController;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.model.Semester;
import cn.edu.tjpu.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ClassName: SemesterController
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-16 13:26
 **/
@RestController
@RequestMapping("semester")
public class SemesterController extends BaseController {
    @Autowired
    private SemesterService semesterService;

    @GetMapping("getAllSemester")
    public ResponseData getAllSemester() {
        List<Semester> resultList = semesterService.getAllSemester();
        return ResponseData.ok(resultList);
    }
}
