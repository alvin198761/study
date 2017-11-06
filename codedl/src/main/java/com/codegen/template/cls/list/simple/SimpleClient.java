package com.codegen.template.cls.list.simple;

import com.codegen.util.CommentUtil;

public class SimpleClient {
	public static StringBuilder genSB(String packname, String className, String author, String CNName) {
		StringBuilder sb = new StringBuilder();
		String cls = className.toLowerCase();
		sb.append("package " + packname + ";");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\n//import org.springframework.cloud.netflix.feign.FeignClient;");
		sb.append("\r\nimport org.springframework.web.bind.annotation.RequestBody;");
		sb.append("\r\nimport org.springframework.web.bind.annotation.RequestMapping;");
		sb.append("\r\nimport org.springframework.web.bind.annotation.RequestParam;");
		sb.append("\r\nimport com.dl.keep.common.util.Page;");
		sb.append(CommentUtil.classComment(author, CNName + "客户端类"));
		sb.append("\r\n//@FeignClient(\"dl-keep-web-data/" + cls + "\")");
		sb.append("\r\npublic interface I" + className + "Client {");
		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n	@RequestMapping(\"/insert\")");
		sb.append("\r\n	Integer insert(@RequestBody " + className + " " + cls + ");");
		sb.append(CommentUtil.methodComment("删除记录(多条)"));
		sb.append("\r\n	@RequestMapping(\"/delete\")");
		sb.append("\r\n	Integer delete(@RequestParam(\"id\") String id);");
		sb.append(CommentUtil.methodComment("修改记录"));
		sb.append("\r\n	@RequestMapping(\"/update\")");
		sb.append("\r\n	Integer update(@RequestBody " + className + " " + cls + ");");
		sb.append(CommentUtil.methodComment("按条件查询分页列表页面"));
		sb.append("\r\n	@RequestMapping(\"/queryPage\")");
		sb.append("\r\n	Page<" + className + "> queryPage(@RequestBody " + className + "Cond cond );");
		sb.append(CommentUtil.methodComment("按条件查询列表页面"));
		sb.append("\r\n	@RequestMapping(\"/queryList\")");
		sb.append("\r\n	List<" + className + "> queryList(@RequestBody " + className + "Cond cond );");
		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	@RequestMapping(\"/queryCount\")");
		sb.append("\r\n	public Integer queryCount(@RequestBody " + className + "Cond cond );");
		sb.append(CommentUtil.methodComment("跳转到详细页面"));
		sb.append("\r\n	@RequestMapping(\"/findById\")");
		sb.append("\r\n	" + className + " findById(@RequestParam(\"id\") String id);");
		sb.append("\r\n}");
		return sb;
	}
}
