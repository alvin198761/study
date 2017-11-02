package com.codegen.mvc.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;
import com.codegen.mvc.service.BaseService;
import com.codegen.mvc.service.IService;
import com.codegen.template.cls.list.simple.SimpleAction;
import com.codegen.template.cls.list.simple.SimpleCondition;
import com.codegen.template.cls.list.simple.SimpleDao;
import com.codegen.template.cls.list.simple.SimpleModel;
import com.codegen.template.cls.list.simple.SimpleService;
import com.codegen.template.cls.list.standard.ClassAction;
import com.codegen.template.cls.list.standard.ClassCondition;
import com.codegen.template.cls.list.standard.ClassDaoImpl;
import com.codegen.template.cls.list.standard.ClassIDao;
import com.codegen.template.cls.list.standard.ClassIService;
import com.codegen.template.cls.list.standard.ClassModel;
import com.codegen.template.cls.list.standard.ClassServiceImpl;
import com.codegen.template.i18n.I18nUtil;
import com.codegen.template.jsp.list.JspDetail;
import com.codegen.template.jsp.list.JspInsert;
import com.codegen.template.jsp.list.JspList;
import com.codegen.template.jsp.list.JspListSimple;
import com.codegen.template.jsp.list.JspRef;
import com.codegen.template.jsp.list.JspUpdate;
import com.codegen.util.CodeUtil;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:38:52
 * @功能描述:生成列表类型代码的实现类
 */
@Service("list")
public class ListServiceImpl extends BaseService implements IService {

	/**
	 * @功能描述:生成代码
	 */
	@Override
	public int gencode(InitPara para) throws Exception {
		String auth = para.getAuthor();// 作者
		String model = para.getModel();// 模版名
		int i18n = para.getI18n();// 是否国际化
		List<Table> tabList = CodeUtil.parseTabList(para); // 字段列表
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
				CodeUtil.writeFile(path, ClassModel.genSB(packName, clsName, fieldList, auth, zhName + "实体类"));
				path = basePath + "\\model\\" + clsName + "Cond.java"; // 生成查询条件类
				CodeUtil.writeFile(path, ClassCondition.genSB(packName, clsName, fieldList, auth, zhName + "查询条件类", para.getIsWeb()));
				path = basePath + "\\dao\\I" + clsName + "Dao.java";// 生成DAO接口类
				CodeUtil.writeFile(path, ClassIDao.genSB(packName, clsName, auth, zhName + "Dao接口类", para.getPKey()));
				path = basePath + "\\dao\\impl\\" + clsName + "DaoImpl.java"; // 生成DAO实现类
				CodeUtil.writeFile(path, ClassDaoImpl.genSB(packName, clsName, auth, zhName + "Dao实现类", fieldList, tabname, para.getPKey()));
				path = basePath + "\\service\\I" + clsName + "Service.java"; // 生成Service接口类
				CodeUtil.writeFile(path, ClassIService.genSB(packName, clsName, auth, zhName + "Service接口类", para.getIsWeb(), para.getPKey()));
				path = basePath + "\\service\\impl\\" + clsName + "ServiceImpl.java";// 生成Service实现类
				CodeUtil.writeFile(path, ClassServiceImpl.genSB(packName, clsName, auth, zhName, fieldList, para.getIsWeb(), para.getPKey()));
				if (para.getIsWeb() == 1) {// 如果是web工程才生成Controller
					path = basePath + "\\action\\" + clsName + "Action.java";// 控制器类
					CodeUtil.writeFile(path, ClassAction.genSB(packName, clsName, model, auth, zhName, para.getPKey()));
				}
			} else {// 简化版
				path = basePath + "\\" + clsName + ".java"; // 生成model类
				CodeUtil.writeFile(path, SimpleModel.genSB(packName, clsName, fieldList, auth, zhName + "实体类"));
				path = basePath + "\\" + clsName + "Cond.java"; // 生成查询条件类
				CodeUtil.writeFile(path, SimpleCondition.genSB(packName, clsName, fieldList, auth, zhName + "查询条件类", para.getIsWeb()));
				path = basePath + "\\" + clsName + "Dao.java";// 生成DAO实现类
				CodeUtil.writeFile(path, SimpleDao.genSB(packName, clsName, auth, zhName + "Dao实现类", fieldList, tabname, para.getPKey()));
				path = basePath + "\\" + clsName + "Service.java"; // 生成Service实现类
				CodeUtil.writeFile(path, SimpleService.genSB(packName, clsName, auth, zhName, fieldList, para.getIsWeb()));
				path = basePath + "\\" + clsName + "Action.java";// 控制器类
				CodeUtil.writeFile(path, SimpleAction.genSB(packName, clsName, model, auth, zhName));
				if (para.getIsWeb() == 1) {// 如果是web工程才生成Controller
					path = basePath + "\\" + clsName + "Action.java";// 控制器类
					CodeUtil.writeFile(path, SimpleAction.genSB(packName, clsName, model, auth, zhName));
				}
			}
			if (para.getIsWeb() == 1) {// 如果是web工程才生成JSP
				basePath = userPath + "webapp\\WEB-INF\\jsp\\" + model + "\\" + clsLow;// Jsp类基本路径
				path = basePath + "\\detail.jsp"; // 生成detail-JSP页面
				CodeUtil.writeFile(path, JspDetail.genSB(fieldList, clsName, zhName, auth, i18n));
				path = basePath + "\\insert.jsp";// 生成insert-JSP页面
				CodeUtil.writeFile(path, JspInsert.genSB(fieldList, clsName, zhName, auth, i18n));
				path = basePath + "\\update.jsp"; // 生成update-JSP页面
				CodeUtil.writeFile(path, JspUpdate.genSB(fieldList, clsName, zhName, auth, i18n));
				path = basePath + "\\list.jsp"; // 生成update-JSP页面
				CodeUtil.writeFile(path, JspList.genSB(fieldList, clsName, zhName, auth, i18n));
				path = basePath + "\\listRef.jsp"; // 生成查询选择-JSP页面
				CodeUtil.writeFile(path, JspRef.genSB(fieldList, clsName, zhName, auth, i18n));
				path = basePath + "\\listSimple.jsp"; // 生成简单列表-JSP页面
				CodeUtil.writeFile(path, JspListSimple.genSB(fieldList, clsName, zhName, auth, i18n));
				I18nUtil.i18nVersion(fieldList, clsLow, para, zhName); // 生成多版本国际化文件
			}

		}
		I18nUtil.i18nConf(para); // 生成国际化配置文件
		return 1;
	}
}
