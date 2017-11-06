package com.codegen.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;

/**
 * 代码生成辅助类
 * 
 * @author 高振中
 * @date 2014-02-08
 */

public class CodeUtil {
	private static Log logger = LogFactory.getLog(CodeUtil.class);

	/**
	 * @方法说明: 生成类名
	 */
	public static String getClassName(String tablename) {
		tablename = firstUpper(tablename);
		int index = tablename.indexOf("_");
		while (index != -1) {
			tablename = tablename.substring(0, index) + firstUpper(tablename.substring(index + 1));
			index = tablename.indexOf("_");
		}
		return tablename;
	}

	/**
	 * @方法说明: 首字母大写
	 */
	public static String firstUpper(String name) {
		return name.substring(0, 1).toUpperCase() + name.substring(1, name.length());
	}

	/**
	 * @方法说明: 以工作空间编码写文件
	 */
	public static void writeFile(String path, StringBuilder sb) throws Exception {
		File file = new File(path);
		if (file.exists()) {
			logger.error(path);
			throw new Exception("文件已经存在，请备份后从工程中移除文件再次生成!!");
		}
		createDir(path);
		OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(path), "UTF-8");
		BufferedWriter writer = new BufferedWriter(write);
		writer.write(sb.toString());
		logger.debug("成功创建文件：" + path);
		writer.close();

	}

	/**
	 * @方法说明: 创建文件夹
	 */
	public static void createDir(String path) throws IOException {
		File file = new File(path);
		File parent = file.getParentFile();
		if (parent != null && !parent.exists()) {
			parent.mkdirs();
		}
	}

	/**
	 * @方法说明: 解析表名列表
	 */
	public static List<Table> parseTabList(InitPara para) {
		if (null == para.getChk() || para.getChk().equals("")) {
			return null;
		}
		List<Table> list = new ArrayList<Table>();
		String cnn[] = para.getCn_name().split(",");
		String chk[] = para.getChk().split(",");
		String tab[] = para.getTab_name().split(",");
		String cls[] = para.getClass_name().split(",");
		String tab_hidden[] = new String[tab.length];
		String a[] = para.getTab_hidden().split(",");
		System.arraycopy(a, 0, tab_hidden, 0, a.length);
		Table table;
		int number;
		for (String num : chk) {
			number = Integer.parseInt(num) - 1;
			table = new Table();
			table.setTab_name(tab[number]);
			table.setCls_name(cls[number]);
			table.setCn_name(cnn[number]);

			if (null != tab_hidden[number] && (tab_hidden[number]).trim().length() > 0) {
				table.setTab_hidden(tab_hidden[number]);
			}
			list.add(table);
		}
		return list;
	}

	/**
	 * @方法说明: 解析字段名及其设置列表
	 */
	public static List<Field> parseColList(String para) {
		String record[] = para.split("▲");
		List<Field> list = new ArrayList<Field>();
		String fields[];
		Field field;
		for (String fiel : record) {
			field = new Field();
			fields = fiel.split("★");
			field.setName(fields[4]);
			field.setType(fields[5]);
			field.setData_length(new Integer(fields[3]));
			field.setComments(fields[2]);
			field.setCond(fields[0]);
			field.setShow(fields[1]);
			field.setVerify(fields[6]);
			field.setInputtype(fields[7]);
			list.add(field);
		}
		return list;
	}

	/**
	 * @方法说明: 生成Excel表头数组
	 */
	public static StringBuilder parseField(List<Field> list) {
		StringBuilder fields = new StringBuilder();
		for (Field map : list) {
			fields.append("\"" + map.getComments() + "\", ");
		}
		return fields.delete(fields.length() - 2, fields.length());
	}

	/**
	 * @方法说明: 新增及修改页面第二列中输入框
	 */
	public static StringBuilder td2Inner(String notify, String name, int len, String type, String inputtype) {
		StringBuilder inner = new StringBuilder();
		if (inputtype.equals("1")) {// 文本框
			inner.append("<form:input path=\"" + name + "\"" + MaxLen(len, type) + htmlDate(type) + " class=\"text-m\" />");
			inner.append(redStar(notify));
		} else if (inputtype.equals("2")) {
			inner.append("<form:textarea path=\"" + name + "\"" + MaxLen(len, type) + " class=\"tarea\" />");
			inner.append("\r\n					<div id=\"" + name + "_div\">最大长度为" + len + "个字节</div>");
		} else if (inputtype.equals("3")) {
			inner.append("<form:select path=\"" + name + "\" items=\"${" + name + "Map}\" class=\"sel\" />");
			inner.append(redStar(notify));
		}
		return inner;
	}

	/**
	 * @方法说明: 生成新增及修改页输入即时验证绑定验证方法JS
	 */
	public static StringBuilder notifyInput(String notify, String name, String type, String inputtype, String comments) {
		StringBuilder sb = new StringBuilder();
		if (notify.equals("true")) {
			if (inputtype.equals("1") && type.equals("DATE")) {// 日期框
				sb.append("[2,'" + name + "', '" + comments + "'],");
			} else if (inputtype.equals("1") && !type.equals("DATE") || inputtype.equals("3")) {// 文本框或下拉框
				sb.append("[1,'" + name + "', '" + comments + "'],");
			} else if (inputtype.equals("2")) {// 文本域
				sb.append("[3,'" + name + "'],");
			}
		}
		return sb;
	}

	/**
	 * @方法说明: 生成新增及修改页第三列单元格ID及spring提示验证信息组件
	 */
	public static String td3(String notify, String name) {
		return notify.equals("true") ? "<td class=\"left30_red\" id=\"" + name + "_td" + "\"><form:errors path=\"" + name + "\" /></td>" : "<td></td>";
	}

	/**
	 * @方法说明: 生成新增及修改页非空验证JS代码
	 */
	public static StringBuilder validateJS(String notify, String name, String comments, String inputtype) {
		StringBuilder sb = new StringBuilder();
		if (notify.equals("true") && !inputtype.equals("2"))
			sb.append("['" + name + "', '" + comments + "'],");
		return sb;
	}

	/**
	 * @方法说明: 生成新增及修改页输入框最大长度属性
	 */
	private static String MaxLen(int max_len, String type) {
		return max_len > 0 && max_len != 32 && !type.equals("DATE") ? " maxlength=\"" + max_len + "\" " : "";
	}

	/**
	 * @方法说明: 生成新增及修改页输入提示的红星
	 */
	private static String redStar(String notify) {
		return notify.equals("true") ? "<font color=\"#CE0000\">*</font>" : "";
	}

	/**
	 * @方法说明: 生成日期型输入框
	 */
	private static String htmlDate(String type) {
		return type.equals("DATE") ? " format=\"yyyy-MM-dd HH:mm:ss\" onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})\" " : "";
	}

	/**
	 * @方法说明: model,cond文件中是包括java.util.Date的导入
	 */
	public static String dateImport(List<Field> list) {
		String mm = "";
		for (Field field : list) {
			if (field.getType().equals("DATE")) {
				mm = "\r\nimport java.util.Date;";
				break;
			}
		}
		return mm;
	}

	/**
	 * @方法说明: model,cond文件中是包括java.math.BigDecimal的导入
	 */
	public static String bigImport(List<Field> list) {
		String mm = "";
		for (Field field : list) {
			if (field.getType().equals("BIGDECIMAL")) {
				mm = "\r\nimport java.math.BigDecimal;";
				break;
			}
		}
		return mm;
	}

	/**
	 * @方法说明: 条件字段的个数
	 */
	public static int condCount(List<Field> list) {
		int count = 0;
		int len = -1;
		for (Field map : list) {
			len = (null != map.getData_length() ? map.getData_length() : len);
			if (map.getVerify().equals("true") && !map.getInputtype().equals("2") && !(len > 100)) {
				count++;
			}
		}
		return count - 1;
	}

	/**
	 * @方法说明: 删除倒数几个字符
	 */
	public static StringBuilder delete(StringBuilder sb, int count) {
		return sb.delete(sb.length() - count, sb.length());
	}

	/**
	 * @方法说明: 数据库类型与java数据类型转换
	 */
	public static String dataType(String type) {
		if (type.equals("VARCHAR2"))
			return "String";
		if (type.equals("BIGDECIMAL"))
			return "BigDecimal";
		if (type.equals("LONG"))
			return "Long";
		if (type.equals("FLOAT"))
			return "Float";
		if (type.equals("DATE"))
			return "Date";
		if (type.equals("NUMBER"))
			return "Integer";
		if (type.equals("BOOLEAN"))
			return "Boolean";
		return "不识别的数据类型";
	}

	/**
	 * @方法说明: 主键类型不同,主键数据类型不同
	 */
	public static String keyType(Integer pkey) {
		if (pkey == 1 || pkey == 3)
			return "Integer";
		else
			return "String";
	}
}
