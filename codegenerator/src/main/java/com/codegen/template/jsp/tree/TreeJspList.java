package com.codegen.template.jsp.tree;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.template.i18n.I18nUtil;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class TreeJspList {
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
		th.append("\r\n\t\t\t\t<th><input type=\"checkbox\" id=\"chkAll\" onclick=\"checkAll();\">" + I18nUtil.getValue(8, i18n) + "</th>");
		td.append("\r\n\t\t\t\t\t<td class=\"sqe_w\" >");
		td.append("<input type=\"checkbox\" name=\"chk\" value=\"${wz." + thisid + "}\" /> <u:sequence index=\"${vs.count}\" /></td>");
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
		th.append("\r\n\t\t\t\t<th>" + I18nUtil.getValue(2, i18n) + "</th>");
		th.append("\r\n\t\t\t\t<th>" + I18nUtil.getValue(11, i18n) + "</th>");
		th.append("\r\n\t\t\t\t<th>" + I18nUtil.getValue(3, i18n) + "</th>");
		td.append("\r\n\t\t\t\t\t<td class=\"td-del\" onclick=\"toDelete('${wz." + thisid + "}');\"></td>");
		td.append("\r\n\t\t\t\t\t<td class=\"td-upd\" onclick=\"toAction('${webPath}/" + className + "/toUpdate?id=${wz." + thisid + "}');\"></td>");
		td.append("\r\n\t\t\t\t\t<td class=\"td-det\" onclick=\"toDetail('${wz." + thisid + "}');\"></td>");
		sb.append(CommentUtil.htmlHead(CNName + I18nUtil.getValue(6, i18n), author));
		sb.append(htmlJS(className, clear, CNName));
		sb.append("\r\n<body>");
		sb.append("\r\n\t<form:form id=\"form1\" method=\"post\" commandName=\"cond\">");
		sb.append("\r\n\t\t<div class=\"ti\">" + CNName + I18nUtil.getValue(10, i18n) + "</div>");
		sb.append("\r\n\t\t<table class=\"SearchTab\">");
		sb.append("\r\n\t\t\t<tr>");
		sb.append(cond);
		sb.append(queryButton(condCount, className, i18n));
		sb.append("\r\n\t\t\t</tr>");
		sb.append("\r\n\t\t</table>");
		sb.append(htmlTitle(CNName, className, i18n));
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
		sb.append("\r\n</html>");
		return sb;
	}

	private static String tabTd(String type, String name) {
		return type.equals("DATE") ? "<fmt:formatDate value=\"${wz." + name + "}\" type=\"both\" />" : "${wz." + name + "}";
	}

	private static StringBuilder queryButton(int condCount, String className, int i18n) {
		StringBuilder sb = new StringBuilder();
		int tdCount = condCount % 4;
		for (int i = 0; i < 3 - tdCount; i++) {
			sb.append("\r\n\t\t\t\t<td></td>");
			sb.append("\r\n\t\t\t\t<td></td>");
		}
		sb.append("\r\n\t\t\t\t<td></td>");
		sb.append("\r\n\t\t\t\t<td>");
		sb.append("\r\n\t\t\t\t\t<input type=\"button\" icon=\"icon-search\" value=\"" + I18nUtil.getValue(10, i18n) + "\" onclick=\"toAction('${webPath}/" + className + "/list');\" /> ");
		sb.append("\r\n\t\t\t\t\t<input type=\"button\" icon=\"icon-reload\" value=\"" + I18nUtil.getValue(1, i18n) + "\"	onclick=\"toClear();\" />");
		sb.append("\r\n\t\t\t\t</td>");
		return sb;
	}

	private static StringBuilder htmlTitle(String CNName, String className, int i18n) {
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n\t\t<table class=\"titleTab\">");
		sb.append("\r\n\t\t\t<tr>");
		sb.append("\r\n\t\t\t\t<td class=\"ti\">" + CNName + I18nUtil.getValue(6, i18n) + "</td>");
		sb.append("\r\n\t\t\t\t<td class=\"bu\">");
		sb.append("\r\n\t\t\t\t\t<input type=\"button\" icon=\"icon-add\" value=\"" + I18nUtil.getValue(7, i18n) + "\" onclick=\"toAction('${webPath}/" + className
				+ "/toAdd?id=${cond.parent_id_c}');\" />");
		sb.append("\r\n\t\t\t\t\t<input type=\"button\" icon=\"icon-delete\" value=\"" + I18nUtil.getValue(2, i18n) + "\" onclick=\"toDelete(getIds());\" />");
		sb.append("\r\n\t\t\t\t</td>");
		sb.append("\r\n\t\t\t</tr>");
		sb.append("\r\n\t\t</table>");
		return sb;
	}

	private static StringBuilder htmlJS(String className, StringBuilder clear, String CNName) {
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n<script type=\"text/javascript\">");
		sb.append("\r\n\tfunction toDelete(ids) {//删除记录");
		sb.append("\r\n\t\tif(checkDel(ids)){");
		sb.append("\r\n\t\t\ttoAction(\"${webPath}/" + className + "/delete?id=\" + ids);");
		sb.append("\r\n\t\t}");
		sb.append("\r\n\t}");
		sb.append("\r\n	function toClear() {//清空查询条件");
		sb.append("\r\n\t\tclearCond([" + CodeUtil.delete(clear, 1) + "]);");
		sb.append("\r\n\t}");
		sb.append("\r\n\tfunction toDetail(id) {//查看单条记录详细");
		sb.append("\r\n\t\ttop.ShowWin('详细页面','${webPath}/" + className + "/detail?id='+id,'${webPath}',600,600,'win001');");
		sb.append("\r\n\t}");
		sb.append("\r\n</script>");
		return sb;
	}
}
