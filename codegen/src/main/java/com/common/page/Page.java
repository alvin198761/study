package com.common.page;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.common.condition.BaseCondition;
import com.common.constant.Constant;

@Repository
public class Page {
	@Autowired
	private JdbcTemplate jTemplate;
	private Log logger = LogFactory.getLog(getClass());
	private int pageSize;// 页大小
	private int rowCount;// 记录总数
	private int pageCount;// 总页数
	private int curPage;// 当前页码
	private int start;// 起始行数
	private int last;// 结束行数
	private List<?> resultList;// 结果集存放List

	private StringBuffer getSql(String sql, Integer curPage, Integer pageSize, Object[] obj) {
		setPageSize(pageSize);
		StringBuffer countSQL = new StringBuffer(" SELECT count(*) FROM ( ");
		countSQL.append(SqlUtil.getCountSql(sql));
		countSQL.append(" ) as  totalTable ");
		setRowCount(jTemplate.queryForObject(countSQL.toString(), obj, Integer.class));
		setPageCount();
		setCurPage(curPage);
		setStart((this.curPage - 1) * this.pageSize);
		setLast();
		StringBuffer listSql = new StringBuffer();
		// logger.debug(Constant.DATABASE+"=================================");
		if (Constant.DATABASE.equals("Oracle")) {// 数断数据库类型
			listSql.append("SELECT * FROM(SELECT TEMP.* ,ROWNUM NUM FROM(");
			listSql.append(sql);
			listSql.append(") TEMP WHERE ROWNUM <= " + last + ")WHERE NUM>" + start);
		} else if (Constant.DATABASE.equals("MySQL")) {
			listSql.append(sql + " LIMIT " + start + "," + this.pageSize);
		} else if (Constant.DATABASE.equals("Microsoft SQL Server")) {
			listSql.append("SELECT * FROM (");
			listSql.append(SqlUtil.getSql(sql));
			listSql.append(" ) T WHERE T.ROWNO BETWEEN " + (start + 1) + " AND " + (start + this.pageSize));
			// logger.debug(listSql);
		} else {
			logger.error("**不支持的数据库类型**" + Constant.DATABASE);
		}
		return listSql;
	}

	/**
	 * @功能描述 Microsoft SQL Server专用
	 */
	private StringBuffer getSql(String sql, Integer curPage, Integer pageSize, Object[] obj, String orderField) {
		setPageSize(pageSize);
		StringBuffer countSQL = new StringBuffer(" SELECT count(*) FROM ( ");
		countSQL.append(SqlUtil.getCountSql(sql));
		countSQL.append(" ) as  totalTable ");
		setRowCount(jTemplate.queryForObject(countSQL.toString(), obj, Integer.class));
		setPageCount();
		setCurPage(curPage);
		setStart((this.curPage - 1) * this.pageSize);
		setLast();
		StringBuffer listSql = new StringBuffer();
		listSql.append("SELECT * FROM (");
		listSql.append(SqlUtil.getSql(sql, orderField));
		listSql.append(" ) T WHERE T.ROWNO BETWEEN " + (start + 1) + " AND " + (start + this.pageSize));
		//logger.debug(listSql);
		return listSql;
	}

	/**
	 * @功能描述 Microsoft SQL Server专用
	 * @param sql
	 * @param curPage
	 * @param pageSize
	 * @param obj
	 * @param clazz
	 */
	private <T> void init(String sql, Integer curPage, Integer pageSize, Object[] obj, Class<T> clazz, String orderField) {
		if (!Constant.DATABASE.equals("Microsoft SQL Server")) {
			logger.error("亲!这个方法是给Microsoft SQL Server专用的,如果是其它数据库请不要这样调用!!");
		}
		StringBuffer listSql = getSql(sql, curPage, pageSize, obj, orderField);
		setResultList(jTemplate.query(listSql.toString(), obj, new BeanPropertyRowMapper<T>(clazz)));
	}

	/**
	 * @功能描述 Microsoft SQL Server专用
	 * @param sql
	 * @param curPage
	 * @param pageSize
	 * @param obj
	 */
	private void init(String sql, Integer curPage, Integer pageSize, Object[] obj, String orderField) {
		if (!Constant.DATABASE.equals("Microsoft SQL Server")) {
			logger.error("亲!这个方法是给Microsoft SQL Server专用的,如果是其它数据库请不要这样调用!!");
		}
		StringBuffer listSql = getSql(sql, curPage, pageSize, obj, orderField);
		setResultList(jTemplate.queryForList(listSql.toString(), obj));
	}

	/**
	 * @功能描述 Oracle Mysql专用
	 * @param sql
	 * @param curPage
	 * @param pageSize
	 * @param obj
	 * @param clazz
	 */
	private <T> void init(String sql, Integer curPage, Integer pageSize, Object[] obj, Class<T> clazz) {
		StringBuffer listSql = getSql(sql, curPage, pageSize, obj);
		setResultList(jTemplate.query(listSql.toString(), obj, new BeanPropertyRowMapper<T>(clazz)));
	}

	/**
	 * @功能描述 Oracle Mysql专用
	 * @param sql
	 * @param curPage
	 * @param pageSize
	 * @param obj
	 */
	private void init(String sql, Integer curPage, Integer pageSize, Object[] obj) {
		StringBuffer listSql = getSql(sql, curPage, pageSize, obj);
		setResultList(jTemplate.queryForList(listSql.toString(), obj));
	}

	private void setPageSize(Integer pageSize) {
		if (null == pageSize)
			this.pageSize = Constant.PAGE_SIZE;
		else
			this.pageSize = pageSize;
	}

	private void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	private void setPageCount() {
		if (rowCount % pageSize == 0) {
			this.pageCount = rowCount / pageSize;
		} else {
			this.pageCount = (rowCount / pageSize) + 1;
		}
	}

	private void setCurPage(Integer curPage) {
		if (null == curPage) {
			this.curPage = 1;
		} else {
			this.curPage = curPage;
		}

	}

	private void setStart(int start) {
		this.start = start;
	}

	private void setLast() {
		last = curPage * pageSize;
	}

	private List<?> getResultList() {
		return resultList;
	}

	private void setResultList(List<?> resultList) {
		this.resultList = resultList;
	}

	/**
	 * 以map形式封装分页查询结果
	 */
	private Map<String, Object> getPageMap(Map<String, Object> map) {
		map.put("dataList", getResultList());
		map.put("curPage", curPage);
		map.put("totalPage", pageCount);
		map.put("totalCount", rowCount);
		map.put("rows", pageSize);
		return map;
	}

	/**
	 * 以map形式封装分页查询结果
	 */
	private Map<String, Object> getJsonPage() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", rowCount);
		map.put("rows", getResultList());
		return map;
	}

	public Map<String, Object> getJson(String sql) {
		init(sql, null, null, null);
		return getJsonPage();
	}

	public Map<String, Object> getJson(String sql, BaseCondition cond) {
		init(sql, cond.getPage(), cond.getRows(), null);
		return getJsonPage();
	}

	public Map<String, Object> getJson(String sql, BaseCondition cond, Object[] obj) {
		init(sql, cond.getPage(), cond.getRows(), obj);
		return getJsonPage();
	}

	public Map<String, Object> getPage(Map<String, Object> map, String sql) {
		init(sql, null, null, null);
		return getPageMap(map);
	}

	public Map<String, Object> getPage(Map<String, Object> map, String sql, BaseCondition cond) {
		if (null == cond.getOrderField() || "".equals(cond.getOrderField())) {
			init(sql, cond.getCurPage(), cond.getRows(), null);
		} else {
			init(sql, cond.getCurPage(), cond.getRows(), null, cond.getOrderField());
		}
		return getPageMap(map);
	}

	public Map<String, Object> getPage(Map<String, Object> map, String sql, BaseCondition cond, Object[] obj) {
		if (null == cond.getOrderField() || "".equals(cond.getOrderField())) {
			init(sql, cond.getCurPage(), cond.getRows(), obj);
		} else {
			init(sql, cond.getCurPage(), cond.getRows(), obj, cond.getOrderField());
		}
		return getPageMap(map);
	}

	public <T> Map<String, Object> getPage(Map<String, Object> map, String sql, BaseCondition cond, Object[] obj, Class<T> clazz) {

		if (null == cond.getOrderField() || "".equals(cond.getOrderField())) {
			init(sql, cond.getCurPage(), cond.getRows(), obj, clazz);
		} else {
			init(sql, cond.getCurPage(), cond.getRows(), obj, clazz, cond.getOrderField());
		}
		return getPageMap(map);
	}

}