package com.codegen.mvc.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;
import com.codegen.mvc.service.BaseService;
import com.codegen.mvc.service.IService;
import com.codegen.template.cls.tree.simple.TreeAction;
import com.codegen.template.cls.tree.simple.TreeCondition;
import com.codegen.template.cls.tree.simple.TreeDao;
import com.codegen.template.cls.tree.simple.TreeModel;
import com.codegen.template.cls.tree.simple.TreeService;
import com.codegen.template.cls.tree.standard.StandTreeAction;
import com.codegen.template.cls.tree.standard.StandTreeCondition;
import com.codegen.template.cls.tree.standard.StandTreeDaoImpl;
import com.codegen.template.cls.tree.standard.StandTreeIDao;
import com.codegen.template.cls.tree.standard.StandTreeIService;
import com.codegen.template.cls.tree.standard.StandTreeModel;
import com.codegen.template.cls.tree.standard.StandTreeServiceImpl;
import com.codegen.template.i18n.I18nUtil;
import com.codegen.template.jsp.tree.TreeJsp;
import com.codegen.template.jsp.tree.TreeJspDetail;
import com.codegen.template.jsp.tree.TreeJspInsert;
import com.codegen.template.jsp.tree.TreeJspList;
import com.codegen.template.jsp.tree.TreeJspUpdate;
import com.codegen.template.jsp.tree.TreeRef;
import com.codegen.util.CodeUtil;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:38:52
 * @功能描述:生成树类型代码的实现类
 */
@Service("tree")
public class TreeServiceImpl extends BaseService implements IService {

	/**
	 * @功能描述:生成代码
	 */
	public int gencode(InitPara para) throws Exception {
		String auth = para.getAuthor();// 作者
		String model = para.getModel();// 模版名
		int i18n = para.getI18n();// 是否国际化
		List<Table> tabList = CodeUtil.parseTabList(para);
		if (null == tabList) {
			return 0;
		}
		List<Field> fieldList; // 字段列表
		String packName;
		String path;
		String clsName;
		String clsLow;
		String zhName;
		String tabname;
		String basePath;
		String tabcol = "";
		for (Table table : tabList) {
			tabname = table.getTab_name().toUpperCase();
			tabcol = table.getTab_hidden();
			if (null == tabcol || "".equals(tabcol)) {
				fieldList = dao.queryColumnList(tabname);
			} else {
				fieldList = CodeUtil.parseColList(tabcol);
			}
			zhName = table.getCn_name();
			clsName = table.getCls_name();
			clsLow = clsName.toLowerCase();
			packName = para.getPackname() + clsLow;
			basePath = userPath + "java\\com\\" + para.getCompany() + "\\" + para.getPrj() + "\\" + model + "\\" + clsLow;// Java类基本路径
			if (para.getEdition() == 1) {// 标准版
				path = basePath + "\\model\\" + clsName + ".java";// 生成model类
				CodeUtil.writeFile(path, StandTreeModel.genSB(packName, clsName, fieldList, auth, zhName + "实体类"));
				path = basePath + "\\model\\" + clsName + "Cond.java"; // 生成查询条件类
				CodeUtil.writeFile(path, StandTreeCondition.genSB(packName, clsName, fieldList, auth, zhName + "查询条件类"));
				path = basePath + "\\dao\\I" + clsName + "Dao.java";// 生成DAO接口类
				CodeUtil.writeFile(path, StandTreeIDao.genSB(packName, clsName, auth, zhName + "Dao接口类"));
				path = basePath + "\\dao\\impl\\" + clsName + "DaoImpl.java"; // 生成DAO实现类
				CodeUtil.writeFile(path, StandTreeDaoImpl.genSB(packName, clsName, auth, zhName + "Dao实现类", fieldList, tabname, para.getPKey()));
				path = basePath + "\\service\\I" + clsName + "Service.java"; // 生成Service接口类
				CodeUtil.writeFile(path, StandTreeIService.genSB(packName, clsName, auth, zhName + "Service接口类"));
				path = basePath + "\\service\\impl\\" + clsName + "ServiceImpl.java";// 生成Service实现类
				CodeUtil.writeFile(path, StandTreeServiceImpl.genSB(packName, clsName, auth, zhName, fieldList));
				path = basePath + "\\action\\" + clsName + "Action.java";// 控制器类
				CodeUtil.writeFile(path, StandTreeAction.genSB(packName, clsName, model, auth, zhName, fieldList));
			} else {// 简化版
				path = basePath + "\\" + clsName + ".java"; // 生成model类
				CodeUtil.writeFile(path, TreeModel.genSB(packName, clsName, fieldList, auth, zhName + "实体类"));
				path = basePath + "\\" + clsName + "Cond.java"; // 生成查询条件类
				CodeUtil.writeFile(path, TreeCondition.genSB(packName, clsName, fieldList, auth, zhName + "查询条件类"));
				path = basePath + "\\" + clsName + "Dao.java";// 生成DAO实现类
				CodeUtil.writeFile(path, TreeDao.genSB(packName, clsName, auth, zhName + "Dao实现类", fieldList, tabname, para.getPKey()));
				path = basePath + "\\" + clsName + "Service.java"; // 生成Service实现类
				CodeUtil.writeFile(path, TreeService.genSB(packName, clsName, auth, zhName, fieldList));
				path = basePath + "\\" + clsName + "Action.java";// 控制器类
				CodeUtil.writeFile(path, TreeAction.genSB(packName, clsName, model, auth, zhName, fieldList));
			}
			basePath = userPath + "webapp\\WEB-INF\\jsp\\" + model + "\\" + clsLow;// Jsp类基本路径
			path = basePath + "\\detail.jsp"; // 生成detail-JSP页面
			CodeUtil.writeFile(path, TreeJspDetail.genSB(fieldList, clsName, zhName, auth, i18n));
			path = basePath + "\\insert.jsp";// 生成insert-JSP页面
			CodeUtil.writeFile(path, TreeJspInsert.genSB(fieldList, clsName, zhName, auth, i18n));
			path = basePath + "\\update.jsp"; // 生成update-JSP页面
			CodeUtil.writeFile(path, TreeJspUpdate.genSB(fieldList, clsName, zhName, auth, i18n));
			path = basePath + "\\list.jsp"; // 生成update-JSP页面
			CodeUtil.writeFile(path, TreeJspList.genSB(fieldList, clsName, zhName, auth, i18n));
			path = basePath + "\\ref.jsp"; // 生成查询选择-JSP页面
			CodeUtil.writeFile(path, TreeRef.genSB(clsName, zhName, auth, i18n));
			path = basePath + "\\tree.jsp"; // 生成简单列表-JSP页面
			CodeUtil.writeFile(path, TreeJsp.genSB(clsName, zhName, auth, i18n));
			I18nUtil.i18nVersion(fieldList, clsLow, para, zhName); // 生成多版本国际化文件
		}
		I18nUtil.i18nConf(para); // 生成国际化配置文件
		return 1;
	}

}
