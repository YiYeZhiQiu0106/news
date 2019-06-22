package com.sw.controller.adm;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sw.entity.NewsType;
import com.sw.service.NewsTypeServiceI;

/**
 * 后台：新闻类型操作
 * @author 左
 *
 */
@Controller
@RequestMapping("/b_type")
public class TypeManageAction {

	 @Resource
	 private NewsTypeServiceI newsTypeServiceImpl;
	 

	 
	 //删除类型
	 @RequestMapping("deleteNewsType")
	 public String deleteNewsType(String type_id){
		 NewsType newsType = new NewsType();
		 newsType.setType_id(Integer.parseInt(type_id));
		 NewsType type1 = newsTypeServiceImpl.findOneNewsType(newsType);
		 boolean flag = newsTypeServiceImpl.deleteNewsType(type1);
		 if(flag){
			 return "b_typeTable";
		 }else {
			return "b_typeTable";
		}
		 
	 }
	 
	 //修改类型
	 @RequestMapping("updateNewsType")
	 public String updateNewsType(NewsType newsType){
		 boolean flag = true;
		 boolean flag1 = true;
		 if("".equals(newsType.getType_name())){
			 newsType.setType_name(null);
			 flag = false;
		 }
		 if("".equals(newsType.getType_introduce())){
			 newsType.setType_introduce(null);
			 flag1 = false;
		 }
		 if(!flag && !flag1){
			 return "b_typeTable";
		 }else{
			 newsTypeServiceImpl.updateNewsType(newsType);
			 return "b_typeTable";
		 }
		
	 }
	 
	 //添加类型
	 @RequestMapping("insertNewsType")
	 public String insertNewsType(NewsType newsType){
		 System.out.println(newsType);
		 newsTypeServiceImpl.insertNewsType(newsType);
		 return "forward:findAllNewsType.action";
	 }
	 
	 //显示所有
	 @RequestMapping("/findAllNewsType")
	 public String findAllNewsType(@RequestParam(value="Integer",required=false) Integer pagination,Model model){
		 if(pagination == null){
				pagination = 1;
		 }
		 List<NewsType> list = newsTypeServiceImpl.findAllNewsType();
		 //获取总条数all  页面当前页数pagination  page总页数
		 int all = list.size();
		 int page ;
		 if(all%5 == 0 && all >= 5){
			 page=all/5;
		 }else {
			page=all/5+1;
		}
		 model.addAttribute("page", page);
		  return "b_typeTable";
	 }
	 
	 //分页查询 一页5条
	 @RequestMapping("pageNewsType")
	 @ResponseBody
	 public List<NewsType> pageNewsType(Integer pagination,HttpServletRequest request){
		 if(pagination == null){
				pagination = 1;
		 }
		 List<NewsType> list = newsTypeServiceImpl.findAllNewsType();
		 //获取总条数all  页面当前页数pagination  page总页数
		 int all = list.size();
		 int page ;
		 if(all%5 == 0 && all >= 5){
			 page=all/5;
		 }else {
			page=all/5+1;
		}
		 request.setAttribute("page", page);
		 int begin = (pagination-1)*5+1;
		 int end = pagination*5;
		 List<NewsType> list2 = newsTypeServiceImpl.pageNewsType(begin, end);
		 return list2;
	 }
}
