package com.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
public class TimeIntceptor implements HandlerInterceptor {

	private final Log logger = LogFactory.getLog(getClass());
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
	}
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		if (ParaUtil.is_out) {
			response.sendRedirect(request.getContextPath() + "/timeout.jsp");
			logger.debug("检测到软件已过期,程序将退出.");
			//System.exit(0);
			return false;
		} else {
			return true;
		}

	}

}