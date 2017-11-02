package com.codegen.template.cls.list.standard;

import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class ClassIService {
	public static StringBuilder genSB(String packname, String className, String author, String CNName, Integer isWeb, Integer PKey) {
		StringBuilder sb = new StringBuilder();
		sb.append("package " + packname + ".service;");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\nimport java.util.Map;");
		sb.append("\r\n");
		sb.append("\r\n");
		if (isWeb == 1) {// 如果是web工程才生成
			sb.append("\r\nimport org.springframework.web.multipart.MultipartFile;");
			sb.append("\r\nimport javax.servlet.http.HttpServletResponse;");
		}
		sb.append("\r\nimport " + packname + ".model." + className + ";");
		sb.append("\r\nimport " + packname + ".model." + className + "Cond;");
		sb.append(CommentUtil.classComment(author, CNName));
		sb.append("\r\npublic interface I" + className + "Service {");
		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n	public int insert(" + className + " " + className.toLowerCase() + ");");
		sb.append(CommentUtil.methodComment("删除记录(多条)"));
		sb.append("\r\n	public int delete(String id);");
		sb.append(CommentUtil.methodComment("按ID查找单个实体"));
		sb.append("\r\n	public " + className + " findById(" + CodeUtil.keyType(PKey) + " id);");
		sb.append(CommentUtil.methodComment("更新记录"));
		sb.append("\r\n	public int update(" + className + " " + className.toLowerCase() + ");");
		sb.append(CommentUtil.methodComment("按条件查询分页列表"));
		sb.append("\r\n	public Map<String, Object> queryList(" + className + "Cond cond, Map<String, Object> map);");
		sb.append(CommentUtil.separate());
		if (isWeb == 1) {// 如果是web工程才生成
			sb.append(CommentUtil.methodComment("导出Excel"));
			sb.append("\r\n\tpublic void exportExcel(" + className + "Cond cond, HttpServletResponse response, String name) throws Exception;");
			sb.append(CommentUtil.methodComment("导入Excel"));
			sb.append("\r\n\tpublic String importExcel(MultipartFile file) throws Exception;");
		}
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(使用范型)"));
		sb.append("\r\n	public List<" + className + "> queryAllObj(" + className + "Cond cond);");
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(不使用范型)"));
		sb.append("\r\n	public List<Map<String, Object>> queryAllMap(" + className + "Cond cond);");
		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	public int findCountByCond(" + className + "Cond cond);");
		sb.append("\r\n}");
		return sb;
	}
}
