package com.sw.controller;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sw.entity.Nuser;
import com.sw.service.NuserServiceI;

/**
 * 用户登录注册的Action
 * @author 左
 *
 */
@Controller
@RequestMapping("/user")
public class LoginAction {
	
	@Resource
	private NuserServiceI nuserServiceImpl;

	@RequestMapping("/login")
	public String login(Nuser nuser,Model model,HttpServletRequest request) {
		System.out.println(nuser.getU_phone()+"----"+nuser.getU_pwd());
		Nuser user1 =nuserServiceImpl.oNlogin(nuser.getU_phone());
		if(user1 != null && nuser.getU_pwd().equals(user1.getU_pwd())){
			request.getSession().setAttribute("nuser",user1);
			request.removeAttribute("lose");
			return "redirect:/news/findAllNews.action";
		}else{
			request.setAttribute("lose", "lose");
			return "login";
		}
	}
	 
	@RequestMapping("/register")
	 public String register(Nuser nuser,HttpServletRequest request){
		//判断手机号是否被注册
		Nuser user1=nuserServiceImpl.oNlogin(nuser.getU_phone());
		if(user1==null){//手机号没有被注册
			 //Timesramp类获取当前系统时间
			 nuser.setU_time(new Timestamp(System.currentTimeMillis()));
			 nuserServiceImpl.insertUser(nuser);
			 return "login";
		}else {//手机号已经被注册
			request.setAttribute("register", "注册失败，手机号已被注册");
			return "register";
		}
	 }
}
