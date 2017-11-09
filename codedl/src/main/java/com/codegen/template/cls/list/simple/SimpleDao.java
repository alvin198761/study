package com.codegen.template.cls.list.simple;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;
import com.codegen.util.DaoUtil;

public class SimpleDao {
	public static StringBuilder genSB(String packname, String className, String author, String CNName, List<Field> list, String tabname, Integer PKey) {
		StringBuilder sb = new StringBuilder();
		Field fmap = list.get(0);
		String thisid = fmap.getName().toLowerCase();
		sb.append("package " + packname + ";");
		sb.append("\r\nimport java.util.List;");

		sb.append("\r\n");

		sb.append("\r\nimport org.springframework.stereotype.Repository;");
		sb.append("\r\nimport org.springframework.jdbc.core.BeanPropertyRowMapper;");
		sb.append("\r\n");

		sb.append("\r\nimport com.dl.keep.common.util.SqlUtil;");
		sb.append("\r\nimport com.dl.keep.webdata.common.jdbc.BaseDao;");
		sb.append("\r\nimport com.dl.keep.common.util.Page;");

		if (PKey != 1) {// 自增涨
			sb.append("\r\nimport com.common.util.UUIDGenerator;");
		}

		sb.append(CommentUtil.classComment(author, CNName));
		sb.append("\r\n@Repository");
		sb.append("\r\npublic class " + className + "Dao extends BaseDao{");
		sb.append("\r\n\tprivate StringBuilder selectSql = new StringBuilder();");
		sb.append(CommentUtil.methodComment("构造方法,用于拼加SELECT-SQL及其它的初始化工作"));
		sb.append("\r\n\tpublic " + className + "Dao () {");
		sb.append("\r\n\t\tselectSql.append(\"SELECT " + DaoUtil.add(list, "T.", ",").toString().toUpperCase() + " FROM " + tabname + " T WHERE 1=1\");");
		sb.append("\r\n\t}");
		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n\tpublic int save(" + className + " vo) {");
		sb.append("\r\n\t\tString sql = \"REPLACE INTO " + tabname + " (" + DaoUtil.add(list, "", ",", PKey).toString().toUpperCase() + ") VALUES " + DaoUtil.add(list.size(), PKey) + " \";");
		if (PKey == 1) {// 自增涨
			sb.append("\r\n\t\tObject[] params ={");
		} else if (PKey == 2) {// UUID
			sb.append("\r\n\t\tString id = UUIDGenerator.getUUID();");// 使用UUID
			sb.append("\r\n\t\tObject[] params ={id, ");
		} else if (PKey == 3) {// Oracle序列
			sb.append("\r\n\t\tInteger id=jdbcTemplate.queryForObject(\"SELECT " + tabname + "_SEQ.NEXTVAL FROM DUAL\", Integer.class);");// 使用序列主键
			sb.append("\r\n\t\tObject[] params ={id, ");
		}
		sb.append(DaoUtil.add(list, "vo.get", "(),", 1) + "};");
		sb.append("\r\n\t\t//logger.debug(SqlUtil.showSql(sql, params));//显示SQL语句");
		sb.append("\r\n\t\treturn jdbcTemplate.update(sql, params);");
		sb.append("\r\n\t}");
		sb.append(CommentUtil.methodComment("物理删除记录(多条)"));
		sb.append("\r\n	public int delete(String ids) {");
		sb.append("\r\n		String updateStr = \"DELETE FROM " + tabname + " WHERE " + thisid.toUpperCase() + "\" + SqlUtil.ArrayToIn(ids);//数值型ID使用ArrayToInNum");
		sb.append("\r\n		return jdbcTemplate.update(updateStr);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按ID查找单个实体"));
		sb.append("\r\n	public " + className + " findById(String id) {");
		sb.append("\r\n		StringBuilder sb = new StringBuilder(selectSql);");
		sb.append("\r\n		sb.append(\" AND T." + thisid.toUpperCase() + "=?\");");
		sb.append("\r\n		return jdbcTemplate.queryForObject(sb.toString(), new Object[]{id}, new BeanPropertyRowMapper<");
		sb.append(className + ">(" + className + ".class));");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("更新记录"));
		sb.append("\r\n	public int update(" + className + " vo) {");
		sb.append("\r\n\t\tString sql = \"UPDATE " + tabname + " SET " + DaoUtil.add(list, "", "=?,", 1).toString().toUpperCase() + " WHERE " + thisid.toUpperCase() + "=? \";");
		sb.append("\r\n		Object[] params = {");
		sb.append(DaoUtil.add(list, "vo.get", "(),", 1) + ",vo.get" + CodeUtil.firstUpper(thisid) + "()};");
		sb.append("\r\n		return jdbcTemplate.update(sql, params);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询分页列表-根据需要替换成自己的SQL"));
		sb.append("\r\n	public Page<" + className + "> queryPage(" + className + "Cond cond) {");
		sb.append("\r\n		StringBuilder sb = new StringBuilder(selectSql);");
		sb.append("\r\n		sb.append(cond.getCondition());");
		sb.append("\r\n		//sb.append(\" ORDER BY T." + thisid.toUpperCase() + "\")//增加排序子句;");
		sb.append("\r\n\t\t//logger.debug(SqlUtil.showSql(sb.toString(), cond.getArray()));//显示SQL语句");
		sb.append("\r\n		return queryPage(sb.toString(), cond, " + className + ".class);//(使用范型)");
		sb.append("\r\n	}");

		sb.append(CommentUtil.methodComment("按条件查询不分页列表(使用范型)-根据需要替换成自己的SQL"));
		sb.append("\r\n	public List<" + className + "> queryList(" + className + "Cond cond) {");
		sb.append("\r\n		StringBuilder sb = new StringBuilder(selectSql);");
		sb.append("\r\n		sb.append(cond.getCondition());");
		sb.append("\r\n		return jdbcTemplate.query(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<");
		sb.append(className + ">(" + className + ".class));");
		sb.append("\r\n	}");

		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	public int queryCount(" + className + "Cond cond) {");
		sb.append("\r\n		String countSql = \"SELECT COUNT(T." + thisid.toUpperCase() + ") FROM " + tabname + " T WHERE 1=1\" + cond.getCondition();");
		sb.append("\r\n		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);");
		sb.append("\r\n	}");

		sb.append(CommentUtil.methodComment("逻辑删除记录(多条)"));
		sb.append("\r\n	public int deleteLogic(String ids) {");
		sb.append("\r\n		String updateStr = \"UPDATE " + tabname + " SET deleteRemark = 1 WHERE " + thisid.toUpperCase() + "\" + SqlUtil.ArrayToIn(ids);");
		sb.append("\r\n		return jdbcTemplate.update(updateStr);");
		sb.append("\r\n	}");
		sb.append("\r\n}");
		return sb;
	}
}
