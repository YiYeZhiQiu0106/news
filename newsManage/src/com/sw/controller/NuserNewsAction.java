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

import com.sw.entity.Collectioned;
import com.sw.entity.News;
import com.sw.entity.Nuser;
import com.sw.entity.NuserNews;
import com.sw.service.CollectionedServiceI;
import com.sw.service.NewsServiceI;
import com.sw.service.NuserServiceI;


@Controller
@RequestMapping("/nuserNews")
public class NuserNewsAction {
	@Resource
	private NuserServiceI nuserServiceImpl;
	@Resource
	private NewsServiceI newsServiceImpl;
	@Resource
	private CollectionedServiceI collectionedServiceIpl;
	@Resource
	private ServletContext servletContext;
	
	@RequestMapping("showNuserNews")
	public String showNuserNews(Model model,int u_id){
		Nuser n = nuserServiceImpl.findOneUserByUid(u_id);
		List<News> list = newsServiceImpl.findAllNewsByauthor(n.getU_name(), 1, 4);
		List<News> account = newsServiceImpl.findAllByauthor(n.getU_name());
		int size = account.size();
		int pagenum = size/4;
		if(size%6 == 0){
			pagenum = size/4;
		}else{
			pagenum = size/4+1;
		}
		model.addAttribute("nuser", n);
		model.addAttribute("list", list);
		model.addAttribute("pagenum", pagenum);
		return "personal";
	}
	
	@RequestMapping("showNuserNewsPage")
	public String showNuserNewsPage(Model model,int pagenum,int u_id){
		Nuser n = nuserServiceImpl.findOneUserByUid(u_id);
		int startIndex = (pagenum-1)*4+1;
		int endIndex = pagenum * 4;
		if(pagenum == 1){
			startIndex = 1;
			endIndex = startIndex*4;
		}
		List<News> list = newsServiceImpl.findAllNewsByauthor(n.getU_name(), startIndex, endIndex);
		List<News> account = newsServiceImpl.findAllByauthor(n.getU_name());
		int size = account.size();
		int pagenums = size/4;
		if(size%6 == 0){
			pagenums = size/4;
		}else{
			pagenums = size/4+1;
		}
		model.addAttribute("nuser", n);
		model.addAttribute("list", list);
		model.addAttribute("pagenum", pagenums);
		return "personal";
	}
	
	
	/**
	 * 第一次访问收藏
	 * @param model
	 * @param u_id
	 * @return
	 */
	@RequestMapping("showNuserNewsLeft")
	public String showNuserNewsLeft(Model model,int u_id){
		Nuser n = nuserServiceImpl.findOneUserByUid(u_id);
		List<Collectioned> listsize = collectionedServiceIpl.findCollectionByUid(u_id);
		List<Collectioned> lists = collectionedServiceIpl.findCollectionByUidPage(u_id, 1, 4);
		System.out.println(lists);
		List<NuserNews> list = new ArrayList<NuserNews>();
		for(int i = 0;i < lists.size();i++){
			News news = newsServiceImpl.findOneNewsByID(lists.get(i).getN_id());
			String n_author = news.getN_author();
			String n_title =news.getN_title();
			int n_id = news.getN_id();
			String n_img = news.getN_img();
			int n_state = news.getN_state();
			Timestamp n_time =news.getN_time();
			NuserNews nusernews = new NuserNews(n_author, n_title, n_id, n_img, n_state, n_time);
			list.add(i, nusernews);
			System.out.println(list);
		}
		int size = listsize.size();
		int pagenum = size/4;
		if(size%4 == 0){
			pagenum = size/4;
		}else{
			pagenum = size/4+1;
		}
		
		model.addAttribute("nuser", n);
		model.addAttribute("list", list);
		model.addAttribute("pagenum", pagenum);
		return "personalleft";
	}
	
	/**
	 * 收藏方法（分页）
	 * @param model
	 * @param pagenum
	 * @param u_id
	 * @return
	 */
	@RequestMapping("showNuserNewsLeftPage")
	public String showNuserNewsLeftPage(Model model,int pagenum,int u_id){
		Nuser n = nuserServiceImpl.findOneUserByUid(u_id);
		int startIndex = (pagenum-1)*4+1;
		int endIndex = pagenum * 4;
		if(pagenum == 1){
			startIndex = 1;
			endIndex = startIndex*4;
		}
		List<Collectioned> listsize = collectionedServiceIpl.findCollectionByUid(u_id);
		List<Collectioned> lists = collectionedServiceIpl.findCollectionByUidPage(u_id, startIndex, endIndex);
		List<NuserNews> list = new ArrayList<NuserNews>();
		for(int i = 0;i < lists.size();i++){
			News news = newsServiceImpl.findOneNewsByID(lists.get(i).getN_id());
			String n_author = news.getN_author();
			String n_title =news.getN_title();
			int n_id = news.getN_id();
			String n_img = news.getN_img();
			int n_state = news.getN_state();
			Timestamp n_time =news.getN_time();
			NuserNews nusernews = new NuserNews(n_author, n_title, n_id, n_img, n_state, n_time);
			list.add(i, nusernews);
			System.out.println(list);
		}
		int size = listsize.size();
		int pagenums = size/4;
		if(size%4 == 0){
			pagenums = size/4;
		}else{
			pagenums = size/4+1;
		}
		
		model.addAttribute("nuser", n);
		model.addAttribute("list", list);
		model.addAttribute("pagenum", pagenums);
		return "personalleft";
	}
	
	/**
	 * 取消收藏
	 * @param n_id
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteCollect")
	public String deleteCollect(@RequestParam("n_id") Integer n_id,Model model,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("nuser") != null){
			Nuser nuser = (Nuser)session.getAttribute("nuser");
			Collectioned collection = collectionedServiceIpl.findOneCollection(nuser.getU_id(), n_id);
			
			collectionedServiceIpl.deleteCollection(collection);
			
			return showNuserNewsLeft(model,nuser.getU_id());
		}else{
			return "login";
		}
	}
	
	
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
		
		if(newsServiceImpl.insertNews(news)){
			return showNuserNews(model,nuser.getU_id());
		}else{
			return "error";
		}
	}
}
