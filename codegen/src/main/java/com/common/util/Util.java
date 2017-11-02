package com.common.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.biyao.admin.sys.user.model.User;
import com.common.constant.Constant;

public class Util {

	/**
	 * 把组数拼接成IN语句(字符型)
	 * 
	 * @author GZZ
	 * @param arr
	 * @return
	 */
	public static String ArrayToIn(String ids) {// 字符IN字符窜
		String[] arr = ids.split(",");
		if (arr.length < 1) {
			return "";
		}
		StringBuffer sb = new StringBuffer(" IN (");
		for (int i = 0; i < arr.length; i++) {
			if (i < arr.length - 1) {
				sb.append("'" + arr[i] + "',");
			} else {
				sb.append("'" + arr[i] + "'");
			}
		}
		sb.append(")");
		return sb.toString();
	}

	/**
	 * 把组数拼接成IN语句(数值型)
	 * 
	 * @author GZZ
	 * @param arr
	 * @return
	 */
	public static String ArrayToInNum(String ids) {// 数值IN字符窜
		String[] arr = ids.split(",");
		StringBuffer sb = new StringBuffer(" IN (");
		for (int i = 0; i < arr.length; i++) {
			if (i < arr.length - 1) {
				sb.append(arr[i] + ",");
			} else {
				sb.append(arr[i]);
			}
		}
		sb.append(")");
		return sb.toString();
	}

	/**
	 * 将NULL字符串转为""
	 */
	public static String nvl(Object str) {
		return str == null ? "" : str.toString();
	}

	/**
	 * 将List转为数组
	 */
	public static Object[] ListToArray(List<String> list) {
		if (list.size() > 0) {
			String[] strings = new String[list.size()];
			list.toArray(strings);
			return strings;
		} else {
			return null;
		}
	}

	/**
	 * 取登录用户
	 */
	public static User getUser(HttpSession session) {
		User user = (User) session.getAttribute(Constant.LOGIN_USER);
		return user;
	}

	/**
	 * session是否过期
	 */
	public static boolean getTimeOut(HttpSession session) {
		boolean timeOut = false;
		User user = (User) session.getAttribute(Constant.LOGIN_USER);
		if (null == user) {
			timeOut = true;
		}
		return timeOut;
	}

	/**
	 * 取登录用户名
	 */
	public static String getLoginId(HttpSession session) {
		String login_id = null;
		User user = getUser(session);
		if (null != user && null != user.getLogin_id()) {
			login_id = user.getLogin_id();
		}
		return login_id;
	}

	/**
	 * 取登录用户ID
	 */
	public static String getUserId(HttpSession session) {
		String userId = null;
		User user = getUser(session);
		if (null != user && null != user.getId()) {
			userId = user.getId();
		}
		return userId;
	}

	/**
	 * 取登录用户名字
	 */
	public static String getLoginName(HttpSession session) {
		String userName = null;
		User user = getUser(session);
		if (null != user && null != user.getName()) {
			userName = user.getName();
		}
		return userName;
	}

	/**
	 * 取@之前的字符
	 */
	public static String getName(String str) {
		String[] strarray = str.split("@");
		return strarray[0];
	}

	public static Date addDay(Date date) {
		if (date != null) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.DATE, 1);
			return cal.getTime();
		} else {
			return null;
		}
	}

	/**
	 * 向客户端输出XML文件
	 * 
	 * @param response
	 * @param document
	 */
	public static void writeXml(HttpServletResponse response, Document document) {
		response.setContentType("text/xml; charset=utf-8");
		response.setHeader("Cache-Control", "no-cache"); // 取消浏览器缓存
		PrintWriter out;
		try {
			out = response.getWriter();
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("utf-8");
			XMLWriter writer = new XMLWriter(out, format);
			writer.write(document);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 拼加javaScript
	 */
	public static String writeJS(String path, HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append("<script>window.parent.location.replace('");
		sb.append(request.getContextPath());
		sb.append(path);
		sb.append("');</script>");
		return sb.toString();
	}
}
