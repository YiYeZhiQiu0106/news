package com.sw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sw.dao.NewsTypeDaoI;
import com.sw.entity.NewsType;
import com.sw.service.NewsTypeServiceI;
/**
 * 新闻类型信息service实现类
 * @author 顿盛华
 *
 */
@Service
public class NewsTypeServiceImpl implements NewsTypeServiceI{
	@Resource
	private  NewsTypeDaoI newsTypeDaoImpl;
	
	public List<NewsType> findAllNewsType() {
		
		return newsTypeDaoImpl.findAllNewsType();
	}

	public NewsType findOneNewsType(NewsType newsType) {
		
		return newsTypeDaoImpl.findOneNewsType(newsType);
	}

	public boolean insertNewsType(NewsType newsType) {
		if(newsTypeDaoImpl.insertNewsType(newsType)>0){
			return true;
		}
		return false;
	}

	public boolean updateNewsType(NewsType newsType) {
		if(newsTypeDaoImpl.updateNewsType(newsType)>0){
			return true;
		}
		return false;
	}

	public boolean deleteNewsType(NewsType newsType) {
		if(newsTypeDaoImpl.deleteNewsType(newsType)>0){
			return true;
		}
		return false;
	}

	public List<NewsType> findVagueNewsType(NewsType newsType) {
		return newsTypeDaoImpl.findVagueNewsType(newsType);
	}

	public NewsType findTypnamebyTypeid(int typeid) {
		return newsTypeDaoImpl.findTypnamebyTypeid(typeid);
	}
	public List<NewsType> pageNewsType(int begin, int end) {
		return newsTypeDaoImpl.pageNewsType(begin, end);
	}
}
