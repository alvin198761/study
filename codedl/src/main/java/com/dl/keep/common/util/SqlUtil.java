package com.dl.keep.common.util;

import java.text.SimpleDateFormat;

public class SqlUtil {
	/**
	 * @方法说明:数据库中执行的SQL语句
	 */
	public static String showSql(String sql, Object[] obj) {
		String param;
		for (int j = 0; null != obj && j < obj.length; j++) {
			param = "null";
			if (null != obj[j]) {
				String cname = obj[j].getClass().getName();
				if (cname.contains("Date") || cname.contains("Timestamp")) {
					param = "'" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(obj[j]) + "'";
				} else if (cname.contains("String")) {
					param = "'" + (String) obj[j] + "'";
				} else {
					param = obj[j].toString();
				}
			}
			sql = sql.replaceFirst("[?]", param);
		}
		return sql;
	}

	/**
	 * @方法说明:把组数拼接成IN语句(字符型)
	 */
	public static String ArrayToIn(String ids) {// 字符IN字符窜
		String[] arr = ids.split(",");
		if (arr.length < 1) {
			return "";
		}
		StringBuffer sb = new StringBuffer(" IN (");
		for (int i = 0; i < arr.length; i++) {
			if (i < arr.length - 1) {
				sb.append("'" + arr[i] + "',");
			} else {
				sb.append("'" + arr[i] + "'");
			}
		}
		sb.append(")");
		return sb.toString();
	}

	/**
	 * @方法说明:把组数拼接成IN语句(数值型)
	 */
	public static String ArrayToInNum(String ids) {// 数值IN字符窜
		String[] arr = ids.split(",");
		StringBuffer sb = new StringBuffer(" IN (");
		for (int i = 0; i < arr.length; i++) {
			if (i < arr.length - 1) {
				sb.append(arr[i] + ",");
			} else {
				sb.append(arr[i]);
			}
		}
		sb.append(")");
		return sb.toString();
	}
}
