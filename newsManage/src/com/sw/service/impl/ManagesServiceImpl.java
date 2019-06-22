package com.sw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sw.dao.ManagesDaoI;
import com.sw.entity.Manages;
import com.sw.service.ManagesServiceI;
/**
 * 管理员信息service实现类
 * @author 顿盛华
 *
 */
@Service
public class ManagesServiceImpl implements ManagesServiceI{
	@Resource
	private ManagesDaoI managesDaoImpl;
	public boolean insertManages(Manages manages) {
		if(managesDaoImpl.insertManages(manages)>0){
			return true;
		}
		return false;
	}

	public boolean updateManages(Manages manages) {
		if(managesDaoImpl.updateManages(manages)>0){
			return true;
		}
		return false;
	}

	public Manages findOneManages(String m_tel) {
		
		return managesDaoImpl.findOneManages(m_tel);
	}

	public List<Manages> findAllManages() {
		
		return managesDaoImpl.findAllManages();
	}

}
