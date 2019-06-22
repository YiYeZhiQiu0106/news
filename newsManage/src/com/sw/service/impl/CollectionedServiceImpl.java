package com.sw.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sw.dao.CollectionedDaoI;
import com.sw.dao.HistoryDaoI;
import com.sw.entity.Collectioned;
import com.sw.entity.History;
import com.sw.service.CollectionedServiceI;


/**
 * 收藏信息service实现类
 * @author 顿盛华
 *
 */
@Service
public class CollectionedServiceImpl implements CollectionedServiceI{
	
	@Resource
	private CollectionedDaoI collectionDaoImpl;
	
	@Resource
	private HistoryDaoI historyDaoImpl;
	
	public boolean insertCollection(Collectioned collection) {
		if(collectionDaoImpl.insertCollection(collection) > 0){
			History history = new History();
			history.setN_id(collection.getN_id());
			history = historyDaoImpl.findOneHistory(history);
			history.setH_degree(history.getH_degree()+1);
			
			historyDaoImpl.updateHistory(history);
			
			return true;
		}
		return false;
	}

	public boolean deleteCollection(Collectioned collection) {
		if(collectionDaoImpl.deleteCollection(collection) > 0){
			History history = new History();
			history.setN_id(collection.getN_id());
			history = historyDaoImpl.findOneHistory(history);
			history.setH_degree(history.getH_degree()-1);
			
			if(historyDaoImpl.updateHistory(history) > 0){
				return true;
			}else{
				return false;
			}
		}
		return false;
	}
	
	public List<Collectioned> findCollectionByUid(int u_id) {
		return collectionDaoImpl.findCollectionByUid(u_id);
	}

	public List<Collectioned> findCollectionByUidPage(int u_id, int startIndex,
			int endIndex) {
		return collectionDaoImpl.findCollectionByUidPage(u_id, startIndex, endIndex);
	}

	public Collectioned findOneCollection(int u_id, int n_id) {
		return collectionDaoImpl.findOneCollection(u_id, n_id);
	}
}
