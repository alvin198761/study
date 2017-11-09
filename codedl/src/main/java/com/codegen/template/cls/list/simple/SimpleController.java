package com.codegen.template.cls.list.simple;
import com.codegen.util.CommentUtil;
public class SimpleController {
	public static StringBuilder genSB(String packname, String className, String modelName, String author, String CNName) {
		StringBuilder sb = new StringBuilder();
		String cls = className.toLowerCase();
		sb.append("package " + packname + ";");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\nimport org.apache.commons.logging.Log;");
		sb.append("\r\nimport org.apache.commons.logging.LogFactory;");
		sb.append("\r\nimport org.springframework.beans.factory.annotation.Autowired;");
		sb.append("\r\nimport org.springframework.web.bind.annotation.RequestBody;");
		sb.append("\r\nimport org.springframework.web.bind.annotation.RequestMapping;");
		sb.append("\r\nimport org.springframework.web.bind.annotation.RequestParam;");
		sb.append("\r\nimport org.springframework.web.bind.annotation.RestController;");
		sb.append("\r\nimport com.dl.keep.common.util.Page;");
		
		sb.append(CommentUtil.classComment(author, CNName + "控制器类"));
		sb.append("\r\n@RestController");
		sb.append("\r\n@RequestMapping(\"/" + cls + "\")");
		sb.append("\r\npublic class " + className + "Controller {");
		sb.append("\r\n	@SuppressWarnings(\"unused\")");
		sb.append("\r\n	private final Log logger = LogFactory.getLog(getClass());");
		sb.append("\r\n	@Autowired");
		sb.append("\r\n	private " + className + "Service service; //" + CNName + "Service");

		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n	@RequestMapping(\"/save\")");
		sb.append("\r\n	public Integer save(@RequestBody " + className + " " + cls + ") {");
		sb.append("\r\n		return service.save(" + cls + ");");
		sb.append("\r\n	}");

		sb.append(CommentUtil.methodComment("删除记录(多条)"));
		sb.append("\r\n	@RequestMapping(\"/delete\")");
		sb.append("\r\n	public Integer delete(@RequestParam(\"id\") String id) {");
		sb.append("\r\n		return service.delete(id);");
		sb.append("\r\n	}");

		sb.append(CommentUtil.methodComment("修改记录"));
		sb.append("\r\n	@RequestMapping(\"/update\")");
		sb.append("\r\n	public Integer update(@RequestBody " + className + " " + cls + ") {");
		sb.append("\r\n		return service.update(" + cls + ");");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询分页列表页面"));
		sb.append("\r\n	@RequestMapping(\"/queryPage\")");
		sb.append("\r\n	public Page<" + className + "> queryPage(@RequestBody " + className + "Cond cond ){");
		sb.append("\r\n		return service.queryPage(cond);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询列表页面"));
		sb.append("\r\n	@RequestMapping(\"/queryList\")");
		sb.append("\r\n	public List<" + className + "> queryList(@RequestBody " + className + "Cond cond ){");
		sb.append("\r\n		return service.queryList(cond);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	@RequestMapping(\"/queryCount\")");
		sb.append("\r\n	public Integer queryCount(@RequestBody " + className + "Cond cond ){");
		sb.append("\r\n		return service.queryCount(cond);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("跳转到详细页面"));
		sb.append("\r\n	@RequestMapping(\"/findById\")");
		sb.append("\r\n	public " + className + " findById(@RequestParam(\"id\") String id) {");
		sb.append("\r\n		return service.findById(id);");
		sb.append("\r\n	}");
		sb.append("\r\n}");
		return sb;
	}
}
