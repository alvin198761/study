package com.codegen.template.cls.tree.simple;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.util.CodeUtil;
import com.codegen.util.CommentUtil;

public class TreeService {
	public static StringBuilder genSB(String packname, String className, String author, String CNName, List<Field> list) {
		StringBuilder sb = new StringBuilder();
		String cls = className.toLowerCase();
		Field fmap = list.get(0);
		String thisid = fmap.getName().toLowerCase();
		Field fmapn = list.get(1);
		String namefield = fmapn.getName().toLowerCase();
		sb.append("package " + packname + ";");
		sb.append("\r\nimport java.util.List;");
		sb.append("\r\nimport java.util.Map;");
		sb.append("\r\n");
		sb.append("\r\nimport org.apache.commons.logging.Log;");
		sb.append("\r\nimport org.apache.commons.logging.LogFactory;");
		sb.append("\r\nimport org.springframework.beans.factory.annotation.Autowired;");
		sb.append("\r\nimport org.springframework.transaction.annotation.Transactional;");
		sb.append("\r\nimport org.springframework.stereotype.Service;");
		sb.append("\r\n");
		sb.append("\r\nimport org.dom4j.Element;");
		sb.append(CommentUtil.classComment(author, CNName + "Service实现类"));
		sb.append("\r\n@Service");
		sb.append("\r\npublic class " + className + "Service {");
		sb.append("\r\n	private Log logger = LogFactory.getLog(getClass());");
		sb.append("\r\n	@Autowired");
		sb.append("\r\n	private " + className + "Dao dao; //" + CNName + "Dao");

		sb.append(CommentUtil.methodComment("查找子结点(递规)"));
		sb.append("\r\n	public void getSonElement(Element node, String type, " + className + "Cond cond) {");
		sb.append("\r\n		List<" + className + "> chlist = dao.queryAllObj(cond);");
		sb.append("\r\n		for (" + className + " " + cls + " : chlist) {");
		sb.append("\r\n			Element nodeSon = node.addElement(\"item\");");
		sb.append("\r\n			nodeSon.addAttribute(\"id\", " + cls + ".get" + CodeUtil.firstUpper(thisid) + "()).addAttribute(\"text\", " + cls + ".get" + CodeUtil.firstUpper(namefield) + "());");
		sb.append("\r\n			//Element userdata = nodeSon.addElement(\"userdata\");");
		sb.append("\r\n			//userdata.addAttribute(\"name\", \"data01\").setText(" + cls + ".getUrl() != null ? " + cls + ".getUrl() : \"NO\");");
		sb.append("\r\n			// 自定义结点图标");
		sb.append("\r\n			//nodeSon.addAttribute(\"im0\", \"folderClosed.gif\");// 非叶子结点关闭图标");
		sb.append("\r\n			//nodeSon.addAttribute(\"im1\", \"folderOpen.gif\");// 非叶子结点打开图标");
		sb.append("\r\n			//nodeSon.addAttribute(\"im2\", \"folderClosed.gif\");// 叶子结点图标");
		sb.append("\r\n			if ((\"radio\").equals(type)) {");
		sb.append("\r\n				nodeSon.addAttribute(type, \"0\");");
		sb.append("\r\n			}");
		sb.append("\r\n			if (" + cls + ".getIs_leaf() != 1) {// 不是叶子结点,继续查找子结点");
		sb.append("\r\n				cond.setParent_id_c(" + cls + ".get" + CodeUtil.firstUpper(thisid) + "());");
		sb.append("\r\n				getSonElement(nodeSon,type,cond);");
		sb.append("\r\n			}");
		sb.append("\r\n		}");
		sb.append("\r\n	}");

		sb.append(CommentUtil.methodComment("新增记录"));
		sb.append("\r\n\t@Transactional");
		sb.append("\r\n	public String insert(" + className + " " + cls + ") {");
		sb.append("\r\n		" + cls + ".setIs_leaf(1);");
		sb.append("\r\n		dao.updateLeaf(new Object[]{" + cls + ".getParent_id()});");
		sb.append("\r\n		return dao.insert(" + cls + ");");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("删除记录(多条)"));
		sb.append("\r\n\t@Transactional");
		sb.append("\r\n	public String delete(String id) {");
		sb.append("\r\n		" + className + " " + cls + " =dao.findById(id);");
		sb.append("\r\n		String pid = " + cls + ".getParent_id();");
		sb.append("\r\n		dao.delete(id);");
		sb.append("\r\n		dao.updateParent(new Object[]{ pid });");
		sb.append("\r\n		return pid;");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按ID查找单个实体"));
		sb.append("\r\n	public " + className + " findById(String id) {");
		sb.append("\r\n		return dao.findById(id);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("更新记录"));
		sb.append("\r\n\t@Transactional");
		sb.append("\r\n	public int update(" + className + " " + cls + ") {");
		sb.append("\r\n		return dao.update(" + cls + ");");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询分页列表"));
		sb.append("\r\n	public Map<String, Object> queryList(" + className + "Cond cond, Map<String, Object> map) {");
		sb.append("\r\n		return dao.queryList(cond, map);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询不分页列表(使用范型)"));
		sb.append("\r\n	public List<" + className + "> queryAllObj(" + className + "Cond cond) {");
		sb.append("\r\n		return dao.queryAllObj(cond);");
		sb.append("\r\n	}");
		sb.append(CommentUtil.methodComment("按条件查询记录个数"));
		sb.append("\r\n	public int findCountByCond(" + className + "Cond cond) {");
		sb.append("\r\n		return dao.findCountByCond(cond);");
		sb.append("\r\n	}");
		sb.append("\r\n}");
		return sb;
	}
}
