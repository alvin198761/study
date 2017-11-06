package com.codegen.util;

import java.util.List;

import com.codegen.mvc.model.Field;

public class DaoUtil {
	/**
	 * @方法说明:name前后各加一个字符，中间用逗号分隔，去掉最后的逗号.去掉第一个字段(ID)
	 */
	public static StringBuilder add(List<Field> list, String start, String end, int PKey) {
		StringBuilder sb = add(list, start, end);
		if (PKey == 1) { // 自增涨
			return sb.delete(0, sb.indexOf(",") + 1);
		}
		return sb;
	}

	/**
	 * @方法说明: name前后各加一个字符，中间用逗号分隔，去掉最后的逗号
	 */
	public static StringBuilder add(List<Field> list, String start, String end) {
		StringBuilder sb = new StringBuilder();
		String name = null;
		for (Field map : list) {
			name = map.getName();
			sb.append(start + CodeUtil.firstUpper(name.toLowerCase()) + end);
		}
		return sb.delete(sb.length() - 1, sb.length());
	}

	/**
	 * @方法说明:生成指字问号个数中间用豆号分隔两边加括号
	 */
	public static StringBuilder add(int count, int PKey) {
		if (PKey == 1)// 自增涨
			count--;
		StringBuilder sb = new StringBuilder("(");
		for (int i = 0; i < count; i++) {
			sb.append("?,");
		}
		sb.delete(sb.length() - 1, sb.length());
		sb.append(")");
		return sb;
	}

	/**
	 * @方法说明:name前后各加一个字符，中间用逗号分隔，去掉最后的逗号.去掉第一个字段(ID)
	 */
	public static StringBuilder addParam(List<Field> list, String clsName, String param, String tab, int pKey) {
		StringBuilder sb = new StringBuilder();
		String name = null;
		Field map;
		for (int i = 0; i < list.size(); i++) {
			if (i == 0 && pKey == 1) {
				continue;
			}
			map = list.get(i);
			name = map.getName();
			name = CodeUtil.firstUpper(name.toLowerCase());
			sb.append("\r\n\t\t" + tab + param + ".addValue(\"" + name + "\", " + clsName + ".get" + name + "());");
		}
		return sb;
	}
}
