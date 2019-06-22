package com.sw.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sw.entity.FeedBack;

/**
 * 反馈信息DAO接口
 * @author 顿盛华
 *
 */
@Repository
public interface FeedBackDaoI {
	//新增反馈信息，删除反馈信息，查询反馈信息
	/**
	 * 插入反馈信息
	 * @param feedBack 反馈信息实体
	 * @return int
	 */
	public int insertFeedBack(FeedBack feedBack);
	/**
	 * 删除反馈信息
	 * @param feedBack 反馈信息实体
	 * @return int
	 */
	public int deleteFeedBack(FeedBack feedBack);
	
	/**
	 * 查询所有反馈信息
	 * @return List<FeedBack>
	 */
	public List<FeedBack> findAllFeedBack();
	
	/**
	 * 查询单个反馈信息
	 * @param feedBack 反馈信息实体
	 * @return FeedBack 反馈信息实体
	 */
	public FeedBack findOneFeedBack(FeedBack feedBack);
}
