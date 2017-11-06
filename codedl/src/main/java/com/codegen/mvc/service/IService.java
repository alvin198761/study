package com.codegen.mvc.service;

import com.codegen.mvc.model.InitPara;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:43:13
 * @功能描述:代码生成器业务逻辑接口类
 */
public interface IService {

	/**
	 * @功能描述: 生成代码
	 */
	public int gencode(InitPara para) throws Exception;
}
