package com.codegen.mvc.dao.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.codegen.mvc.dao.CodeDao;
import com.codegen.mvc.dao.IDao;
import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;
import com.common.util.DataUtil;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:24:10
 * @功能描述:Oracle数据访问类
 */
@Repository("oracle")
public class OracleDaoImpl extends CodeDao implements IDao {

	/**
	 * @功能描述: 查询表名列表
	 */
	@Override
	public List<Table> queryTableList(InitPara para) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT T.TABLE_NAME, DECODE(T.COMMENTS, '', T.TABLE_NAME, T.COMMENTS) COMMENTS  FROM USER_TAB_COMMENTS T where 1=1 ");
		sb.append(para.getCondition());
		sb.append("  ORDER BY T.TABLE_NAME ");
		logger.debug(DataUtil.showSql(sb.toString(), para.getArray()));// 显示SQL语句
		return jdbcTemplate.query(sb.toString(), para.getArray(), new BeanPropertyRowMapper<Table>(Table.class));
	}

	/**
	 * @功能描述: 查询字段名列表
	 */
	@Override
	public List<Field> queryColumnList(String tablename) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT t.TABLE_NAME,LOWER(t.COLUMN_NAME) NAME, t.DATA_TYPE type, ");
		sb.append("	REPLACE(DECODE(C.COMMENTS, '', T.COLUMN_NAME, C.COMMENTS), ',', '-') COMMENTS,");
		sb.append("	DECODE(T.DATA_TYPE, 'VARCHAR2', T.DATA_LENGTH, 'NUMBER', T.DATA_PRECISION, 'DATE', -1 , 'NVARCHAR2', T.DATA_LENGTH) DATA_LENGTH,");
		sb.append(" 'true' cond ,'true' show ,'true' verify ,'1' inputtype ");
		sb.append(" FROM USER_COL_COMMENTS C");
		sb.append(" JOIN USER_TAB_COLUMNS T ON C.TABLE_NAME = T.TABLE_NAME AND C.COLUMN_NAME = T.COLUMN_NAME");
		sb.append(" WHERE t.TABLE_NAME = '" + tablename.toUpperCase() + "'");
		sb.append(" ORDER BY T.TABLE_NAME, T.COLUMN_ID");
		return replaceComments(jdbcTemplate.query(sb.toString(), new BeanPropertyRowMapper<Field>(Field.class)));
	}
}
