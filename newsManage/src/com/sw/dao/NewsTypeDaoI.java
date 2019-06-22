package com.sw.dao;

import java.util.List;

import com.sw.entity.NewsType;

/**
 * 新闻类型DAO接口
 * @author 顿盛华
 *
 */
public interface NewsTypeDaoI {
	//1.查询所有新闻类型，2.查询单个新闻类型，3.新增新闻类型，4.修改新闻类型，5.删除新闻类型
	/**
	 * 查询所有类型
	 * @param newsType
	 * @return List<NewsType>
	 */
	public List<NewsType> findAllNewsType();
	
	/**
	 * 查询单个新闻信息，要求：可以根据ID或者TypeName查询
	 * @param newsType 新闻类型实体
	 * @return NewsType
	 */
	public NewsType findOneNewsType(NewsType newsType);
	
	/**
	 * 插入新闻类型信息。
	 * @param newsType 新闻类型实体
	 * @return int
	 */
	public int insertNewsType(NewsType newsType);
	
	/**
	 * 修改新闻类型信息。
	 * @param newsType 新闻类型实体
	 * @return int
	 */
	public int updateNewsType(NewsType newsType);
	
	/**
	 * 删除新闻类型
	 * @param newsType 新闻类型实体
	 * @return int
	 */
	public int deleteNewsType(NewsType newsType);
	/**
	 * 模糊查询新闻类型，要求：可以根据新闻类型ID或name查询
	 * @param newsType 新闻类型实体
	 * @return NewsType
	 */
	public List<NewsType> findVagueNewsType(NewsType newsType);
	
	/**
	 * 根据新闻类型ID查找新闻类型
	 * @param typeid 新闻类型ID
	 * @return NewsType
	 */
	public NewsType findTypnamebyTypeid(int typeid);
	/**
	 * 分页查询
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<NewsType> pageNewsType(int begin,int end);

	
	
}
