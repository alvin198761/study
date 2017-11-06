package com.codegen.mvc.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;
import com.codegen.mvc.service.BaseService;
import com.codegen.mvc.service.IService;
import com.codegen.template.cls.list.simple.SimpleAction;
import com.codegen.template.cls.list.simple.SimpleBus;
import com.codegen.template.cls.list.simple.SimpleClient;
import com.codegen.template.cls.list.simple.SimpleCondition;
import com.codegen.template.cls.list.simple.SimpleController;
import com.codegen.template.cls.list.simple.SimpleDao;
import com.codegen.template.cls.list.simple.SimpleModel;
import com.codegen.template.cls.list.simple.SimpleService;
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

			path = basePath + "\\" + clsName + ".java"; // 生成model类
			CodeUtil.writeFile(path, SimpleModel.genSB(packName, clsName, fieldList, auth, zhName + "实体类"));
			path = basePath + "\\" + clsName + "Cond.java"; // 生成查询条件类
			CodeUtil.writeFile(path, SimpleCondition.genSB(packName, clsName, fieldList, auth, zhName + "查询条件类" ));
			path = basePath + "\\" + clsName + "Dao.java";// 生成DAO实现类
			CodeUtil.writeFile(path, SimpleDao.genSB(packName, clsName, auth, zhName + "Dao实现类", fieldList, tabname, para.getPKey()));
			path = basePath + "\\" + clsName + "Service.java"; // 生成Service实现类
			CodeUtil.writeFile(path, SimpleService.genSB(packName, clsName, auth, zhName, fieldList ));
			path = basePath + "\\" + clsName + "Controller.java";// 控制器类
			CodeUtil.writeFile(path, SimpleController.genSB(packName, clsName, model, auth, zhName));
			path = basePath + "\\I" + clsName + "Client.java";// Client类
			CodeUtil.writeFile(path, SimpleClient.genSB(packName, clsName, auth, zhName));
			
			path = basePath + "\\" + clsName + "Bus.java"; // 生成Service实现类
			CodeUtil.writeFile(path, SimpleBus.genSB(packName, clsName, auth, zhName, fieldList ));
			path = basePath + "\\" + clsName + "Action.java";// 控制器类
			CodeUtil.writeFile(path, SimpleAction.genSB(packName, clsName, model, auth, zhName));
			

		}

		return 1;
	}
}
