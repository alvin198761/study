package com.common.interceptor;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.log4j.Logger;
/**
 * 
 * @author gzz
 * @拦截所有方法如果过期就不执行
 */
public class AroundAdvice implements MethodInterceptor {
	private final Logger logger = Logger.getLogger(getClass());
	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object result;
		if (ParaUtil.is_out) {
			result = null;
			logger.debug("检测到软件已过期,程序未能执行.");
		} else {
			result = invocation.proceed();
		}
		return result;
	}
}
