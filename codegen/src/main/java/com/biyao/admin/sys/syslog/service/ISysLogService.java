package com.biyao.admin.sys.syslog.service;

import java.util.Map;

import com.biyao.admin.sys.syslog.model.SysLog;
import com.biyao.admin.sys.syslog.model.SysLogCond;

/**
 * 系统日志Service接口类
 *
 * @author GZZ
 * @date 2014-02-15 23:24:48
 */
public interface ISysLogService {
	/**
	 * 新增
	 */
	public int insert(SysLog syslog);

	/**
	 * 删除
	 */
	public int delete(String id);

	/**
	 * 按条件查询分页列表
	 */
	public Map<String, Object> queryList(SysLogCond cond, Map<String, Object> map);
}