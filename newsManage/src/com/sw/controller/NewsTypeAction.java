package com.sw.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sw.entity.NewsType;
import com.sw.service.NewsServiceI;
import com.sw.service.NewsTypeServiceI;

@Controller
@RequestMapping("/newsType")
public class NewsTypeAction {
	@Resource
	private NewsTypeServiceI newsTypeServiceImpl;
	
	@RequestMapping("/types")
	@ResponseBody
	public List<NewsType> findAllNewsType(){
		List<NewsType> list = newsTypeServiceImpl.findAllNewsType();
		return list;
	}
}
