package com.sw.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sw.dao.FeedBackDaoI;
import com.sw.entity.FeedBack;
import com.sw.service.FeedBackServiceI;
/**
 * 反馈信息service实现类
 * @author 顿盛华
 *
 */
@Service
public class FeedBackServiceImpl implements FeedBackServiceI{
	@Resource
	private FeedBackDaoI feedBackDaoImpl;
	public boolean insertFeedBack(FeedBack feedBack) {
		if(feedBackDaoImpl.insertFeedBack(feedBack)>0){
			return true;
		}
		return false;
	}

	public boolean deleteFeedBack(FeedBack feedBack) {
		if(feedBackDaoImpl.deleteFeedBack(feedBack)>0){
			return true;
		}
		return false;
	}

	public List<FeedBack> findAllFeedBack() {
		
		return feedBackDaoImpl.findAllFeedBack();
	}

	public FeedBack findOneFeedBack(FeedBack feedBack) {
		
		return feedBackDaoImpl.findOneFeedBack(feedBack);
	}

}
