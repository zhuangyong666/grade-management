package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.BaseController;
import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.model.Clazz;
import cn.edu.tjpu.service.ClazzService;
import cn.edu.tjpu.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @ClassName: ClazzController
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-09 11:34
 **/
@RestController
@RequestMapping("clazz")
public class ClazzController extends BaseController {
    @Autowired
    private ClazzService clazzService;

    @GetMapping("list")
    public ResponseData getAllClazz() throws Exception{
        List<Clazz> resutList = clazzService.getAllClazz();
        return ResponseData.ok(resutList);
    }

    @PostMapping("list")
    public ResponseData getClazz(@RequestBody QueryParams queryParams){
        String auth = getAuth();
        if (JWTUtils.checkToken(auth).isStatus()) {
            String teacherId = JWTUtils.parser(auth);
            queryParams.put("teacherId", teacherId);
            List<Clazz> clazzList = clazzService.getClazzByTeacherId(queryParams);
            return ResponseData.ok(clazzList);
        }
        return ResponseData.failByParam("您还没有登录");
    }
    @PostMapping("delete")
    public ResponseData deleteClass(@RequestBody QueryParams queryParams){
       clazzService.deleteScoreByClass(queryParams);
       return ResponseData.ok("success");
    }
}
