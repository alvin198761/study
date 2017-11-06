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
 * @功能描述:MSSQL数据访问类
 */
@Repository("microsoft sql server")
public class MsSqlDaoImpl extends CodeDao implements IDao {
	/**
	 * @功能描述: 查询表名列表
	 */
	@Override
	public List<Table> queryTableList(InitPara para) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT D.NAME TABLE_NAME,");
		sb.append("  CAST(CASE WHEN f.VALUE IS NULL THEN D.NAME ELSE f.VALUE END as nvarchar(500)) COMMENTS");
		sb.append("  FROM SYSOBJECTS D");
		sb.append("  LEFT JOIN SYS.EXTENDED_PROPERTIES F ON D.ID = F.MAJOR_ID AND F.MINOR_ID = 0");
		sb.append(" WHERE D.XTYPE = 'U'  AND D.NAME <> 'dtproperties' ");
		sb.append(para.getCondition());
		sb.append(" ORDER BY D.NAME");
		logger.debug(DataUtil.showSql(sb.toString(), para.getArray()));// 显示SQL语句
		return jdbcTemplate.query(sb.toString(), para.getArray(), new BeanPropertyRowMapper<Table>(Table.class));
	}

	/**
	 * @功能描述: 查询字段名列表
	 */
	@Override
	public List<Field> queryColumnList(String tablename) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT  c.name ,");
		sb.append(" CAST(CASE WHEN p.value IS NULL THEN c.name ELSE p.value END  as nvarchar(500)) COMMENTS ,");
		sb.append(" CASE WHEN Y.NAME = 'datetime' OR Y.NAME = 'timestamp' OR Y.NAME = 'date' OR Y.NAME = 'smalldatetime' OR Y.NAME = 'time' THEN -1 ELSE C.LENGTH END DATA_LENGTH ,");
		sb.append(" CASE WHEN Y.NAME = 'varchar' OR Y.NAME = 'text' OR Y.NAME = 'nchar' OR Y.NAME = 'char' OR Y.NAME = 'nvarchar' OR Y.NAME = 'ntext' THEN 'VARCHAR2'");
		sb.append(" 	 WHEN Y.NAME = 'datetime' OR Y.NAME = 'timestamp' OR Y.NAME = 'date' OR Y.NAME = 'smalldatetime' OR Y.NAME = 'time' THEN 'DATE'");
		sb.append("      WHEN Y.NAME = 'money' OR Y.NAME = 'decimal' OR Y.NAME = 'money' OR Y.NAME = 'numeric' THEN 'BIGDECIMAL'");
		sb.append("      WHEN Y.NAME = 'int' OR Y.NAME = 'smallint' OR Y.NAME = 'tinyint' THEN 'NUMBER'");
		sb.append("      WHEN Y.NAME = 'bigint' THEN 'LONG'");
		sb.append("      WHEN Y.NAME = 'float' THEN 'FLOAT'");
		sb.append("      WHEN Y.NAME = 'bit' THEN 'BOOLEAN' ELSE Y.NAME END TYPE ,");
		sb.append(" 'true' AS 'cond' ,");
		sb.append(" 'true' AS 'show' ,");
		sb.append(" 'true' AS 'verify' ,");
		sb.append(" '1' AS 'inputtype'");
		sb.append(" FROM SYSCOLUMNS C");
		sb.append("		LEFT JOIN SYSOBJECTS T ON C.ID = T.ID");
		sb.append("		LEFT JOIN SYS.EXTENDED_PROPERTIES P ON C.ID = P.MAJOR_ID AND C.COLID = P.MINOR_ID");
		sb.append("		JOIN SYSTYPES Y ON C.XUSERTYPE = Y.XUSERTYPE");
		sb.append(" WHERE T.XTYPE = 'U' AND p.NAME = 'MS_Description' AND T.NAME = '" + tablename.toUpperCase() + "'");
		sb.append(" ORDER BY C.COLORDER");
		logger.debug(DataUtil.showSql(sb.toString(), new Object[] {}));// 显示SQL语句
		return replaceComments(jdbcTemplate.query(sb.toString(), new BeanPropertyRowMapper<Field>(Field.class)));
	}

}
