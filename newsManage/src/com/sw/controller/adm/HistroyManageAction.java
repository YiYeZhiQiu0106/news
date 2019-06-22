package com.sw.controller.adm;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sw.dao.NewsInfoDaoI;
import com.sw.entity.History;
import com.sw.entity.HistoryInfo;
import com.sw.entity.NewsInfo;
import com.sw.service.HistoryInfoServiceI;
import com.sw.service.HistoryServiceI;

/**
 * 收藏历史记录action
 * @author 顿盛华
 *
 */
@Controller
@RequestMapping("/b_history")
public class HistroyManageAction {
	@Resource
	private HistoryServiceI historyServiceImpl;
	@Resource
	private NewsInfoDaoI newsInfoDaoImpl;
	/**
	 * 第一次访问，传递分页总页数
	 * @param model
	 * @return
	 */
	@RequestMapping("/showHistoryView")
	public String showHistoryView(Model model){
		int count = historyServiceImpl.getCountHistorys();
		int length = 5;
		int page = 1;
		if(count%length == 0 && count >= length){
			page = count/length;
		}else{
			page = count/length+1;
		}
		model.addAttribute("page", page);
		return "b_collectionTable";
	}
	
	@RequestMapping("ajaxHistoryView")
	@ResponseBody
	public List<HistoryInfo> ajaxHistoryView(Integer begin,Model model){
		if(begin == null){
			begin = 1;
		}
		int count = historyServiceImpl.getCountHistorys();
		int length = 5;
		int page = 1;
		if(count%length == 0 && count >= length){
			page = count/length;
		}else{
			page = count/length+1;
		}
		List<HistoryInfo> list = new ArrayList<HistoryInfo>();
		List<History> history = historyServiceImpl.findAllHistory((begin-1)*length + 1,begin*length);
		for (History history2 : history) {
			NewsInfo info = newsInfoDaoImpl.findOneNewsInfoByNID(history2.getN_id());
			String n_title = info.getN_title();
			String n_author = info.getN_author();
			String type_name = info.getType_name();
			HistoryInfo historyInfo = new HistoryInfo(history2.getH_id(), history2.getN_id(), n_title, n_author, info.getType_id(), type_name, history2.getH_degree());
			list.add(historyInfo);
		}
		model.addAttribute("page", page); //总页数
		return list;
	}
	
}
