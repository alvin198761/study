package com.codegen.mvc.dao.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.codegen.mvc.dao.CodeDao;
import com.codegen.mvc.dao.IDao;
import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;
import com.common.constant.Constant;
import com.common.util.DataUtil;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:24:10
 * @功能描述:MYSQL数据访问类
 */
@Repository("mysql")
public class MySqlDaoImpl extends CodeDao implements IDao {
	/**
	 * @功能描述: 查询表名列表
	 */
	@Override
	public List<Table> queryTableList(InitPara para) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT TABLE_NAME,if(TABLE_COMMENT='',TABLE_NAME,TABLE_COMMENT) COMMENTS FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '" + Constant.DBUSER + "'");
		sb.append(para.getCondition());
		logger.debug(DataUtil.showSql(sb.toString(), para.getArray()));// 显示SQL语句
		return jdbcTemplate.query(sb.toString(), para.getArray(), new BeanPropertyRowMapper<Table>(Table.class));
	}

	/**
	 * @功能描述: 查询字段名列表
	 */
	@Override
	public List<Field> queryColumnList(String tablename) {
		StringBuilder sb = new StringBuilder();
		sb.append("	SELECT COLUMN_NAME NAME,");
		sb.append("	CASE WHEN COLUMN_COMMENT = '' THEN COLUMN_NAME	ELSE COLUMN_COMMENT	END COMMENTS,");
		sb.append("	CASE WHEN DATA_TYPE = 'varchar' OR DATA_TYPE = 'text' OR DATA_TYPE = 'char' OR DATA_TYPE = 'longtext' OR DATA_TYPE = 'mediumtext' THEN 'VARCHAR2'");
		sb.append("		 WHEN DATA_TYPE = 'tinyint' OR DATA_TYPE = 'int'  OR DATA_TYPE = 'smallint' OR DATA_TYPE = 'mediumint' THEN 'NUMBER'");
		sb.append("		 WHEN DATA_TYPE = 'datetime'	OR DATA_TYPE = 'timestamp' OR DATA_TYPE = 'date' OR DATA_TYPE = 'time' THEN 'DATE'");
		sb.append("		 WHEN DATA_TYPE = 'bigint'	THEN	'LONG'");
		sb.append("		 WHEN DATA_TYPE = 'float' THEN 'FLOAT'");
		sb.append("		 WHEN DATA_TYPE = 'double' THEN 'DOUBLE'");
		sb.append("		 WHEN DATA_TYPE = 'decimal' THEN	'BIGDECIMAL'");
		sb.append("		 WHEN DATA_TYPE = 'boolean' OR DATA_TYPE = 'bit' THEN	'BOOLEAN'");
		sb.append("	ELSE CONCAT ('----', DATA_TYPE)	END type,");
		sb.append("	IF (DATA_TYPE = 'varchar',CHARACTER_MAXIMUM_LENGTH,	IF (DATA_TYPE = 'datetime',	- 1,NUMERIC_PRECISION	)) DATA_LENGTH,");
		sb.append("	 'true' AS 'cond',");
		sb.append("	 'true' AS 'show',");
		sb.append("	 'true' AS 'verify',");
		sb.append("	 '1' AS 'inputtype'");
		sb.append("	FROM");
		sb.append("		INFORMATION_SCHEMA.COLUMNS");
		sb.append(" WHERE 1 = 1");
		sb.append("   AND TABLE_NAME =  '" + tablename.toUpperCase() + "'");
		sb.append("   AND table_schema = '" + Constant.DBUSER + "'");
		sb.append(" ORDER BY ORDINAL_POSITION");
		logger.debug(DataUtil.showSql(sb.toString(), new Object[] {}));// 显示SQL语句
		return replaceComments(jdbcTemplate.query(sb.toString(), new BeanPropertyRowMapper<Field>(Field.class)));
	}

}
