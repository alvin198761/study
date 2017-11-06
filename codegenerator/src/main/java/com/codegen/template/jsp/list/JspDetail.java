package com.codegen.template.jsp.list;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.template.i18n.I18nUtil;
import com.codegen.util.CommentUtil;

public class JspDetail {
	public static StringBuilder genSB(List<Field> list, String className, String CNName, String author, int i18n) {
		CNName = I18nUtil.TabName(i18n, className.toLowerCase(), CNName);
		CNName = CNName + I18nUtil.getValue(3, i18n);
		StringBuilder sb = new StringBuilder();
		sb.append(CommentUtil.htmlHead(CNName, author));
		sb.append("\r\n<body>");
		sb.append("\r\n	<div class=\"ti\">" + CNName + "</div>");
		sb.append("\r\n	<table class=\"dataTab\">");
		String name = null;
		String comments = null;
		String type = null;
		int i = 0;
		for (Field map : list) {
			i++;
			if (i == 1) {// 第一个字段ID字段不生成
				continue;
			}
			type = map.getType();
			name = map.getName().toLowerCase();
			comments = map.getComments().replaceAll("\\'", "").replaceAll("\"", "");
			comments = I18nUtil.fieldName(i18n, className.toLowerCase(), comments, name);
			sb.append("\r\n		<tr>");
			sb.append("\r\n			<td class=\"right30_blue\">" + comments + "</td>");
			if (type.equals("DATE")) {
				sb.append("\r\n			<td><fmt:formatDate value=\"${" + className.toLowerCase() + "." + name + "}\" type=\"both\" /></td>");
				sb.append("\r\n			<%--type取值还有date,time,中文年月日时分秒等--%>");
			} else {
				sb.append("\r\n			<td>${" + className.toLowerCase() + "." + name + "}</td>");
			}
			sb.append("\r\n		</tr>");
		}
		sb.append("\r\n	</table>");
		sb.append("\r\n</body>");
		sb.append("\r\n</html>");
		return sb;

	}
}
