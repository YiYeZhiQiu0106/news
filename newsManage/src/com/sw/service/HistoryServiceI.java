package com.sw.service;

import java.util.List;

import com.sw.entity.History;
import com.sw.entity.PageBean;

/**
 * 收藏历史Service接口
 * @author 顿盛华
 *
 */
public interface HistoryServiceI {
	//新增收藏历史信息,修改/删除收藏历史
		/**
		 * 插入收藏历史记录
		 * @param history
		 * @return boolean
		 */
		public boolean insertHistory(History history);
		
		/**
		 * 修改收藏历史
		 * @param history 历史记录实体
		 * @return boolean
		 */
		public boolean updateHistory(History history);
		
		/**
		 * 查询单个历史记录
		 * @param history 收藏历史记录实体
		 * @return History 收藏历史记录实体
		 */
		public History findOneHistory(History history);
		
		/**
		 * 查询所有收藏历史记录,支持分页
		 * @return
		 */
		public List<History> findAllHistory(int begin,int end);
		
		/**
		 * 查询最大的收藏ID
		 * @return int
		 */
		public int findMaxHistoryID();
		/**
		 * 获取历史记录总数
		 * @return int
		 */
		public int getCountHistorys();
}
