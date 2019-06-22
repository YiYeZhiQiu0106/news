package com.sw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sw.dao.NewsInfoDaoI;
import com.sw.entity.NewsInfo;
import com.sw.service.NewsInfoServiceI;
/**
 * NewsInfoServiceI 实现
 * @author 顿盛华
 *
 */
@Service
public class NewsInfoServiceImpl implements NewsInfoServiceI{

	@Resource
	private NewsInfoDaoI newsInfoDaoImpl;
	
	public List<NewsInfo> findAllNewsInfo(int n_state,int begin,int end) {
		return newsInfoDaoImpl.findAllNewsInfo(n_state,begin,end);
	}

	public NewsInfo findOneNewsInfoByNID(int n_id) {
		return newsInfoDaoImpl.findOneNewsInfoByNID(n_id);
	}

	public List<NewsInfo> findAllNewsInfom(int begin, int end) {
		return newsInfoDaoImpl.findAllNewsInfom(begin, end);
	}

	public List<NewsInfo> findAllNewsInfomByType(int type_id, int begin, int end) {
		return newsInfoDaoImpl.findAllNewsInfomByType(type_id, begin, end);
	}

}
