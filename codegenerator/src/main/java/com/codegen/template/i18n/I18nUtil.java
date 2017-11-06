package com.codegen.template.i18n;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;
import com.codegen.util.CodeUtil;

@Repository
public class I18nUtil {
	private static Map<Integer, String[]> map = new HashMap<Integer, String[]>();

	public static StringBuilder genSB(List<Field> list, String className, String con, String cnName) {
		StringBuilder sb = new StringBuilder();
		String name = null;
		String comments = null;
		int i = 0;
		if (con.equals("zh")) {
			sb.append("table." + className + " = " + toUnicodeString(cnName));
		} else if (con.equals("en")) {
			sb.append("table." + className + " = " + className);
		}
		sb.append("\r\n");
		sb.append("\r\n");
		for (Field field : list) {
			i++;
			if (i == 1) {// 第一个字段ID字段不生成
				continue;
			}
			name = field.getName().toLowerCase();
			comments = field.getComments().replaceAll("\\'", "").replaceAll("\"", "");
			if (con.equals("zh")) {// 生成中文版
				sb.append("\r\n" + className + "." + name + " = " + toUnicodeString(comments));
			} else if (con.equals("en")) {// 生成英文版
				sb.append("\r\n" + className + "." + name + " = " + name);
			}
		}
		return sb;
	}

	public static String toUnicodeString(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				sb.append("\\u" + Integer.toHexString(c));
			}
		}
		return sb.toString();
	}

	public static void i18nVersion(List<Field> fieldList, String clsLow, InitPara para, String CNName) throws Exception {
		String path = System.getProperty("user.dir") + "/src/main/resources/i18n/" + para.getModel() + "/" + clsLow;//
		String realpath = "";
		if (para.getI18n() == 1) {
			// 生成中文属性文件
			realpath = path + "_zh_CN.properties";
			CodeUtil.writeFile(realpath, genSB(fieldList, clsLow, "zh", CNName));
			// 生成英文属性文件
			realpath = path + "_en_US.properties";
			CodeUtil.writeFile(realpath, genSB(fieldList, clsLow, "en", CNName));
		}
	}

	public static void i18nConf(InitPara para) throws Exception {
		if (para.getI18n() == 1) {
			String path = System.getProperty("user.dir") + "/src/main/resources/i18n/i18nnew.xml";//
			List<Table> tabList = CodeUtil.parseTabList(para);
			StringBuilder sb = new StringBuilder();
			String clsLow;
			for (Table table : tabList) {
				clsLow = table.getCls_name().toLowerCase();
				sb.append("\r\n<value>i18n/" + para.getModel() + "/" + clsLow + "</value>");
			}
			CodeUtil.writeFile(path, sb);
		}
	}

	public static String fieldName(int is_i18n, String clsLow, String comments, String name) {
		return is_i18n == 1 ? "<s:message code=\"" + clsLow + "." + name + "\" />" : comments;
	}

	public static String TabName(int is_i18n, String clsLow, String cnName) {
		return is_i18n == 1 ? "<s:message code=\"table." + clsLow + "\" />" : cnName;
	}

	@PostConstruct
	public void init() {
		map.put(1, new String[] { "common.clear", "清空" });
		map.put(2, new String[] { "common.delete", "删除" });
		map.put(3, new String[] { "common.detail", "详细" });
		map.put(4, new String[] { "common.export", "导出" });
		map.put(5, new String[] { "common.import", "导入" });
		map.put(6, new String[] { "common.list", "列表" });
		map.put(7, new String[] { "common.new", "新增" });
		map.put(8, new String[] { "common.number", "序号" });
		map.put(9, new String[] { "common.save", "保存" });
		map.put(10, new String[] { "common.search", "查询" });
		map.put(11, new String[] { "common.update", "修改" });
		map.put(12, new String[] { "common.return", "返回" });
		map.put(13, new String[] { "common.view", "查看" });
		map.put(14, new String[] { "common.select", "选择列表" });
		map.put(15, new String[] { "common.sure", "确定" });
	}

	public static String getValue(int key, int is_i18n) {
		String rvalue = "";
		if (is_i18n == 1) {
			rvalue = "<s:message code=\"" + map.get(key)[0] + "\" />";
		} else {
			rvalue = map.get(key)[1];
		}
		return rvalue;
	}

}
