package com.codegen.template.jsp.tree;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.template.i18n.I18nUtil;
import com.codegen.util.CommentUtil;

public class TreeJspDetail {
	public static StringBuilder genSB(List<Field> list, String className, String CNName, String author, int i18n) {
		CNName = I18nUtil.TabName(i18n, className.toLowerCase(), CNName);
		CNName = CNName + I18nUtil.getValue(3, i18n);
		String cls = className.toLowerCase();
		Field fmap = list.get(0);
		String thisid = fmap.getName().toLowerCase();
		StringBuilder sb = new StringBuilder();
		sb.append(CommentUtil.htmlHead(CNName, author));
		sb.append("\r\n<script type=\"text/javascript\">");
		sb.append("\r\n	function delete_onClick() {//提交到删除方法");
		sb.append("\r\n		var is_leaf = \"${" + cls + ".is_leaf}\";");
		sb.append("\r\n		if (is_leaf == \"0\") {");
		sb.append("\r\n			alert(\"非叶子节点不可删除！\");");
		sb.append("\r\n			return false;");
		sb.append("\r\n		}");
		sb.append("\r\n		if (!confirm(\"确认删除吗？\")) {");
		sb.append("\r\n			return false;");
		sb.append("\r\n		}");
		sb.append("\r\n		toAction(\"${webPath}/" + cls + "/delete?id=${" + cls + "." + thisid + "}\");");
		sb.append("\r\n	}");
		sb.append("\r\n	//选择页代码(连同下面的<参照页范例>代码同时复制到自己页面)");
		sb.append("\r\n	function get" + className + "Ref(name1, name2, path) {");
		sb.append("\r\n		var url, winWidth, winHeight, widId;");
		sb.append("\r\n		url = path + \"/" + cls + "/ref?rname=\" + name1 + \"&rvalue=\" + name2 + \"&type=radio\";");
		sb.append("\r\n		winWidth = 500;");
		sb.append("\r\n		winHeight = $(top.window).height() - 20;");
		sb.append("\r\n		widId = 'win001';");
		sb.append("\r\n		top.ShowWin('" + CNName + "', url, path, winWidth, winHeight, widId);");
		sb.append("\r\n	}");
		sb.append("\r\n</script>");
		sb.append("\r\n<body>");
		sb.append("\r\n\t<form id=\"form1\" method=\"post\">");
		sb.append("\r\n	<table class=\"titleTab\">");
		sb.append("\r\n		<tr>");
		sb.append("\r\n			<td class=\"ti\">" + CNName + "</td>");
		sb.append("\r\n			<td class=\"bu\">");
		sb.append("\r\n				<input type=\"button\" icon=\"icon-add\" onclick=\"toAction('${webPath}/" + cls + "/toAdd?id=${" + cls + "." + thisid + "}')\" value=\"新增下级\"/> ");
		sb.append("\r\n				<input type=\"button\" icon=\"icon-edit\" onclick=\"toAction('${webPath}/" + cls + "/toUpdate?id=${" + cls + "." + thisid + "}')\" value=\"编辑\"/> ");
		sb.append("\r\n				<input type=\"button\" icon=\"icon-delete\" onclick=\"javascript:delete_onClick()\" value=\"删除\"/>");
		sb.append("\r\n			</td>");
		sb.append("\r\n		</tr>");
		sb.append("\r\n	</table>");
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
			comments = I18nUtil.fieldName(i18n, cls, comments, name);
			sb.append("\r\n		<tr>");
			sb.append("\r\n			<td class=\"right30_blue\">" + comments + "</td>");
			if (type.equals("DATE")) {
				sb.append("\r\n			<td><fmt:formatDate value=\"${" + cls + "." + name + "}\" type=\"both\" /></td>");
				sb.append("\r\n			<%--type取值还有date,time,中文年月日时分秒等--%>");
			} else {
				sb.append("\r\n			<td>${" + cls + "." + name + "}</td>");
			}
			sb.append("\r\n		</tr>");
		}
		sb.append("\r\n	</table>");
		sb.append("\r\n		<div class=\"ti\">参照页范例</div>");
		sb.append("\r\n		<table class=\"dataTab\">");
		sb.append("\r\n			<tr>");
		sb.append("\r\n				<td class=\"right30\">" + CNName + "</td>");
		sb.append("\r\n				<td>");
		sb.append("\r\n					<input id=\"anyname\" readonly=\"readonly\" onClick=\"get" + className + "Ref('anyname','anyid','${webPath}');\" class=\"inputref\" />");
		sb.append("\r\n					<input id=\"anyid\" />");
		sb.append("\r\n				</td>");
		sb.append("\r\n			</tr>");
		sb.append("\r\n		</table>");
		sb.append("\r\n\t</form>");
		sb.append("\r\n</body>");
		sb.append("\r\n</html>");
		return sb;

	}
}
