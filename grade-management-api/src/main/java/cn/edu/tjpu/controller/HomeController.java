package cn.edu.tjpu.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.edu.tjpu.base.ResponseData;

@RestController
@RequestMapping("/home")
public class HomeController {

	@GetMapping("/loadData")
	public ResponseData loadData() {
		return ResponseData.ok("hello");
	}
	
}
