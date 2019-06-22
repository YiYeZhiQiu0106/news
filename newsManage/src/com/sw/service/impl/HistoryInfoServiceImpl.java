package com.sw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sw.dao.HistoryInfoDaoI;
import com.sw.entity.HistoryInfo;
import com.sw.service.HistoryInfoServiceI;
/**
 * 收藏历史记录service实现类（管理端）
 * @author 顿盛华
 *
 */
@Service
public class HistoryInfoServiceImpl implements HistoryInfoServiceI{

	@Resource
	private HistoryInfoDaoI historyInfoDaoImpl;
	
	public List<HistoryInfo> findAllInfo(int begin, int end) {
		return historyInfoDaoImpl.findAllInfo(begin, end);
	}

	public List<HistoryInfo> findAllHistoryInfoByType(int type_id, int begin,
			int end) {
		return historyInfoDaoImpl.findAllHistoryInfoByType(type_id, begin, end);
	}

}
