package com.sw.dao;

import java.util.List;

import com.sw.entity.Collectioned;

/**
 * 收藏信息DAO接口
 * @author 顿盛华
 *
 */
public interface CollectionedDaoI {
	//新增收藏，删除收藏，
	/**
	 * 新增收藏
	 * @param collection 收藏实体
	 * @return int
	 */
	public int insertCollection(Collectioned collection);
	
	/**
	 * 删除收藏
	 * @param collection 收藏实体
	 * @return int
	 */
	public int deleteCollection(Collectioned collection);
	
	/**
	 * 通过用户ID查找收藏记录
	 * @param u_id
	 * @return List<Collectioned>
	 */
	public List<Collectioned> findCollectionByUid(int u_id);
	
	/**
	 * 通过用户ID查找收藏记录 支持分页
	 * @param u_id 用户ID
	 * @param startIndex 分页起始位置
	 * @param endIndex 分页的结束位置
	 * @return
	 */
	public List<Collectioned> findCollectionByUidPage(int u_id,int startIndex,int endIndex);
	
	/**
	 * 根据用户ID和文章ID找收藏实体
	 * @param u_id 用户ID
	 * @param n_id 文章ID
	 * @return Collectioned
	 */
	public Collectioned findOneCollection(int u_id,int n_id);
	
}
