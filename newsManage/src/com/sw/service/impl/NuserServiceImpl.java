package com.sw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sw.dao.NewsDaoI;
import com.sw.dao.NuserDaoI;
import com.sw.entity.Nuser;
import com.sw.service.NuserServiceI;
/**
 * 用户信息Service实现
 * @author 顿盛华
 *
 */
@Service
public class NuserServiceImpl implements NuserServiceI{
	@Resource
	private NuserDaoI nuserDaoImpl;
	
	public List<Nuser> getCount() {
		return nuserDaoImpl.getCount();
	}
	public List<Nuser> findAllUser(int startIndex, int endIndex) {
		return nuserDaoImpl.findAllUser(startIndex, endIndex);
	}

	public List<Nuser> findAllUserByName(String uname, int startIndex,
			int endIndex) {
		return nuserDaoImpl.findAllUserByName(uname, startIndex, endIndex);
	}

	public int insertUser(Nuser nuser) {
		int i = nuserDaoImpl.insertUser(nuser);
		return i;
	}

	public Nuser findOneUserByUid(int u_id) {
		return nuserDaoImpl.findOneUserByUid(u_id);
	}

	public int updateUser(Nuser nuser) {
		int i = nuserDaoImpl.updateUser(nuser);
		return i;
	}

	public int deleteUser(int u_id) {
		int i = nuserDaoImpl.deleteUser(u_id);
		return i;
	}

	
	public Nuser oNlogin(String u_phone) {
		return nuserDaoImpl.oNlogin(u_phone);
	}

	public Nuser findOneUserByID(int u_id) {
		return nuserDaoImpl.findOneUserByID(u_id);
	}
	public List<Nuser> getCountUser(String name) {
		return nuserDaoImpl.getCountUser(name);
	}
}