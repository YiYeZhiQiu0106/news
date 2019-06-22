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
import com.sw.entity.Nuser;
import com.sw.service.NuserServiceI;

/**
 * 后台用户资料管理
 * @author 左
 *
 */
@Controller
@RequestMapping("/b_users")
public class UserMangeAction {
	
	@Resource
	private NuserServiceI userServiceImpl;
	
	@RequestMapping("showNuser")
	public String showNuser(@RequestParam(value="pagination",required=false) Integer pagination,Model model){
		if(pagination == null){
			pagination = 1;
		}
		List<Nuser> list = userServiceImpl.getCount();
		 //获取总条数all  页数pagination  总页数page
		int all=list.size();
		 int page =0;
		 if(all%5 == 0 && all >= 5){
			 page = all/5;
		 }else {
			 page = all/5 +1;
		}
		 model.addAttribute("page", page);
		 return "b_userTable";
	}
	
	//分页查询  一页五条
	@RequestMapping("pageNuser")
	@ResponseBody
    public List<Nuser> pageNuser(Integer pagination,Model model){
		if(pagination == null){
			pagination = 1;
		}
		List<Nuser> list = userServiceImpl.getCount();
		 //获取总条数all  页数pagination  总页数page
		int all=list.size();
		 int page =0;
		 if(all%5 == 0 && all >= 5){
			 page = all/5;
		 }else {
			 page = all/5 +1;
		}
		 model.addAttribute("page", page);
		 int startIndex = (pagination-1)*5+1;
		 int endIndex = pagination*5;
		 List<Nuser> list2 = userServiceImpl.findAllUser(startIndex, endIndex);
		 return list2;
	}
	
	
	//添加用户
	@RequestMapping("insertUser")
	public String insertUser(Nuser nuser){
		userServiceImpl.insertUser(nuser);
		return "b_userTable";
	}
	
	//修改用户
		@RequestMapping("updateUser")
		public String updateUser(Nuser nuser){
			boolean flag1 = true;
			boolean flag2 = true;
			boolean flag3 = true;
			if("".equals(nuser.getU_name())){
				nuser.setU_name(null);
				flag1=false;
			}
			if("".equals(nuser.getU_age())){
				nuser.setU_age(0);
				flag2=false;
			}
			if("".equals(nuser.getU_phone())){
				nuser.setU_phone(null);
				flag3=false;
			}
			
			userServiceImpl.updateUser(nuser);
			return "b_userTable";
		}
		
	//删除用户
	@RequestMapping("deleteUser")
	public String deleteUser(int u_id){
		userServiceImpl.deleteUser(u_id);
		return "b_userTable";
	}
	
	//根据姓名name模糊查询分页
		@RequestMapping("findAllUserByName")
		@ResponseBody
		public List<Nuser> findAllUserByName(String name,Integer pagination,Model model){
			if(pagination == null){
				pagination = 1;
			}
			List<Nuser> list = userServiceImpl.getCountUser(name);
			 //获取总条数all  页数pagination  总页数page
			int all=list.size();
			 int page =0;
			 if(all%5 == 0 && all >= 5){
				 page = all/5;
			 }else {
				 page = all/5 +1;
			}
			 model.addAttribute("page", page);
			 int startIndex = (pagination-1)*5+1;
			 int endIndex = pagination*5;
			 List<Nuser> list2 = userServiceImpl.findAllUserByName(name, startIndex, endIndex);
			 return list2;
		}
}
