package com.sw.dao;

import java.util.List;

import com.sw.entity.News;
import com.sw.entity.PageBean;

/**
 * 新闻信息DAO接口
 * @author 顿盛华
 *
 */
public interface NewsDaoI {
	
	//文章操作：1.新增新闻，2.修改新闻，删除新闻（修改新闻的状态）
	//4.按照类型查询新闻，5.按照新闻ID查询新闻，6.按照标题模糊查询新闻，
	/**
	 * 插入新闻信息
	 * @param news 新闻信息实体
	 * @return boolean
	 */
	public int insertNews(News news);
	
	/**
	 * 修改新闻信息
	 * @param news 新闻信息实体
	 * @return boolean
	 */
	public int updateNews(News news);
	
	/**
	 * 根据类型ID查询新闻信息，支持分页
	 * @param typeId 新闻类型ID startIndex 分页的起始位置  endIndex 分页的结束位置
	 * @return List<News>
	 */
	public List<News> findNewsByType(int typeId,int startIndex,int endIndex);
	
	/**
	 * 根据新闻ID精确查询单个新闻
	 * @param n_id 新闻ID 
	 * @return News
	 */
	public News findOneNewsByID(int n_id);
	
	/**
	 * 根据新闻标题模糊查询新闻信息,支持分页
	 * @param n_title 新闻标题 s tartIndex 分页的起始位置  endIndex 分页的结束位置
	 * @return List<News>
	 */
	public List<News> findNewsByTitle(String n_title,int startIndex,int endIndex);
	/**
	 * 查询总数
	 * @param news 新闻信息实体
	 * @return int
	 */
	public int getCount(News news);
	
	/**
	 * 按照新闻状态查询新闻
	 * @param n_state
	 * @return
	 */
	public List<News> findNewsByState(int n_state);
	
	/**
	 * 查找所有的新闻信息
	 * @return List<News>
	 */
	public List<News> findAllNews();
	
	/**
	 * 查询当前最大的新闻ID
	 * @return int
	 */
	public int findMaxNewsID();
	
	/**
	 * 修改新闻信息。(支持任意缺省字段)
	 * @param news
	 * @return int
	 */
	public int updateNews2(News news);
	
	/**
	 * 按照新闻的类型ID和状态查找新闻
	 * @param typeId
	 * @param n_state
	 * @return List<News>
	 */
	public List<News> findNewsByTypeIdAndState(int typeId, int n_state);
	
	/**
	 * 按照新闻的类型ID查找对应类型ID的所有新闻
	 * @param type_id  新闻类型ID
	 * @return 
	 */
	public List<News> findbyTypeId(int type_id);
	
	
	/**
	 * 根据新闻的标题模糊查找所有符合条件的新闻
	 * @param n_title 新闻标题
	 * @return List<News>
	 */
	public List<News> findAllNewsByTitle(String n_title);
	
	/**
	 * 根据作者/用户名查找所有新闻 分页
	 * @param n_author 作者名/用户名
	 * @return List<News>
	 */
	public List<News> findAllNewsByauthor(String n_author,int startIndex,int endIndex);
	
	/**
	 * 根据作者/用户名查找所有新闻
	 * @param n_author 作者名/用户名
	 * @returnList<News>
	 */
	public List<News> findAllByauthor(String n_author);
	
}
