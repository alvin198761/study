package com.biyao.admin.sys.syslog.model;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.biyao.admin.sys.syslog.service.ISysLogService;
import com.biyao.admin.sys.user.model.User;
import com.common.constant.Constant;
/**
 * @create 2012-09-13
 * @author GZZ
 * @日志记录辅助类
 */
@Component
public class LogUnit {
	@Autowired
	private ISysLogService syslogService;// 日志表Service
	@Autowired
	private HttpServletRequest request;// 注入当前Request
	private final Log logger = LogFactory.getLog(getClass());
	/**
	 * 记录系统日志
	 * 
	 * @param position
	 *            发生位置
	 * @param detail
	 *            日志内容
	 * @param style
	 *            类型01系统管理，02用户，03接口
	 */
	public void RrecordLog(String position, String detail, String type) {
		logger.debug("写入系统日志------");
		SysLog sysLog = new SysLog();
		sysLog.setPosition(position);
		System.out.println("------------$$$---------" + sysLog.getPosition());
		sysLog.setOccur_time(new Date());
		sysLog.setDetail(detail);// +
		sysLog.setLog_type(type);
		sysLog.setIp(getIP());
		sysLog.setUser_name(getLogName());
		sysLog.setRemark("");
		syslogService.insert(sysLog);
	}

	/**
	 * 取当前用户ID
	 * 
	 * @param type
	 * @return
	 */
	public String getLogName() {
		String username = "";
		if (null != request) {
			HttpSession session = null;
			try {
				session = request.getSession();
				if (null != session) {
					// 取出当前登录用户
					User user = (User) session.getAttribute(Constant.LOGIN_USER);
					logger.debug("取出当前登录用户------");
					if (null != user) {
						username = user.getName();
						logger.debug("取出当前登录用户------username" + username);
					}
				}
			} catch (IllegalStateException e) {
				username = "system";
			}
		}
		return username;
	}
	/**
	 * 取当前用户IP
	 */
	public String getIP() {
		String ip = "";
		InetAddress addr;
		if (null != request) {
			try {
				ip = request.getRemoteAddr();
			} catch (IllegalStateException e) {
				try {
					addr = InetAddress.getLocalHost();
					ip = addr.getHostAddress().toString();// 获得本机IP
				} catch (UnknownHostException e1) {
					e1.printStackTrace();
				}
			}
		}
		return ip;
	}
}
