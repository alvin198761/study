package com.codegen.mvc.service;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codegen.mvc.dao.DaoAdapter;
import com.codegen.mvc.dao.IDao;
import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;
import com.codegen.util.CodeUtil;
import com.common.constant.Constant;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:21:23
 * @功能描述:生成器基本业务罗辑
 */
@Service
public class BaseService {

	protected IDao dao;// 生成器数据访问类
	@Autowired
	protected DaoAdapter adapter;// 数据访问匹配器类

	/**
	 * @功能描述: 根据不同的数据库类开配置不同实现类
	 */
	@PostConstruct
	protected void init() {
		dao = adapter.getDao(Constant.DATABASE.toLowerCase());
	}

	protected String userPath = System.getProperty("user.dir") + "\\src\\main\\";

	/**
	 * @功能描述: 查询数据库中表名列表
	 */
	public List<Table> queryTableList(InitPara para) {

		List<Table> list = dao.queryTableList(para);
		String name = null;
		for (Table table : list) {
			name = table.getTable_name().toLowerCase();
			table.setClass_name(CodeUtil.getClassName(name));
		}
		return list;
	}

	/**
	 * @功能描述: 查询表中字段列表
	 */
	public List<Field> queryColumnList(String tablename) {
		return dao.queryColumnList(tablename);
	}

}
