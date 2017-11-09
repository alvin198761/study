package com.codegen.template.cls.list.simple;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.util.CommentUtil;

public class SimpleService {
	public static StringBuilder genSB(String packname, String className, String author, String CNName, List<Field> list) {
		StringBuilder sb = new StringBuilder();
 
		String cls_low = className.toLowerCase();
		sb.append("package " + packname + ";");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\nimport com.dl.keep.common.util.Page;");

		sb.append("\r\n");
		sb.append("\r\nimport org.apache.commons.logging.Log;");
		sb.append("\r\nimport org.apache.commons.logging.LogFactory;");
		sb.append("\r\nimport org.springframework.beans.factory.annotation.Autowired;");
		sb.append("\r\nimport org.springframework.stereotype.Service;");
		sb.append("\r\nimport org.springframework.transaction.annotation.Transactional;");
		sb.append(CommentUtil.classComment(author, CNName + "Service实现类"));
		sb.append("\r\n@Service");
		sb.append("\r\npublic class " + className + "Service {");
		sb.append("\r\n	@SuppressWarnings(\"unused\")");
		sb.append("\r\n	private Log logger = LogFactory.getLog(getClass());");
		sb.append("\r\n	@Autowired");
		sb.append("\r\n	private " + className + "Dao dao; //" + CNName + "Dao");
		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n\t@Transactional");
		sb.append("\r\n	public int save(" + className + " " + cls_low + ") {");
		sb.append("\r\n		return dao.save(" + cls_low + ");");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("删除记录(多条)"));
		sb.append("\r\n	public int delete(String id) {");
		sb.append("\r\n		//return dao.deleteLogic(id);//逻辑删除");
		sb.append("\r\n		return dao.delete(id);//物理删除");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按ID查找单个实体"));
		sb.append("\r\n	public " + className + " findById(String id) {");
		sb.append("\r\n		return dao.findById(id);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("更新记录"));
		sb.append("\r\n\t@Transactional");
		sb.append("\r\n	public int update(" + className + " " + cls_low + ") {");
		sb.append("\r\n		return dao.update(" + cls_low + ");");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询分页列表"));
		sb.append("\r\n	public Page<" + className + "> queryPage(" + className + "Cond cond) {");
		sb.append("\r\n		return dao.queryPage(cond);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(使用范型)"));
		sb.append("\r\n	public List<" + className + "> queryList(" + className + "Cond cond) {");
		sb.append("\r\n		return dao.queryList(cond);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	public int queryCount(" + className + "Cond cond) {");
		sb.append("\r\n		return dao.queryCount(cond);");
		sb.append("\r\n	}");
		sb.append("\r\n}");
		return sb;
	}
}
