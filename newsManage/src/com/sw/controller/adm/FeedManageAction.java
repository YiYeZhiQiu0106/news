package com.sw.controller.adm;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * 反馈信息Action
 * @author 顿盛华
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sw.entity.FeedBack;
import com.sw.entity.FeedInfo;
import com.sw.entity.Nuser;
import com.sw.service.FeedBackServiceI;
import com.sw.service.NuserServiceI;
@Controller
@RequestMapping("/b_feed")
public class FeedManageAction {
	@Resource
	private FeedBackServiceI feedBackServiceI;
	@Resource
	private NuserServiceI nuserServiceImpl;
	
	/**
	 * 第一次访问，传递总页数
	 * @param model
	 * @return 
	 */
	@RequestMapping("/showfeed")
	public String showFeed(Model model){
		int count = feedBackServiceI.findAllFeedBack().size();
		int length = 5;
		int page = 1;
		if(count%length == 0 && count >= length){
			page = count/length;
		}else{
			page = count/length+1;
		}
		model.addAttribute("page", page);
		return "b_feedbackTable";
	}

	/**
	 * ajax加载数据
	 * @param begin
	 * @param model
	 * @return
	 */
	@RequestMapping("/ajaxShowfeed")
	@ResponseBody
	public List<FeedInfo> ajaxShowfeed(@RequestParam(value="begin",required=false) Integer begin,Model model){
		if(begin == null){
			begin = 1;
		}
		List<FeedBack> feed = feedBackServiceI.findAllFeedBack();
		int count = feedBackServiceI.findAllFeedBack().size();
		int length = 5;
		int page = 1;
		if(count%length == 0 && count >= length){
			page = count/length;
		}else{
			page = count/length+1;
		}
		List<FeedInfo> list = new ArrayList<FeedInfo>();
		
		for (FeedBack feedBack : feed) {
			Nuser nuser = nuserServiceImpl.findOneUserByID(feedBack.getU_id());
			FeedInfo info = new FeedInfo(feedBack.getF_id(), feedBack.getF_text(), nuser.getU_name(), nuser.getU_age(), nuser.getU_phone(), feedBack.getF_time());
			list.add(info);
		}
		model.addAttribute("page", page);
		return list;
	}
	
	/**
	 * 删除反馈信息
	 * @param f_id 反馈信息ID
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteFeed")
	public String deleteFeed(Integer f_id,Model model){
		FeedBack feedBack = new FeedBack();
		feedBack.setF_id(f_id);
		if(feedBackServiceI.deleteFeedBack(feedBack)){
			return showFeed(model);
		}else{
			return "error";
		}
	}
	
}
