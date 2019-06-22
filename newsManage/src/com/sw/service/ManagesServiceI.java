package com.sw.service;

import java.util.List;

import com.sw.entity.Manages;

/**
 * 管理员信息Service接口
 * @author 顿盛华
 *
 */
public interface ManagesServiceI {
	//新增管理员，修改密码，查询单个管理员，查询所有管理员，
		/**
		 * 新增管理
		 * @param manages 管理员实体
		 * @return boolean
		 */
		public boolean insertManages(Manages manages);
		
		/**
		 * 修改管理员信息
		 * @param manages 管理员实体
		 * @return boolean  
		 */
		public boolean updateManages(Manages manages);
		
		/**
		 * 查询单个管理员
		 * @param m_tel 手机号码
		 * @return Manages 管理员实体
		 * 
		 */
		public Manages findOneManages(String m_tel);
		
		/**
		 * 查询所有管理员
		 * @return
		 */
		public List<Manages> findAllManages();
}
