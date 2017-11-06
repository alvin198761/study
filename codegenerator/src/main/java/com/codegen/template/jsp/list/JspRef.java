package com.codegen.template.jsp.list;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.template.i18n.I18nUtil;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class JspRef {
	public static StringBuilder genSB(List<Field> list, String className, String CNName, String author, int i18n) {
		CNName = I18nUtil.TabName(i18n, className.toLowerCase(), CNName);
		className = className.toLowerCase();
		StringBuilder sb = new StringBuilder();
		StringBuilder th = new StringBuilder();
		StringBuilder td = new StringBuilder();
		StringBuilder cond = new StringBuilder();
		StringBuilder clear = new StringBuilder();
		Field fmap = list.get(0);
		String thisid = fmap.getName().toLowerCase();
		String name = null;
		String Cname = null;
		String comments = null;
		String type = null;
		String iscond = null;
		String show = null;
		th.append("\r\n\t\t\t\t<th><%--<input type=\"checkbox\" id=\"chkAll\" onclick=\"checkAll();\">--%>" + I18nUtil.getValue(8, i18n) + "</th>");
		td.append("\r\n\t\t\t\t\t<td class=\"sqe_w\" >");
		td.append("<input type=\"radio\" name=\"chk\" value=\"${wz." + thisid + "}\" title=\"${wz." + thisid + "}\" /> <u:sequence index=\"${vs.count}\" /></td>");
		int i = 0;
		int condCount = 0;
		for (Field map : list) {
			i++;
			if (i == 1) {// 第一个字段ID字段不生成
				continue;
			}
			type = map.getType();
			name = map.getName().toLowerCase();
			Cname = name + "_c";
			comments = map.getComments().replaceAll("\\'", "").replaceAll("\"", "");
			comments = I18nUtil.fieldName(i18n, className.toLowerCase(), comments, name);
			iscond = map.getCond();
			show = map.getShow();
			if (iscond.equals("true")) {// 查询条件
				condCount++;
				cond.append("\r\n\t\t\t\t<td align=\"right\">" + comments + "</td>");
				cond.append("\r\n\t\t\t\t<td>" + CodeUtil.td2Inner("false", Cname, -1, type, "1") + "</td>");
				clear.append("'" + Cname + "',");
				cond.append(condCount % 4 == 0 ? "\r\n\t\t\t</tr>\r\n\t\t\t<tr>" : "");
			}
			clear.append(condCount % 12 == 0 ? "\r\n\t\t\t\t" : "");
			th.append(show.equals("true") ? "\r\n\t\t\t\t<th>" + comments + "</th>" : "");
			td.append(show.equals("true") ? "\r\n\t\t\t\t\t<td>" + tabTd(type, name) + "</td>" : "");
		}

		sb.append(CommentUtil.htmlHead(CNName + I18nUtil.getValue(14, i18n), author));
		sb.append("\r\n<body>");
		sb.append("\r\n\t<form:form id=\"form1\" method=\"post\" commandName=\"cond\">");
		sb.append("\r\n\t\t<div class=\"ti\">" + CNName + I18nUtil.getValue(10, i18n) + "</div>");
		sb.append("\r\n\t\t<table class=\"SearchTab\">");
		sb.append("\r\n\t\t\t<tr>");
		sb.append(cond);
		sb.append(queryButton(condCount, i18n));
		sb.append("\r\n\t\t\t</tr>");
		sb.append("\r\n\t\t</table>");
		sb.append(htmlTitle(CNName, i18n));
		sb.append("\r\n\t\t<table class=\"dataTab\">");
		sb.append("\r\n\t\t\t<tr>");
		sb.append(th);
		sb.append("\r\n\t\t\t</tr>");
		sb.append("\r\n\t\t\t<c:forEach items=\"${dataList}\" var=\"wz\" varStatus=\"vs\">");
		sb.append("\r\n\t\t\t\t<tr>");
		sb.append(td);
		sb.append("\r\n\t\t\t\t</tr>");
		sb.append("\r\n\t\t\t</c:forEach>");
		sb.append("\r\n\t\t</table>");
		sb.append("\r\n\t\t<jsp:include page=\"/WEB-INF/jsp/page.jsp\" />");
		sb.append("\r\n\t</form:form>");
		sb.append("\r\n</body>");
		sb.append(htmlJS(className, clear, CNName));
		sb.append("\r\n</html>");
		return sb;
	}

	private static String tabTd(String type, String name) {
		return type.equals("DATE") ? "<fmt:formatDate value=\"${wz." + name + "}\" type=\"both\" />" : "${wz." + name + "}";
	}

	private static StringBuilder queryButton(int condCount, int i18n) {
		StringBuilder sb = new StringBuilder();
		int tdCount = condCount % 4;
		for (int i = 0; i < 3 - tdCount; i++) {
			sb.append("\r\n\t\t\t\t<td></td>");
			sb.append("\r\n\t\t\t\t<td></td>");
		}
		sb.append("\r\n\t\t\t\t<td></td>");
		sb.append("\r\n\t\t\t\t<td>");
		sb.append("\r\n\t\t\t\t\t<input type=\"button\" icon=\"icon-search\" value=\"" + I18nUtil.getValue(10, i18n) + "\" onclick=\"toQuery();\" /> ");
		sb.append("\r\n\t\t\t\t\t<input type=\"button\" icon=\"icon-reload\" value=\"" + I18nUtil.getValue(1, i18n) + "\"	onclick=\"toClear();\" />");
		sb.append("\r\n\t\t\t\t</td>");
		return sb;
	}

	private static StringBuilder htmlTitle(String CNName, int i18n) {
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n\t\t<table class=\"titleTab\">");
		sb.append("\r\n\t\t\t<tr>");
		sb.append("\r\n\t\t\t\t<td class=\"ti\">" + CNName + I18nUtil.getValue(14, i18n) + "</td>");
		sb.append("\r\n\t\t\t\t<td class=\"bu\">");
		sb.append("\r\n\t\t\t\t\t<input type=\"button\" icon=\"icon-add\" value=\"" + I18nUtil.getValue(15, i18n) + "\" onclick=\"toValue();\" />");
		sb.append("\r\n\t\t\t\t</td>");
		sb.append("\r\n\t\t\t</tr>");
		sb.append("\r\n\t\t</table>");
		return sb;
	}

	private static StringBuilder htmlJS(String className, StringBuilder clear, String CNName) {
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n<script type=\"text/javascript\">");
		sb.append("\r\n\tfunction toQuery() {//按条件查询");
		sb.append("\r\n\t\ttoAction(\"${webPath}/" + className + "/ref?rname=${param.rname}&rvalue=${param.rvalue}\");");
		sb.append("\r\n\t}");
		sb.append("\r\n	function toClear() {//清空查询条件");
		sb.append("\r\n\t\tclearCond([" + CodeUtil.delete(clear, 1) + "]);");
		sb.append("\r\n\t\t//toAction('${webPath}/" + className + "/list');//清空后直接查询全部记录");
		sb.append("\r\n\t}");
		sb.append("\r\n\tfunction toValue() {//反回值");
		sb.append("\r\n\t\tvar id = $(\"input:radio[name='chk']:checked\").val();");
		sb.append("\r\n\t\tvar ename = $(\"input:radio[name='chk']:checked\").attr('title');");
		sb.append("\r\n\t\tif (typeof (id) == \"undefined\") {");
		sb.append("\r\n\t\t\talert(\"请选择记录!\");");
		sb.append("\r\n\t\t\treturn false;");
		sb.append("\r\n\t\t}");
		sb.append("\r\n\t\t$(parent.frames[\"center\"].document).find('#${param.rvalue}').val(id);");
		sb.append("\r\n\t\t$(parent.frames[\"center\"].document).find('#${param.rname}').val(ename);");
		sb.append("\r\n\t\ttop.dhxWins.window(\"win001\").close();");
		sb.append("\r\n\t}");
		sb.append("\r\n</script>");
		return sb;
	}
}
