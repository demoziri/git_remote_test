package com.pjs.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
	
	@RequestMapping("/usr/home/main")
	public String showMain() {

		System.out.println("back 테스트");

		return "usr/home/main"; //jsp
	}
	
	@RequestMapping("/")
	public String showRoot() {
		
		return "redirect:/usr/home/main";
	}
	
	
}






