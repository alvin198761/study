package com.codegen.template.jsp.list;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.template.i18n.I18nUtil;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class JspInsert {
	public static StringBuilder genSB(List<Field> list, String className, String CNName, String author, int i18n) {
		CNName = I18nUtil.TabName(i18n, className.toLowerCase(), CNName);
		CNName = CNName + I18nUtil.getValue(7, i18n);
		className = className.toLowerCase();
		StringBuilder sb = new StringBuilder();
		StringBuilder tr = new StringBuilder();
		StringBuilder checkJS = new StringBuilder();
		StringBuilder input = new StringBuilder();
		String name = null;
		String comments = null;
		String type = null;
		String verify = null;
		String inputtype ;
		int len;
		int i = 0;// 字段个数
		int k = 0;
		int count = CodeUtil.condCount(list);// 条件个数
		int checkCount = 0;
		for (Field field : list) {
			i++;
			if (i == 1) {// 第一个字段ID字段不生成
				continue;
			}
			type = field.getType();
			name = field.getName().toLowerCase();
			comments = field.getComments().replaceAll("\\'", "").replaceAll("\"", "");
			comments = I18nUtil.fieldName(i18n, className.toLowerCase(), comments, name);
			verify = field.getVerify();
			inputtype = field.getInputtype();
			len = null != field.getData_length() ? field.getData_length() : -1;
			inputtype = len > 500 ? "2" : inputtype;
			input.append(CodeUtil.notifyInput(verify, name, type, inputtype, comments));
			checkJS.append(CodeUtil.validateJS(verify, name, comments, inputtype));
			if (verify.equals("true") && !inputtype.equals("2")) {
				k++;
				checkJS.append(k % 5 == 0 && k != count ? "\r\n\t\t\t\t\t" : "");
			}
			checkCount = verify.equals("true") ? checkCount + 1 : checkCount;
			input.append(checkCount % 5 == 0 ? "\r\n\t\t\t" : "");
			tr.append("\r\n			<tr>");
			tr.append("\r\n				<td class=\"right30\">" + comments + "</td>");
			tr.append("\r\n				<td class=\"left30\">" + CodeUtil.td2Inner(verify, name, len, type, inputtype) + "</td>");
			tr.append("\r\n				" + CodeUtil.td3(verify, name));
			tr.append("\r\n			</tr>");
		}
		sb.append(CommentUtil.htmlHead(CNName, author));
		sb.append("\r\n<body>");
		sb.append("\r\n	<form:form id=\"form1\" method=\"post\" commandName=\"" + className + "\">");
		sb.append("\r\n		<div class=\"ti\">" + CNName + "</div>");
		sb.append("\r\n		<table class=\"dataTab\">");
		sb.append(tr);
		sb.append("\r\n		</table>");
		sb.append("\r\n		<center class=\"btn_div\">");
		sb.append("\r\n			<input type=\"button\" icon=\"icon-save\" onclick=\"toSave();\" value=\"" + I18nUtil.getValue(9, i18n) + "\"/>");
		sb.append("\r\n			<input type=\"button\" icon=\"icon-retry\" onclick=\"toAction('${webPath}/" + className + "/list');\" value=\"" + I18nUtil.getValue(12, i18n) + "\"/>");
		sb.append("\r\n		</center>");
		sb.append("\r\n	</form:form>");
		sb.append("\r\n</body>");
		sb.append("\r\n<script type=\"text/javascript\">");
		sb.append("\r\n	function toSave() {//保存记录");
		sb.append("\r\n		//请修改或替换如下验证方法");
		sb.append("\r\n\t\tcheckBlank([" + CodeUtil.delete(checkJS, 1) + "]);");
		sb.append("\r\n		if (count > 0) {");
		sb.append("\r\n			count = 0;");
		sb.append("\r\n			return false;");
		sb.append("\r\n		}");
		sb.append("\r\n		popupMasker();//弹出蔗遮罩层防止重复提交");
		sb.append("\r\n		toAction(\"${webPath}/" + className + "/insert\");");
		sb.append("\r\n	}");
		sb.append("\r\n\t//输入实时验证;1:文本框,下拉框2:日期框3:文本域");
		sb.append("\r\n\trealTimeCheck([" + CodeUtil.delete(input, 1) + "]);");
		sb.append("\r\n</script>");
		sb.append("\r\n</html>");
		return sb;
	}
}
