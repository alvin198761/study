package com.common.page;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SqlUtil {
	private static final Log logger = LogFactory.getLog(SqlUtil.class);

	/**
	 * 取语句中第一个字段名
	 */
	public static String getIDName(String str) {
		int f = str.indexOf(",");
		String idName = str.substring(6, f);
		return idName;
	}

	public static String getCountSql(String str) {
		if (str.toUpperCase().lastIndexOf(" ORDER ") > 0)
			return str.substring(0, str.toUpperCase().lastIndexOf(" ORDER "));
		else
			return str;
	}

	public static String getSql(String sql) {
		return sql.replaceFirst("SELECT", "SELECT ROW_NUMBER() OVER (ORDER BY " + getIDName(sql) + ") AS ROWNO ,");
	}

	/**
	 * @功能描述 Microsoft SQL Server专用
	 */
	public static String getSql(String sql, String orderField) {
		return sql.replaceFirst("SELECT", "SELECT ROW_NUMBER() OVER (ORDER BY " + orderField + ") AS ROWNO ,");
	}

	public static void main(String[] args) {
		String sql;
		sql = "SELECT T.ID,T.TYPE_CODE,T.DATA_KEY,T.DATA_VALUE,T.TYPE_ID,T.REMARK,T.TS,T.DR FROM SYS_DICTIONARY T WHERE 1=1 order by t.id";
		logger.debug(getIDName(sql));
		logger.debug(getSql(sql));
		logger.debug(getCountSql(sql));
	}
}
