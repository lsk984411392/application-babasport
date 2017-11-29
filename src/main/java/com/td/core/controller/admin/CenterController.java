package com.td.core.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/control")
public class CenterController {
	@RequestMapping("index.do")
	public String index(){
		return "index";
	}
	@RequestMapping("top.do")
	public String top(){
		return "top";
	}
	@RequestMapping("main.do")
	public String main(){
		return "main";
	}
	@RequestMapping("left.do")
	public String left(){
		return "left";
	}
	@RequestMapping("right.do")
	public String right(){
		return "right";
	}
}
