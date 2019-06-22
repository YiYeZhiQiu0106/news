package com.sw.controller.adm;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sw.entity.News;
import com.sw.entity.NewsInfo;
import com.sw.entity.NewsType;
import com.sw.service.NewsInfoServiceI;
import com.sw.service.NewsServiceI;
import com.sw.service.NewsTypeServiceI;
/**
 * 新闻管理action
 * @author 顿盛华
 *
 */
@Controller
@RequestMapping("/b_newsManage")
public class NewsManageAction {
	
	@Resource
	private NewsServiceI newsServiceImpl;
	@Resource
	private NewsInfoServiceI newsInfoServiceImpl;
	@Resource
	private NewsTypeServiceI newsTypeServiceImpl;
	@Resource
	private ServletContext servletContext;//HttpSession
	
	
	@RequestMapping("ueditor")
	public String showUeditor(){
		return "b_ueditor";
	}
	
	
	/**
	 * 展示发送列表
	 * @param model
	 * @return
	 */
	@RequestMapping("showRelease")
	public String showRelease(Integer begin,Model model){
		// 1  2  3  4  5
		//1 - 6
		//7 - 12
		//13 - 18
		//19 - 24
		begin = 1;
		int pageSize = 1;
		int length = 6;
		List<NewsInfo> newsInfolist = newsInfoServiceImpl.findAllNewsInfo(6,(begin-1)*length + 1,begin*length);
		
		
		model.addAttribute("releaseList", newsInfolist);
		model.addAttribute("pageSize", pageSize);
		return "b_release";
	}
	
	/**
	 * 删除新闻
	 * @param n_id
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteRelease")
	public String deleteRelease(int n_id,Model model){
		News news = newsServiceImpl.findOneNewsByID(n_id);
		news.setN_state(5);
		if(newsServiceImpl.updateNews(news)){
			return showRelease(1,model);
		}else{
			return "error";
		}
	}
	
	/**
	 * 展示详情
	 * @param n_id
	 * @param model
	 * @return
	 */
	@RequestMapping("showDetails")
	public String showDetails(int n_id,Model model){
		NewsInfo news = newsInfoServiceImpl.findOneNewsInfoByNID(n_id);
		model.addAttribute("details", news);
		return "b_details";
	}
	
	/**
	 * 单个发布新闻
	 * @param model
	 * @return
	 */
	@RequestMapping("release")
	public String release(int n_id,Model model){
		//将新闻状态从6 ->  1
		News news = newsServiceImpl.findOneNewsByID(n_id);
		news.setN_state(1);
		if(newsServiceImpl.updateNews(news)){
			return showRelease(1,model);
		}else{
			return "error";
		}
	}
	
	/**
	 * 获取全部类型信息的AJAX
	 * @return
	 */
	@RequestMapping("/typeAjax")
	@ResponseBody
	public List<NewsType> newsTypeAjax(){
		return newsTypeServiceImpl.findAllNewsType();
	}
	
	
	/**
	 * 编辑新闻
	 * @param news
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("insertNews")
	public String insertNews(@RequestParam("file") MultipartFile file,News news,Model model) throws IOException{
		news.setN_id(newsServiceImpl.findMaxNewsID()+1);
		if("".equals(news.getN_author())||news.getN_author() == null){
			news.setN_author("匿名");
		}
		if("".equals(news.getN_roundup())||news.getN_roundup() == null){
			news.setN_roundup("无摘要信息！");
		}
		
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
			return showRelease(1,model);
		}else{
			return "error";
		}
	}
	
	/**
	 * 展示新闻管理界面
	 * @param begin
	 * @param model
	 * @return
	 */
	@RequestMapping("showNewsInfom")
	public String showNewsInfo(@RequestParam(value="type_id",required=false) Integer type_id,Integer begin,Model model){
		if(type_id != null){
			if(begin == null){
				begin = 1;
			}
			int pageSize = 1;
			List<NewsInfo> showNewsInfo = newsInfoServiceImpl.findAllNewsInfomByType(type_id, begin, 6);
			
			model.addAttribute("showNewsInfo", showNewsInfo);
			model.addAttribute("pageSize", pageSize);
			return "b_newsTable";
		}else{
			if(begin == null){
				begin = 1;
			}
			int length = 6;
			int pageSize=1;
			List<NewsInfo> showNewsInfo = newsInfoServiceImpl.findAllNewsInfom((begin-1)*length+1,begin*length);
			List<News> sizeTemp = newsServiceImpl.findAllNews();
			int size = sizeTemp.size();
			
			if(size%length == 0 && size >= length){
				pageSize = size/length;
			}else{
				pageSize = size/length+1;
			}
			model.addAttribute("showNewsInfo", showNewsInfo);
			model.addAttribute("pageSize", pageSize);
			return "b_newsTable";
		}
	}
	
	/**
	 * 按类型展示新闻管理界面
	 * @param begin
	 * @param model
	 * @return
	 */
	@RequestMapping("showNewsByType")
	public String showNewsByType(@RequestParam("type_id") Integer type_id,Integer begin,Model model){
		begin = 1;
		List<NewsInfo> showNewsInfo = newsInfoServiceImpl.findAllNewsInfomByType(type_id, begin, 6);
		model.addAttribute("showNewsInfo", showNewsInfo);
		return "b_newsTable";
	}
	
	
	/**
	 * 修改新闻信息
	 * @param n_id
	 * @param model
	 * @return String
	 */
	@RequestMapping("updateNews")
	public String updateNews(Integer n_id,Model model){
		News news = newsServiceImpl.findOneNewsByID(n_id);
		List<NewsType> types = newsTypeServiceImpl.findAllNewsType();
		model.addAttribute("news", news);
		model.addAttribute("types", types);
		
		return "b_updateNews";
	}
	
	@RequestMapping("updateNews2")
	public String updateNews2(@RequestParam("file") MultipartFile file,News news,Model model) throws IOException{
		if(file.getOriginalFilename() != null && !"".equals(file.getOriginalFilename())){
			//文件保存
			String path = servletContext.getRealPath("/jsp/img/news");//通过servletContext获取项目的绝对路径
			news.setN_img(file.getOriginalFilename());//图片名
			File targetFile = new File(path+"\\"+file.getOriginalFilename());//文件保存路径+文件名称
			FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
		}
		if(newsServiceImpl.updateNews2(news) > 0){
			return showDetails(news.getN_id(),model);
		}else{
			return "error";
		}
	}
	
	
}
