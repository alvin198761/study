package com.codegen.mvc.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:34:05
 * @功能描述:数据访问匹配器类
 */
@Component
public class DaoAdapter {

	private Map<String, IDao> daoMap = new HashMap<String, IDao>();// 存放所有DAO实现类的集合

	/**
	 * @功能描述: 注入Mysql的DAO访问实现类,并存入集合
	 */
	public @Autowired @Qualifier("mysql") void set2(IDao mysql) {
		daoMap.put("mysql", mysql);
	}

	/**
	 * @功能描述: 注入MSsql的DAO访问实现类,并存入集合
	 */
	public @Autowired @Qualifier("microsoft sql server") void set1(IDao mssql) {
		daoMap.put("microsoft sql server", mssql);
	}

	/**
	 * @功能描述: 注入Oracle的DAO访问实现类,并存入集合
	 */
	public @Autowired @Qualifier("oracle") void set3(IDao mssql) {
		daoMap.put("oracle", mssql);
	}

	/**
	 * @功能描述: 跟据关键字获取指定的数据访问实现类
	 */
	public IDao getDao(String dataBaseType) {
		return daoMap.get(dataBaseType);
	}
}
