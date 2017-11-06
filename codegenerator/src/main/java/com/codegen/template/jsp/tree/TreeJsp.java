package com.codegen.template.jsp.tree;

import com.codegen.template.i18n.I18nUtil;
import com.codegen.util.CommentUtil;

public class TreeJsp {
	public static StringBuilder genSB(String className, String CNName, String author, int i18n) {
		CNName = I18nUtil.TabName(i18n, className.toLowerCase(), CNName);
		className = className.toLowerCase();
		StringBuilder sb = new StringBuilder();
		sb.append(CommentUtil.htmlHead(CNName + I18nUtil.getValue(6, i18n), author));
		sb.append("\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"${webPath}/resources/css/layout.css\" />");
		sb.append("\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"${webPath}/resources/plugin/dtree/dhtmlxtree.css\">");
		sb.append("\r\n<script src=\"${webPath}/resources/plugin/dtree/dhtmlxcommon.js\"></script>");
		sb.append("\r\n<script src=\"${webPath}/resources/plugin/dtree/dhtmlxtree.js\"></script>");
		sb.append("\r\n<body class=\"menubody\">");
		sb.append("\r\n	<div id=\"treebox\" class=\"menu_bar\"></div>");
		sb.append("\r\n	<div class=\"content\">");
		sb.append("\r\n		<iframe id=\"myframe\" name=\"myframe\" width=\"100%\" height=\"100%\" frameborder=\"0\"></iframe>");
		sb.append("\r\n	</div>");
		sb.append("\r\n</body>");
		sb.append("\r\n");
		sb.append("\r\n<script type=\"text/javascript\">");
		sb.append("\r\n	var tree;");
		sb.append("\r\n	function tonclick(id) {");
		sb.append("\r\n		//var src = \"${webPath}/"+className+"/list?id=\" + id;");
		sb.append("\r\n		var src = \"${webPath}/"+className+"/detail?id=\" + id;");
		sb.append("\r\n		$('#myframe').attr('src', src);");
		sb.append("\r\n	}");
		sb.append("\r\n	tree = new dhtmlXTreeObject(\"treebox\", \"100%\", \"100%\", 0);");
		sb.append("\r\n	tree.setImagePath(\"${webPath}/resources/plugin/dtree/imgs/\");");
		sb.append("\r\n	tree.setOnClickHandler(tonclick);");
		sb.append("\r\n	tree.loadXML(\"${webPath}/"+className+"/tree?id=1&selectID=${id}\");");
		sb.append("\r\n	setTimeout(\"tree.openAllItems(0)\", 400);");
		sb.append("\r\n	$(\"#myframe\").width($(window).width()-210);");
		sb.append("\r\n	$(window).resize(function() {");
		sb.append("\r\n		$(\"#myframe\").width($(window).width()-210);");
		sb.append("\r\n	});");
		sb.append("\r\n</script>");
		sb.append("\r\n</html>");
		return sb;
	}

}
