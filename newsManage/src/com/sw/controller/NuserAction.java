package com.sw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class NuserAction {
	
	@RequestMapping("/getAll")
	public String index(){
		return "index";
	}
	
}
