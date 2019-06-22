package com.sw.service;

import java.util.List;

import com.sw.entity.HistoryInfo;

/**
 * 收藏历史记录信息service接口
 * @author 顿盛华
 *
 */
public interface HistoryInfoServiceI {
	
	/**
	 * 查询所有收藏历史记录信息
	 * @param begin 起始条目
	 * @param end 结束条目
	 * @return List<HistoryInfo>
	 */
	public List<HistoryInfo> findAllInfo(int begin,int end);
	
	/**
	 * 按照类型查询所收藏历史记录信息
	 * @param type_id 文章类型ID
	 * @param begin 起始条目
	 * @param end 结束条目
	 * @return List<HistoryInfo>
	 */
	public List<HistoryInfo> findAllHistoryInfoByType(int type_id,int begin,int end);

}
