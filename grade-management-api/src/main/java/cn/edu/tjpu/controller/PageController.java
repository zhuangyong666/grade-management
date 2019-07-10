package cn.edu.tjpu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @ClassName: PageController
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-20 17:08
 **/
@Controller
public class PageController {
    @GetMapping("index")
    public String index() {
        return "index";
    }
}
