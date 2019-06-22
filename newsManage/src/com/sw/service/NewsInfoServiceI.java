package com.sw.service;

import java.util.List;

import com.sw.entity.NewsInfo;
/**
 * NewsInfoServiceI 接口
 * @author 顿盛华
 *
 */
public interface NewsInfoServiceI {
	
	/**
	 * 查询所有发布新闻实体(分页)
	 * @return
	 */
	public List<NewsInfo> findAllNewsInfo(int n_state,int begin,int end);
	
	/**
	 * 查询单个新闻实体
	 * @param n_id 文章编号
	 * @return NewsInfo 新闻实体
	 */
	public NewsInfo findOneNewsInfoByNID(int n_id);
	/**
	 * 查询所有发布新闻实体(分页) 
	 * @param begin 起始条目
	 * @param end 结束条目
	 * @return List<NewsInfo>
	 */
	public List<NewsInfo> findAllNewsInfom(int begin,int end);
	/**
	 * 
	 * @param type_id 新闻类型ID
	 * @param begin 起始条目
	 * @param end 结束条目
	 * @return
	 */
	public List<NewsInfo> findAllNewsInfomByType(int type_id,int begin,int end);

}
