package com.dl.keep.webdata.common.jdbc;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.dl.keep.common.util.Page;
import com.dl.keep.common.util.base.BaseCondition;

/**
 * @功能描述:dao类公共类
 * @author gzz
 * @param <T>
 */
public class BaseDao {
	protected final Log logger = LogFactory.getLog(BaseDao.class);// 日志类
	@Autowired
	protected JdbcTemplate jdbcTemplate;// jdbc模版类
	@Autowired
	protected NamedParameterJdbcTemplate namedJdbcTemplate;// jdbc模版类

	protected <T> Page<T> queryPage(Map<String, Object> map, String sql, BaseCondition cond, Class<T> clazz) {
		String countSQL = "SELECT count(1) FROM (" + sql + ") t";// 统计记录个数的SQL语句
		int rowCount = jdbcTemplate.queryForObject(countSQL, cond.getArray(), Integer.class);// 查询记录个数
		cond.setRowCount(rowCount);
		int pageSize = cond.getPageSize();// 页大小
		int curPage = cond.getCurPage();// 当前页
		cond.setPageCount(rowCount % pageSize == 0 ? rowCount / pageSize : rowCount / pageSize + 1);// 页数
		String listSql = sql + " LIMIT " + (curPage - 1) * pageSize + "," + pageSize;// 查询分页数据列表的SQL语句
		List<T> dataList = jdbcTemplate.query(listSql.toString(), cond.getArray(), new BeanPropertyRowMapper<T>(clazz));
		map.put("dataList", dataList);
		return Page.map(dataList, cond.getCurPage(), cond.getPageSize(), cond.getRowCount());
	}

	protected <T> Page<T> queryPage(String sql, BaseCondition cond, Class<T> clazz) {
		String countSQL = "SELECT count(1) FROM (" + sql + ") t";// 统计记录个数的SQL语句
		int rowCount = jdbcTemplate.queryForObject(countSQL, cond.getArray(), Integer.class);// 查询记录个数
		cond.setRowCount(rowCount);
		int pageSize = cond.getPageSize();// 页大小
		int curPage = cond.getCurPage();// 当前页
		cond.setPageCount(rowCount % pageSize == 0 ? rowCount / pageSize : rowCount / pageSize + 1);// 页数
		String listSql = sql + " LIMIT " + curPage * pageSize + "," + pageSize;// 查询分页数据列表的SQL语句
		List<T> dataList = jdbcTemplate.query(listSql.toString(), cond.getArray(), new BeanPropertyRowMapper<T>(clazz));
		return Page.map(dataList, cond.getCurPage(), cond.getPageSize(), cond.getRowCount());
	}

}