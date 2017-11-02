package com.codegen.template.cls.list.simple;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class SimpleService {
	public static StringBuilder genSB(String packname, String className, String author, String CNName, List<Field> list, Integer isWeb) {
		StringBuilder sb = new StringBuilder();
		Field fmap = list.get(0);
		String thisid = fmap.getName().toLowerCase();
		String cls_low = className.toLowerCase();
		sb.append("package " + packname + ";");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\nimport java.util.Map;");
		if (isWeb == 1) {// 如果是web工程才生成
			sb.append("\r\nimport javax.servlet.http.HttpServletResponse;");
			sb.append("\r\nimport org.springframework.web.multipart.MultipartFile;");
			sb.append("\r\nimport com.common.util.DataUtil;");
		}
		sb.append("\r\n");
		sb.append("\r\nimport org.apache.commons.logging.Log;");
		sb.append("\r\nimport org.apache.commons.logging.LogFactory;");
		sb.append("\r\nimport org.springframework.beans.factory.annotation.Autowired;");
		sb.append("\r\nimport org.springframework.stereotype.Service;");
		sb.append("\r\nimport org.springframework.transaction.annotation.Transactional;");
		sb.append(CommentUtil.classComment(author, CNName + "Service实现类"));
		sb.append("\r\n@Service");
		sb.append("\r\npublic class " + className + "Service {");
		sb.append("\r\n	private Log logger = LogFactory.getLog(getClass());");
		sb.append("\r\n	@Autowired");
		sb.append("\r\n	private " + className + "Dao dao; //" + CNName + "Dao");
		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n\t@Transactional");
		sb.append("\r\n	public int insert(" + className + " " + cls_low + ") {");
		sb.append("\r\n		return dao.insert(" + cls_low + ");");
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
		sb.append("\r\n	public Map<String, Object> queryList(" + className + "Cond cond, Map<String, Object> map) {");
		sb.append("\r\n		return dao.queryList(cond, map);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.separate());
		if (isWeb == 1) {// 如果是web工程才生成
			sb.append(CommentUtil.methodComment("导出Excel"));
			sb.append("\r\n\tpublic void exportExcel(" + className + "Cond cond, HttpServletResponse response, String name) throws Exception {");
			sb.append("\r\n\t\tList<Map<String, Object>> list = dao.queryAllMap(cond);");
			sb.append("\r\n\t\tString[] headers = {" + CodeUtil.parseField(list) + "};");
			sb.append("\r\n\t\tDataUtil.export(headers, list, response, \"" + CNName + "列表\", name);//转换成excel并输出到文件(如有个性化设置只需将DataUtil.export中的代码复制至此)");
			sb.append("\r\n\t\tlogger.debug(\"导出数据结束!\");");
			sb.append("\r\n\t}");
			sb.append(CommentUtil.methodComment("导入Excel"));
			sb.append("\r\n\tpublic String importExcel(MultipartFile file) throws Exception {");
			sb.append("\r\n\t\tint insert = 0, update = 0;");
			sb.append("\r\n\t\tList<" + className + "> list = DataUtil.setList(file," + className + ".class);//把excel文件转成list");
			sb.append("\r\n\t\tinsert=dao.insertBatch(list).length;//批量导入不检测(高效)");
			sb.append("\r\n\t\t//批量导入带检测ID相同则更新(很慢)根据不同场景选取不同导入方式");
			sb.append("\r\n\t\t/*");
			sb.append("\r\n\t\tfor (" + className + " " + cls_low + ":list) {");
			sb.append("\r\n\t\t\tif (dao.findCountByCond(new " + className + "Cond(new Object[][]{{\"" + thisid + "_c\"," + cls_low + ".get" + CodeUtil.firstUpper(thisid) + "()}})) > 0) {");
			sb.append("\r\n\t\t\t\tdao.update(" + cls_low + ");");
			sb.append("\r\n\t\t\t\tupdate++;");
			sb.append("\r\n\t\t\t} else {");
			sb.append("\r\n\t\t\t\tdao.insert(" + cls_low + ");");
			sb.append("\r\n\t\t\t\tinsert++;");
			sb.append("\r\n\t\t\t}");
			sb.append("\r\n\t\t}*/");
			sb.append("\r\n\t\treturn \"插入\" + insert + \"条记录,更新\" + update + \"条记录.\";");
			sb.append("\r\n\t}");
		}

		sb.append(CommentUtil.methodComment("按条件查询不分页列表(使用范型)"));
		sb.append("\r\n	public List<" + className + "> queryAllObj(" + className + "Cond cond) {");
		sb.append("\r\n		return dao.queryAllObj(cond);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(不使用范型)"));
		sb.append("\r\n	public List<Map<String, Object>> queryAllMap(" + className + "Cond cond) {");
		sb.append("\r\n		return dao.queryAllMap(cond);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	public int findCountByCond(" + className + "Cond cond) {");
		sb.append("\r\n		return dao.findCountByCond(cond);");
		sb.append("\r\n	}");
		sb.append("\r\n}");
		return sb;
	}
}
