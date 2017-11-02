package com.biyao.admin.sys.syslog.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.syslog.dao.ISysLogDao;
import com.biyao.admin.sys.syslog.model.SysLog;
import com.biyao.admin.sys.syslog.model.SysLogCond;
import com.common.dao.BaseDao;
import com.common.util.UUIDGenerator;
import com.common.util.Util;

/**
 * 系统日志Dao实现类
 * 
 * @author GZZ
 * @date 2014-02-15 23:24:48
 */
@Repository
public class SysLogDaoImpl extends BaseDao implements ISysLogDao {

	private final String insertSql = "INSERT INTO SYS_LOG (ID,LOG_TYPE,POSITION,IP,USER_NAME,DETAIL,REMARK,DR,OCCUR_TIME) VALUES (?,?,?,?,?,?,?,?,?) ";
	private final String selectSql = "SELECT T.ID,T.LOG_TYPE,T.POSITION,T.IP,T.USER_NAME,T.DETAIL,T.REMARK,T.DR,T.OCCUR_TIME FROM SYS_LOG T WHERE 1=1";

	/**
	 * 新增
	 */
	@Override
	public int insert(SysLog vo) {
		Object[] params = new Object[] { UUIDGenerator.getUUID(), vo.getLog_type(), vo.getPosition(), vo.getIp(), vo.getUser_name(), vo.getDetail(),
				vo.getRemark(), vo.getDr(), vo.getOccur_time() };
		return jdbcTemplate.update(insertSql, params);
	}

	/**
	 * 物理删除
	 */
	@Override
	public int delete(String ids) {
		String updateStr = "DELETE FROM SYS_LOG WHERE ID " + Util.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}

	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(SysLogCond cond, Map<String, Object> map) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition() + " ORDER BY T.ID");
		return page.getPage(map, sb.toString(), cond, cond.getArray());// (不使用范型)
	}

	/**
	 * 逻辑删除
	 */
	@Override
	public int deleteLogic(String ids) {
		String updateStr = "UDATE SYS_LOG SET DR = 1 WHERE ID " + Util.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}
}