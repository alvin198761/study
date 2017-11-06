package com.codegen.template.cls.list.standard;

import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class ClassIDao {
	public static StringBuilder genSB(String packname, String className, String author, String CNName, Integer PKey) {
		StringBuilder sb = new StringBuilder();
		sb.append("package " + packname + ".dao;");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\nimport java.util.Map;");
		sb.append("\r\nimport com.common.dao.Page;");
		sb.append("\r\nimport " + packname + ".model." + className + ";");
		sb.append("\r\nimport " + packname + ".model." + className + "Cond;");
		
		sb.append(CommentUtil.classComment(author, CNName));
		sb.append("\r\npublic interface I" + className + "Dao {");
		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n	public int insert(" + className + " " + className.toLowerCase() + ");");
		sb.append(CommentUtil.methodComment("新增记录(返回自增涨主键值:用于替换以上新增方法)"));
		sb.append("\r\n\tpublic int insertReturnPK(" + className +" " + className.toLowerCase() +");");
		sb.append(CommentUtil.methodComment("物理删除记录(多条)"));
		sb.append("\r\n	public int delete(String id);");
		sb.append(CommentUtil.methodComment("按ID查找单个实体"));
		sb.append("\r\n	public " + className + " findById(" + CodeUtil.keyType(PKey) + " id);");
		sb.append(CommentUtil.methodComment("更新记录"));
		sb.append("\r\n	public int update(" + className + " " + className.toLowerCase() + ");");
		sb.append(CommentUtil.methodComment("按条件查询分页列表"));
		sb.append("\r\n	public Page<" + className + "> queryList(" + className + "Cond cond, Map<String, Object> map);");
		sb.append(CommentUtil.separate());
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(使用范型)"));
		sb.append("\r\n	public List<" + className + "> queryAllObj(" + className + "Cond cond);");
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(不使用范型)"));
		sb.append("\r\n	public List<Map<String, Object>> queryAllMap(" + className + "Cond cond);");
		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	public int findCountByCond(" + className + "Cond cond);");
		sb.append(CommentUtil.methodComment("批量插入数据"));
		sb.append("\r\n	public int[] insertBatch(final List<" + className + "> list);");
		sb.append(CommentUtil.methodComment("逻辑删除记录(多条)"));
		sb.append("\r\n	public int deleteLogic(String id);");
		sb.append("\r\n}");
		return sb;
	}
}
