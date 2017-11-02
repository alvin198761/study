package com.codegen.template.cls.tree.standard;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class StandTreeCondition {
	public static StringBuilder genSB(String packname, String className, List<Field> list, String author, String CNName) {
		StringBuilder sb = new StringBuilder();
		sb.append("package " + packname + ".model;");
		sb.append(CodeUtil.dateImport(list));
		sb.append(CodeUtil.bigImport(list));
		sb.append("\r\nimport com.common.condition.BaseCondition;");
		sb.append(CommentUtil.classComment(author, CNName));
		sb.append("\r\npublic class " + className + "Cond extends BaseCondition  {");
		String name = null;
		String Cname = null;
		String type = null;
		String comments = null;
		String condtion = null;
		StringBuilder field = new StringBuilder();
		StringBuilder setGet = new StringBuilder();
		StringBuilder condition = new StringBuilder();
		for (Field fil : list) {
			name = fil.getName();
			comments = fil.getComments();
			Cname = name.toLowerCase() + "_c";
			type = fil.getType();
			condtion = fil.getCond();
			type = CodeUtil.dataType(type);
			field.append("\r\n	private " + type + " " + Cname + ";// " + comments);
			setGet.append("\r\n	public " + type + " get" + CodeUtil.firstUpper(Cname) + "() {");
			setGet.append("\r\n		return " + Cname + ";");
			setGet.append("\r\n	}");
			setGet.append("\r\n	public void set" + CodeUtil.firstUpper(Cname) + "(" + type + " " + Cname + ") {");
			setGet.append("\r\n		this." + Cname + " = " + Cname + ";");
			setGet.append("\r\n	}");
			if (condtion.equals("true"))// 查询条件
				if (type.equals("String")) {
					condition.append("\r\n		add(" + Cname + ", \" AND T." + name.toUpperCase() + " = ?\");");
				} else {
					condition.append("\r\n		add(" + Cname + ", \" AND T." + name.toUpperCase() + " = ?\");");
				}
		}
		sb.append(CommentUtil.methodComment("拼加自定义条件;可添加新条件、属性字段,删除不用的条件、属性字段"));
		sb.append("\r\n	@Override");
		sb.append("\r\n	public void addCondition() { ");
		sb.append(condition);
		sb.append("\r\n	}");
		sb.append("\r\n");
		sb.append("\r\n\t//页面查询条件的ID名称");
		sb.append("\r\n\t//@DateTimeFormat(pattern = \"yyyy-MM-dd HH:mm:ss\")//页面日期类型自动转换");
		sb.append(field);
		sb.append("\r\n");
		sb.append(setGet);
		sb.append("\r\n");
		sb.append("\r\n\tpublic " + className + "Cond(Object[][] obj) {super(obj);}");
		sb.append("\r\n\tpublic " + className + "Cond(){}");
		sb.append("\r\n}");
		return sb;
	}
}
