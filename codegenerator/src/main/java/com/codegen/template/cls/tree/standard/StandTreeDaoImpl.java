package com.codegen.template.cls.tree.standard;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;
import com.codegen.util.DaoUtil;

public class StandTreeDaoImpl {
	public static StringBuilder genSB(String packname, String className, String author, String CNName, List<Field> list, String tabname, Integer PKey) {
		StringBuilder sb = new StringBuilder();
		Field field = list.get(0);
		String thisid = field.getName().toLowerCase();
		sb.append("package " + packname + ".dao.impl;");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\nimport java.util.Map;");
		sb.append("\r\n");
		sb.append("\r\nimport org.springframework.stereotype.Repository;");
		sb.append("\r\nimport org.springframework.jdbc.core.BeanPropertyRowMapper;");
		sb.append("\r\nimport org.springframework.jdbc.core.namedparam.MapSqlParameterSource;");
		sb.append("\r\nimport org.springframework.jdbc.support.GeneratedKeyHolder;");
		sb.append("\r\nimport org.springframework.jdbc.support.KeyHolder;");
		
		
		
		
		sb.append("\r\n");
		sb.append("\r\nimport com.common.util.DataUtil;");
		sb.append("\r\nimport com.common.dao.BaseDao;");
		sb.append("\r\nimport com.common.util.UUIDGenerator;");
		if (PKey == 2) {// UUID
			sb.append("\r\nimport com.common.util.UUIDGenerator;");
		} 
		sb.append("\r\nimport com.common.util.Util;");
		sb.append("\r\n");
		sb.append("\r\nimport " + packname + ".model." + className + ";");
		sb.append("\r\nimport " + packname + ".model." + className + "Cond;");
		sb.append("\r\nimport " + packname + ".dao.I" + className + "Dao;");
		sb.append(CommentUtil.classComment(author, CNName));
		sb.append("\r\n@Repository");
		sb.append("\r\npublic class " + className + "DaoImpl extends BaseDao implements I" + className + "Dao {");
		sb.append("\r\n\tprivate final String updateSql = \"UPDATE " + tabname + " SET " + DaoUtil.add(list, "", "=?,", 1).toString().toUpperCase() + " WHERE " + thisid.toUpperCase() + "=? \";");
		sb.append("\r\n\tprivate StringBuilder selectSql = new StringBuilder();");
		sb.append(CommentUtil.methodComment("构造方法,用于拼加SELECT-SQL及其它的初始化工作"));
		sb.append("\r\n\tpublic " + className + "DaoImpl () {");
		sb.append("\r\n\t\tselectSql.append(\"SELECT " + DaoUtil.add(list, "T.", ",").toString().toUpperCase() + " FROM " + tabname + " T WHERE 1=1\");");
		sb.append("\r\n\t}");
		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n\tpublic String insert(" + className + " vo) {");
		if (PKey == 2) {// UUID
			sb.append("\r\n\t\tString id = UUIDGenerator.getUUID();");// 使用UUID
			sb.append("\r\n\t\tvo.setId(id);");// 使用UUID
		} else if (PKey == 3) {// Oracle序列
			sb.append("\r\n\t\tString id = jdbcTemplate.queryForObject(\"SELECT " + tabname + "_SEQ.NEXTVAL FROM DUAL\", String.class);");// 使用序列主键
			sb.append("\r\n\t\tvo.setId(id);");
		}
		sb.append("\r\n\t\tStringBuilder sb = new StringBuilder();");
		sb.append("\r\n\t\tsb.append(\"INSERT INTO " + tabname + " (" + DaoUtil.add(list, "", ",", PKey).toString().toUpperCase() + ") VALUES \");");
		sb.append("\r\n\t\tsb.append(\" (" + DaoUtil.add(list, ":", ",", PKey) + ")\");");
		sb.append("\r\n\t\tMapSqlParameterSource params = new MapSqlParameterSource();");
		sb.append(DaoUtil.addParam(list, "vo", "params", "",PKey));
		sb.append("\r\n\t\tKeyHolder keyholder = new GeneratedKeyHolder();");
		sb.append("\r\n\t\tnamedJdbcTemplate.update(sb.toString(), params, keyholder);");
		if (PKey == 1) {// 自增涨
			sb.append("\r\n\t\treturn  keyholder.getKey().toString();");
		} else {
			sb.append("\r\n\t\treturn id;");
		}
		sb.append("\r\n\t}");
		sb.append(CommentUtil.methodComment("物理删除记录(多条)"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public int delete(String ids) {");
		sb.append("\r\n		String updateStr = \"DELETE FROM " + tabname + " WHERE " + thisid.toUpperCase() + "\" + Util.ArrayToIn(ids);//数值型ID使用ArrayToInNum");
		sb.append("\r\n		return jdbcTemplate.update(updateStr);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按ID查找单个实体"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public " + className + " findById(String id) {");
		sb.append("\r\n		StringBuilder sb = new StringBuilder(selectSql);");
		sb.append("\r\n		sb.append(\" AND T." + thisid.toUpperCase() + "=?\");");
		sb.append("\r\n		return jdbcTemplate.queryForObject(sb.toString(), new Object[]{id}, new BeanPropertyRowMapper<");
		sb.append(className + ">(" + className + ".class));");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("更新记录"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public int update(" + className + " vo) {");
		sb.append("\r\n		Object[] params = new Object[]{");
		sb.append(DaoUtil.add(list, "vo.get", "(),", 1) + ",vo.get" + CodeUtil.firstUpper(thisid) + "()};");
		sb.append("\r\n		return jdbcTemplate.update(updateSql, params);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询分页列表-根据需要替换成自己的SQL"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public Map<String, Object> queryList(" + className + "Cond cond, Map<String, Object> map) {");
		sb.append("\r\n		StringBuilder sb = new StringBuilder(selectSql);");
		sb.append("\r\n		sb.append(cond.getCondition());");
		sb.append("\r\n		//sb.append(\" ORDER BY T." + thisid.toUpperCase() + "\");//MS_SQL中不能加此语句");
		sb.append("\r\n\t\tlogger.debug(DataUtil.showSql(sb.toString(), cond.getArray()));//显示SQL语句");
		sb.append("\r\n		//return page.getPage(map, sb.toString(), cond, cond.getArray(), " + className + ".class);//(使用范型)");
		sb.append("\r\n		return page.getPage(map, sb.toString(), cond, cond.getArray());//(不使用范型)");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(使用范型)-根据需要替换成自己的SQL"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public List<" + className + "> queryAllObj(" + className + "Cond cond) {");
		sb.append("\r\n		StringBuilder sb = new StringBuilder(selectSql);");
		sb.append("\r\n		sb.append(cond.getCondition());");
		sb.append("\r\n		//sb.append(\" ORDER BY ORDER_CODE\");");
		sb.append("\r\n		//logger.debug(DataUtil.showSql(sb.toString(), cond));//显示SQL语句");

		sb.append("\r\n		return jdbcTemplate.query(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<");
		sb.append(className + ">(" + className + ".class));");
		sb.append("\r\n	}");

		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public int findCountByCond(" + className + "Cond cond) {");
		sb.append("\r\n		String countSql = \"SELECT COUNT(T." + thisid.toUpperCase() + ") FROM " + tabname + " T WHERE 1=1\" + cond.getCondition();");
		sb.append("\r\n		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);");
		sb.append("\r\n	}");

		sb.append(CommentUtil.methodComment("逻辑删除记录(多条)"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public int deleteLogic(String ids) {");
		sb.append("\r\n		String updateStr = \"UDATE " + tabname + " SET DR = 1 WHERE " + thisid.toUpperCase() + "\" + Util.ArrayToIn(ids);");
		sb.append("\r\n		return jdbcTemplate.update(updateStr);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("修改叶子标志"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public int updateLeaf(Object[] obj) {");
		sb.append("\r\n		String sbsql = \"UPDATE  " + tabname + " SET IS_LEAF = 0 WHERE " + thisid.toUpperCase() + " = ? \";");
		sb.append("\r\n		return jdbcTemplate.update(sbsql, obj);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("修改上级叶子标志"));
		sb.append("\r\n\t@Override");
		sb.append("\r\n	public int updateParent(Object[] obj) {");
		sb.append("\r\n		int count;");
		sb.append("\r\n		String sql = \"SELECT COUNT(P." + thisid.toUpperCase() + ") FROM " + tabname + " P WHERE P.PARENT_ID = ?\";");
		sb.append("\r\n		count = jdbcTemplate.queryForObject(sql, obj, Integer.class);");
		sb.append("\r\n		count = count == 0 ? 1 : 0;");
		sb.append("\r\n		sql = \"UPDATE " + tabname + " SET IS_LEAF = \" + count + \" WHERE " + thisid.toUpperCase() + " = ?\";");
		sb.append("\r\n		return jdbcTemplate.update(sql, obj);");
		sb.append("\r\n	}");
		sb.append("\r\n}");
		return sb;
	}
}
