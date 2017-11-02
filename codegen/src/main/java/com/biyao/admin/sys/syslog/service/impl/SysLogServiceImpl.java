package com.biyao.admin.sys.syslog.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biyao.admin.sys.syslog.dao.ISysLogDao;
import com.biyao.admin.sys.syslog.model.SysLog;
import com.biyao.admin.sys.syslog.model.SysLogCond;
import com.biyao.admin.sys.syslog.service.ISysLogService;

/**
 * 系统日志Service实现类
 *
 * @author GZZ
 * @date 2014-02-15 23:24:48
 */
@Service
public class SysLogServiceImpl implements ISysLogService {
	@Autowired
	private ISysLogDao dao;

	/**
	 * 新增
	 */
	@Override
	public int insert(SysLog syslog) {
		return dao.insert(syslog);
	}

	/**
	 * 删除
	 */
	@Override
	public int delete(String id) {
		// return dao.deleteLogic(id);//逻辑删除
		return dao.delete(id);// 物理删除
	}

	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(SysLogCond cond, Map<String, Object> map) {
		return dao.queryList(cond, map);
	}

}