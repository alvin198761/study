package com.codegen.template.cls.tree.standard;

import com.codegen.util.CommentUtil;

public class StandTreeIDao {
	public static StringBuilder genSB(String packname, String className, String author, String CNName) {
		StringBuilder sb = new StringBuilder();
		sb.append("package " + packname + ".dao;");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\nimport java.util.Map;");
		sb.append("\r\nimport " + packname + ".model." + className + ";");
		sb.append("\r\nimport " + packname + ".model." + className + "Cond;");
		sb.append(CommentUtil.classComment(author, CNName));
		sb.append("\r\npublic interface I" + className + "Dao {");
		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n	public String insert(" + className + " " + className.toLowerCase() + ");");
		sb.append(CommentUtil.methodComment("物理删除记录(多条)"));
		sb.append("\r\n	public int delete(String id);");
		sb.append(CommentUtil.methodComment("按ID查找单个实体"));
		sb.append("\r\n	public " + className + " findById(String id);");
		sb.append(CommentUtil.methodComment("更新记录"));
		sb.append("\r\n	public int update(" + className + " " + className.toLowerCase() + ");");
		sb.append(CommentUtil.methodComment("按条件查询分页列表"));
		sb.append("\r\n	public Map<String, Object> queryList(" + className + "Cond cond, Map<String, Object> map);");
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(使用范型)"));
		sb.append("\r\n	public List<" + className + "> queryAllObj(" + className + "Cond cond);");
		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	public int findCountByCond(" + className + "Cond cond);");
		sb.append(CommentUtil.methodComment("逻辑删除记录(多条)"));
		sb.append("\r\n	public int deleteLogic(String id);");
		sb.append(CommentUtil.methodComment("修改叶子标志"));
		sb.append("\r\n	public int updateLeaf(Object[] obj);");
		sb.append(CommentUtil.methodComment("修改上级叶子标志"));
		sb.append("\r\n	public int updateParent(Object[] obj);");
		sb.append("\r\n}");
		return sb;
	}
}
