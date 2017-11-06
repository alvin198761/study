package com.codegen.mvc.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:46:15
 * @功能描述:代码生成器业务逻辑适配器类
 */
@Component
public class ServiceAdapter {

	private Map<String, IService> serviceMap = new HashMap<String, IService>();// 存放不同业务逻辑实现的集合

	/**
	 * @功能描述: 注入列表型的代码生成业务逻辑访问实现类,并存入集合
	 */
	public @Autowired @Qualifier("list") void set1(IService list) {
		serviceMap.put("list", list);
	}

	/**
	 * @功能描述: 跟据关键字获取指定的业务逻辑实现类
	 */
	public IService getService(String codeType) {
		return serviceMap.get(codeType);
	}
}
