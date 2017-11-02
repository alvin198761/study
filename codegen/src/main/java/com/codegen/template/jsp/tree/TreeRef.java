package com.codegen.template.jsp.tree;

import com.codegen.template.i18n.I18nUtil;
import com.codegen.util.CommentUtil;

public class TreeRef {
	public static StringBuilder genSB(String className, String CNName, String author, int i18n) {
		CNName = I18nUtil.TabName(i18n, className.toLowerCase(), CNName);
		className = className.toLowerCase();
		StringBuilder sb = new StringBuilder();

		sb.append(CommentUtil.htmlHead(CNName + I18nUtil.getValue(6, i18n), author));
		sb.append("\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"${webPath}/resources/plugin/dtree/dhtmlxtree.css\">");
		sb.append("\r\n<script src=\"${webPath}/resources/plugin/dtree/dhtmlxcommon.js\"></script>");
		sb.append("\r\n<script src=\"${webPath}/resources/plugin/dtree/dhtmlxtree.js\"></script>");
		sb.append("\r\n<body>");
		sb.append("\r\n	<table class=\"titleTab\">");
		sb.append("\r\n		<tr>");
		sb.append("\r\n			<td class=\"ti\">"+CNName+"选择</td>");
		sb.append("\r\n			<td class=\"bu\">");
		sb.append("\r\n				<input type=\"button\" icon=\"icon-apply\" onclick=\"javascript:returnValue();\" value=\"确定\" />");
		sb.append("\r\n				<input type=\"button\" icon=\"icon-close\" onclick=\"javascript:top.dhxWins.window('win001').close()\" value=\"关闭\" />");
		sb.append("\r\n			</td>");
		sb.append("\r\n		</tr>");
		sb.append("\r\n	</table>");
		sb.append("\r\n	<div id=\"treebox\"></div>");
		sb.append("\r\n</body>");

		sb.append("\r\n<script type=\"text/javascript\">");
		sb.append("\r\n	treeHeight = $(top.window).height() - 190;");
		sb.append("\r\n	tree = new dhtmlXTreeObject(\"treebox\", \"100%\", treeHeight, 0);");
		sb.append("\r\n	tree.enableCheckBoxes(1);");
		sb.append("\r\n	tree.enableSingleRadioMode(true);");
		sb.append("\r\n	tree.setImagePath(\"${webPath}/resources/plugin/dtree/imgs/\");");
		sb.append("\r\n	tree.loadXML(\"${webPath}/" + className + "/tree?id=1&type=${param.type}\");");
		sb.append("\r\n	setTimeout(\"tree.openAllItems(0)\", 800);");
		sb.append("\r\n	function returnValue() {");
		sb.append("\r\n		if (tree.getAllChecked() == \"\") {");
		sb.append("\r\n			alert(\"请选择结点!\");");
		sb.append("\r\n			return false;");
		sb.append("\r\n		}");
		sb.append("\r\n		var id = tree.getAllChecked();");
		sb.append("\r\n		//var id = tree.getAllCheckedBranches();");
		sb.append("\r\n		$(top.frames['center'].frames['myframe'].document).find('#${param.rvalue}').val(id);");
		sb.append("\r\n		$(top.frames['center'].frames['myframe'].document).find('#${param.rname}').val(tree.getItemText(id));");
		sb.append("\r\n		top.dhxWins.window(\"win001\").close();");
		sb.append("\r\n	}");
		sb.append("\r\n	");
		sb.append("\r\n</script>");

		sb.append("\r\n</html>");
		return sb;
	}
}
