package com.sw.dao;

import java.util.List;

import com.sw.entity.Nuser;
import com.sw.entity.PageBean;

/**
 * 用户信息DAO接口
 * @author 顿盛华
 *
 */
public interface NuserDaoI {
	
	//注册用户（插入），登录（查询单个），修改个人信息（修改），注销用户（删除）
	//查询所有用户，1.根据姓名模糊查询，2.根据手机号码模糊查询
	/**
	 * 查询总数，辅助分页
	 * @param nuser
	 * @return
	 */
	public List<Nuser> getCount();
	
	/**
	 * 查询所有用户，支持分页 
	 * @param startIndex 分页的起始位置  endIndex 分页的结束位置
	 * @return 
	 */
	public List<Nuser> findAllUser(int startIndex,int endIndex);
	
	/**
	 * 根据姓名模糊查询所有用户,支持分页
	 * @param uname用户名  startIndex 分页的起始位置  endIndex 分页的结束位置
	 * @return
	 */
	public List<Nuser> findAllUserByName(String uname,int startIndex,int endIndex);
	
	
	/**
	 * 插入用户
	 * @param nuser 用户实体
	 * @return 用户实体
	 */
	public int insertUser(Nuser nuser);
	
	/**
	 * 根据手机号码查询单个用户
	 * @return Nuser 用户实体
	 * @return tel 手机号码
	 */
	public Nuser findOneUserByUid(int u_id);
	
	/**
	 * 修改用户信息
	 * @param nuser 用户实体
	 * @return boolean
	 */
	public int updateUser(Nuser nuser);
	
	/**
	 * 删除用户信息
	 * @param u_id 用户ID
	 * @return int
	 */
	public int deleteUser(int u_id);
	
	/**
	 * 登录查询
	 * @param u_phone
	 * @param u_pwd
	 * @return
	 */
	public Nuser oNlogin(String u_phone);
	
	/**
	 * 根据用户ID查询单个用户
	 * @return Nuser 用户实体
	 * @return u_id 用户ID
	 */
	public Nuser findOneUserByID(int u_id);
	
	/**
	 * 根据姓名模糊查询所有用户
	 * @return
	 */
	public List<Nuser> getCountUser(String name);
}