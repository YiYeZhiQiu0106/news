package com.sw.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * 用户编辑微头条Action
 * @author 顿盛华
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sw.entity.News;
import com.sw.entity.Nuser;
import com.sw.service.NewsServiceI;
@Controller
@RequestMapping("/writer")
public class WriterAction {
	
	@Resource
	private NewsServiceI newsServiceImpl;
	@Resource
	private ServletContext servletContext;
	
	/**
	 * 用户发布微头条
	 * @param file
	 * @param news
	 * @param model
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("writerNews")
	public String writerNews(@RequestParam("file") MultipartFile file,News news,Model model,HttpServletRequest request) throws IOException{
		if("".equals(news.getN_roundup())||news.getN_roundup() == null){
			news.setN_roundup("无摘要信息！");
		}
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("nuser") == null){
				return "error";
		}
		Nuser nuser = (Nuser)session.getAttribute("nuser");
		news.setN_author(nuser.getU_name());//作者名
		news.setN_id(newsServiceImpl.findMaxNewsID()+1);//设置新闻ID
		
		//文件保存
		String path = servletContext.getRealPath("/jsp/img/news");//通过servletContext获取项目的绝对路径
		news.setN_img(file.getOriginalFilename());//图片名
		File targetFile = new File(path+"\\"+file.getOriginalFilename());//文件保存路径+文件名称
		FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
		
		news.setN_state(6);
		Date date = new Date();
		Timestamp n_time = new Timestamp(date.getTime());
		news.setN_time(n_time);
		
		System.out.println(news);
		
		if(newsServiceImpl.insertNews(news)){
			return "for:nuserNews/showNuserNews.action?u_id="+nuser.getU_id();
		}else{
			return "error";
		}
	}

}
