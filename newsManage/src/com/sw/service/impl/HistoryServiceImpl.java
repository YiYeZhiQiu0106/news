package com.sw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sw.dao.HistoryDaoI;
import com.sw.entity.History;
import com.sw.entity.PageBean;
import com.sw.service.HistoryServiceI;
/**
 * 收藏历史记录service实现类
 * @author 顿盛华
 *
 */
@Service
public class HistoryServiceImpl implements HistoryServiceI{
	
	@Resource
	private HistoryDaoI historyDaoImpl;
	
	public boolean insertHistory(History history) {
		if(historyDaoImpl.insertHistory(history)>0){
			return true;
		}
		return false;
	}

	public boolean updateHistory(History history) {
		if(historyDaoImpl.updateHistory(history)>0){
			return true;
		}
		return false;
	}

	public History findOneHistory(History history) {
		
		return historyDaoImpl.findOneHistory(history);
	}

	public int findMaxHistoryID() {
		return historyDaoImpl.findMaxHistoryID();
	}

	public List<History> findAllHistory(int begin, int end) {
		return historyDaoImpl.findAllHistory(begin, end);
	}

	public int getCountHistorys() {
		return historyDaoImpl.getCountHistorys();
	}

}
