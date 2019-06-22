package com.sw.controller;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
/**
 * 前台收藏新闻的action
 * @author 顿盛华
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sw.entity.Collectioned;
import com.sw.entity.Nuser;
import com.sw.service.CollectionedServiceI;
import com.sw.service.NewsServiceI;
@Controller
@RequestMapping("collectioned")
public class CollectionedAction {
	
	@Resource
	private CollectionedServiceI collectionedServiceImpl;
	@Resource
	private NewsServiceI newsServiceImpl;
	
	@RequestMapping("/conllection")
	@ResponseBody
	public Map<String, String> conllection(@RequestParam(value="n_id",required=false) Integer n_id,HttpServletRequest request){
		HttpSession session =  request.getSession(false);
		Map<String, String> temp = new HashMap<String, String>();
		
		temp.put("mess", "error");
		
		if(n_id == null){
			return temp;
		}else if(session != null && session.getAttribute("nuser")!=null){
			Nuser nuser = (Nuser)session.getAttribute("nuser");
			Date date = new Date();
			Collectioned collection =  new Collectioned();
			Timestamp c_time = new Timestamp(date.getTime());
			collection.setC_time(c_time);
			collection.setN_id(n_id);
			collection.setU_id(nuser.getU_id());
 			if(collectionedServiceImpl.insertCollection(collection)){
 				temp.put("mess", "success");
 				return temp;
 			}
		}
		return temp;
	}
}
