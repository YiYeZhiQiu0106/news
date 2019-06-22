package com.sw.controller.adm;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sw.entity.Manages;
import com.sw.service.ManagesServiceI;

/**
 * 管理员action
 * @author 顿盛华
 *
 */
@Controller
@RequestMapping("/b_adm")
public class AdmManageAction {
	
	@Resource
	private ManagesServiceI managesServiceImpl;
	
	@RequestMapping("/login")
	public String login(Manages manages,HttpServletRequest request){
		System.out.println("进入login方法...");
		Manages temp = managesServiceImpl.findOneManages(manages.getM_tel());
		
		if(temp != null && manages.getM_pwd().equals(temp.getM_pwd())){
			HttpSession session = request.getSession();
			session.setAttribute("adm", temp);
			return "b_index";
		}else{
			request.setAttribute("info", "error");
			return "b_login";
		}
	}
	
	/**
	 *  从session获取管理员信息ajax
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAdmName")
	@ResponseBody
	public Map<String,Object> getAdmName(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session != null){
			Manages manages = (Manages)session.getAttribute("adm");
			if(manages != null){
				Map<String,Object> map = new HashMap<String, Object>();
				if(manages.getM_idNumber() != null && !"".equals(manages.getM_idNumber()) && manages.getM_idNumber().length() == 18 ){
					manages.setM_idNumber(manages.getM_idNumber().substring(0,4)+"**********"+manages.getM_idNumber().substring(14));
				}
				map.put("adm", manages);
				return map;
			}
		}
		return null;
	}
	
	/**
	 * 修改密码
	 * @param m_id
	 * @return String
	 */
	@RequestMapping("updatePWD")
	public String updatePWD(String m_tel,Model model){
		model.addAttribute("m_tel", m_tel);
		return "b_updateManage";
	}
	
	@RequestMapping("updateManage")
	public String updateManage(@RequestParam("m_pwd2") String m_pwd2,Manages manages,Model model){
		Manages temp = managesServiceImpl.findOneManages(manages.getM_tel());
		
		if(temp.getM_idNumber().equals(manages.getM_idNumber()) && temp.getM_pwd().equals(manages.getM_pwd())){
			temp.setM_pwd(m_pwd2);
			if(managesServiceImpl.updateManages(manages)){
				return "b_login";
			}else{
				model.addAttribute("error", "error");
				model.addAttribute("m_tel", manages.getM_tel());
				return "b_updateManage";
			}
		}else{
			model.addAttribute("error", "error");
			model.addAttribute("m_tel", manages.getM_tel());
			return "b_updateManage";
		}
		
	}
}
