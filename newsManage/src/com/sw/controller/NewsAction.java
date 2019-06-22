package com.sw.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sw.entity.FeedBack;
import com.sw.entity.News;
import com.sw.entity.NewsType;
import com.sw.entity.Nuser;
import com.sw.service.FeedBackServiceI;
import com.sw.service.NewsServiceI;
import com.sw.service.NewsTypeServiceI;
import com.sw.service.impl.FeedBackServiceImpl;

@Controller
@RequestMapping("/news")
public class NewsAction {
	@Resource
	private NewsServiceI newsServiceImpl;
	@Resource
	private NewsTypeServiceI newsTypeServiceImpl;
	@Resource
	private FeedBackServiceI feedBackServiceImpl;
	@Resource
	private ServletContext servletContext;
	
	
	@RequestMapping("/findNewsByType")
	public String findNewsByType(Model model,int id){
		List<News> list = newsServiceImpl.findNewsByType(id, 1, 6);
		NewsType newstypes = newsTypeServiceImpl.findTypnamebyTypeid(id);
		List<News> listofType = newsServiceImpl.findbyTypeId(id);
		int size = listofType.size();
		int page = size/6;
		List<String> pagList = new ArrayList<String>();
		
		if(size%6 != 0){
			page = size/6+1;
			for(int i = 0; i<page ;i++){
				pagList.add(""+(i+1));
			}
		}else{
			for(int i = 0; i<page ;i++){
				pagList.add(""+(i+1));
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("news", newstypes);
		model.addAttribute("page", pagList);
		model.addAttribute("listtop", list);
		return "reviews";
	}
	
	@RequestMapping("/findAllNews")
	public String findAllNews(Model model){
		List<News> list = newsServiceImpl.findAllNews();
		List<News> Latest = newsServiceImpl.findNewsByTypeIdAndState(2001, 1);
		List<News> Popular = newsServiceImpl.findNewsByTypeIdAndState(2002,1);
		model.addAttribute("list", list);
		model.addAttribute("latest", Latest);
		model.addAttribute("popular", Popular);
		return "index";
	}
	
	@RequestMapping("findOneNewsByID")
	public String findOneNewsByID(Model model,int n_id){
		News detail = newsServiceImpl.findOneNewsByID(n_id);
		NewsType newstypes = newsTypeServiceImpl.findTypnamebyTypeid(detail.getType_id());
		model.addAttribute("detail", detail);
		model.addAttribute("newstypes", newstypes);
		return "single";
	}
	
	@RequestMapping("findNewsBypage")
	public String findNewsBypage(Model model,int pagenum,int typeid){
		int startIndex = pagenum+1;
		int endIndex = pagenum * 6;
		if(pagenum == 1){
			startIndex = 1;
			endIndex = startIndex*6;
		}
		List<News> list = newsServiceImpl.findNewsByType(typeid, startIndex, endIndex);
		NewsType newstypes = newsTypeServiceImpl.findTypnamebyTypeid(typeid);
		List<News> listofType = newsServiceImpl.findbyTypeId(typeid);
		List<News> listtop = newsServiceImpl.findNewsByType(typeid, 1, 6);
		
		int size = listofType.size();
		int page = size/6;
		List<String> pagList = new ArrayList<String>();
		if(size%6 != 0){
			page = size/6+1;
			for(int i = 0; i<page ;i++){
				pagList.add(""+(i+1));
			}
		}else{
			for(int i = 0; i<page ;i++){
				pagList.add(""+(i+1));
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("news", newstypes);
		model.addAttribute("page", pagList);
		model.addAttribute("listtop", listtop);
		return "reviews";
	}
	
	@RequestMapping("findNewsByTitle")
	public String findNewsByTitle(Model model,String n_title){
		System.out.println(n_title);
		List<News> list = newsServiceImpl.findNewsByTitle(n_title, 1, 6);
		List<News> account = newsServiceImpl.findAllNewsByTitle(n_title);
		int size = account.size();
		int pagenum = size/6;
		if(size%6 == 0){
			pagenum = size/6;
		}else{
			pagenum = size/6+1;
		}
		model.addAttribute("n_title", n_title);
		model.addAttribute("list", list);
		model.addAttribute("pagenum", pagenum);
		return "search";
		
	}
	
	@RequestMapping("findNewsByTitlePage")
	public String findNewsByTitlePage(Model model,int pagenum,String n_title){
		int startIndex = (pagenum-1)*6+1;
		int endIndex = pagenum * 6;
		if(pagenum == 1){
			startIndex = 1;
			endIndex = startIndex*6;
		}
		List<News> list = newsServiceImpl.findNewsByTitle(n_title, startIndex, endIndex);
		List<News> account = newsServiceImpl.findAllNewsByTitle(n_title);
		int size = account.size();
		int pagenums = size/6;
		if(size%6 == 0){
			pagenum = size/6;
		}else{
			pagenum = size/6+1;
		}
		model.addAttribute("n_title", n_title);
		model.addAttribute("list", list);
		model.addAttribute("pagenum", pagenums);
		return "search";
	}
	
	@RequestMapping("insertFeedBack")
	public String insertFeedBack(Model model,int n_id,String u_id,String f_text){ 
			FeedBack feedBack = new FeedBack();
			if(u_id != null && u_id !=""){
				int id = Integer.parseInt(u_id);
				feedBack.setU_id(id);
				Date date = new Date();
				Timestamp time = new Timestamp(date.getTime());
				feedBack.setF_time(time);
				feedBack.setF_text(f_text);
				feedBackServiceImpl.insertFeedBack(feedBack);
				return findOneNewsByID(model, n_id);
			}else{
				return "login";
			}
		}
	
	
	
	
	
}

