package com.codegen.template.cls.list.simple;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class SimpleModel {
	public static StringBuilder genSB(String packname, String className, List<Field> list, String author, String CNName,String tabName) {
		StringBuilder sb = new StringBuilder();
		String name = null;
		String type = null;
		String comments = null;
		StringBuilder field = new StringBuilder();
		StringBuilder setGet = new StringBuilder();
		sb.append("package " + packname + ";");
		sb.append(CodeUtil.dateImport(list));
		sb.append(CodeUtil.bigImport(list));
		sb.append(CommentUtil.classComment(author, CNName));
		sb.append("\r\n//@Entity");
		sb.append("\r\n//@Table(name = \""+tabName+"\")");
		sb.append("\r\npublic class " + className + " {");
		for (Field map : list) {
			name = map.getName().toLowerCase();
			type = map.getType();
			comments = map.getComments();
			type = CodeUtil.dataType(type);
			field.append("\r\n\tprivate " + type + " " + name + ";// " + comments);
			setGet.append("\r\n\tpublic " + type + " get" + CodeUtil.firstUpper(name) + "() {");
			setGet.append("\r\n\t\treturn " + name + ";");
			setGet.append("\r\n\t}");
			setGet.append("\r\n\tpublic void set" + CodeUtil.firstUpper(name) + "(" + type + " " + name + ") {");
			setGet.append("\r\n\t\tthis." + name + " = " + name + ";");
			setGet.append("\r\n\t}");
		}
		sb.append("\r\n");
		sb.append("\r\n\t//数据库中的字段");
		sb.append("\r\n\t//@Id");
		sb.append("\r\n\t//@GeneratedValue(strategy = GenerationType.AUTO)");
		sb.append(field);
		sb.append("\r\n");
		sb.append("\r\n\t//此处可添加查询显示辅助字段");
		sb.append("\r\n");
		sb.append(setGet);
		sb.append("\r\n}");
		return sb;
	}
}
