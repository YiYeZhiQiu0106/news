package com.sw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sw.dao.HistoryDaoI;
import com.sw.dao.NewsDaoI;
import com.sw.entity.History;
import com.sw.entity.News;
import com.sw.service.NewsServiceI;
/**
 * 新闻信息service实现类
 * @author 顿盛华
 *
 */
@Service
public class NewsServiceImpl implements NewsServiceI{
	
	@Resource
	private NewsDaoI newsDaoImpl;
	@Resource
	private HistoryDaoI historyDaoImpl;
	
	/**
	 * 插入新闻信息的时候同时产生一条新的收藏历史记录，收藏次数默认0
	 */
	public boolean insertNews(News news) {
		if(newsDaoImpl.insertNews(news)>0){
			History history = new History(historyDaoImpl.findMaxHistoryID()+1, news.getN_id(), 0);
			historyDaoImpl.insertHistory(history);
			return true;
		}
		return false;
	}
	
	public boolean updateNews(News news) {
		if(newsDaoImpl.updateNews(news)>0){
			return true;
		}
		return false;
	}

	public List<News> findNewsByType(int typeId, int startIndex, int endIndex) {
		return newsDaoImpl.findNewsByType(typeId, startIndex, endIndex);
	}

	public News findOneNewsByID(int n_id) {
		return newsDaoImpl.findOneNewsByID(n_id);
	}

	public List<News> findNewsByTitle(String n_title, int startIndex,
			int endIndex) {
		return newsDaoImpl.findNewsByTitle(n_title, startIndex, endIndex);
	}

	public List<News> findNewsByState(int n_state) {
		return newsDaoImpl.findNewsByState(n_state);
	}

	public List<News> findAllNews() {
		return newsDaoImpl.findAllNews();
	}

	public int findMaxNewsID() {
		return newsDaoImpl.findMaxNewsID();
	}

	public int updateNews2(News news) {
		return newsDaoImpl.updateNews2(news);
	}
	
	public List<News> findNewsByTypeIdAndState(int typeId, int n_state) {
		return newsDaoImpl.findNewsByTypeIdAndState(typeId,n_state);
	}

	public List<News> findbyTypeId(int type_id) {
		return newsDaoImpl.findbyTypeId(type_id);
	}

	public List<News> findAllNewsByTitle(String n_title) {
		return newsDaoImpl.findAllNewsByTitle(n_title);
	}
	
	public List<News> findAllNewsByauthor(String n_author,int startIndex,int endIndex) {
		return newsDaoImpl.findAllNewsByauthor(n_author, startIndex, endIndex);
				
	}

	public List<News> findAllByauthor(String n_author) {
		// TODO Auto-generated method stub
		return newsDaoImpl.findAllByauthor(n_author);
	}

}
