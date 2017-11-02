package com.codegen.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentUtil {
	/**
	 * @方法说明: 类中的分隔提示信息
	 */
	public static StringBuilder separate() {
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n");
		sb.append("\r\n	/************************************************************");
		sb.append("\r\n	 * 以下方法请跟据实际业务进行取舍或修改、把不用的方法清理掉!!!!*");
		sb.append("\r\n	 ************************************************************/");
		return sb;
	}

	/**
	 * @方法说明: 类注释
	 */
	public static StringBuilder classComment(String author, String name) {
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n");
		sb.append("\r\n/**");
		sb.append("\r\n * @类说明:" + name);
		sb.append("\r\n *");
		sb.append("\r\n * @author:" + author);
		sb.append("\r\n * @date:" + getTime());
		sb.append("\r\n **/");
		return sb;
	}

	/**
	 * @方法说明: 方法注释
	 */
	public static StringBuilder methodComment(String method_name) {
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n");
		sb.append("\r\n	/**");
		sb.append("\r\n	 * @方法说明:" + method_name);
		sb.append("\r\n	 **/");
		return sb;
	}

	/**
	 * @方法说明: JSP页面注释
	 */
	public static StringBuilder htmlComment(String CNName, String author) {
		return new StringBuilder("\r\n<title>" + CNName + "<%--author:" + author + ",DATE:" + getTime() + "--%></title>");
	}

	/**
	 * @方法说明: 格式化的日期时间
	 */
	public static String getTime() {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return formatter.format(date);
	}

	/**
	 * @方法说明: JSP文件头部
	 */
	public static StringBuilder htmlHead(String CNName, String author) {
		StringBuilder sb = new StringBuilder();
		sb.append("<%@page language=\"java\" pageEncoding=\"utf-8\"%>");
		sb.append("\r\n<%@include file=\"/WEB-INF/jsp/include.jsp\"%>");
		sb.append("\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
		sb.append("\r\n<html>");
		sb.append("\r\n<head>");
		sb.append("\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
		sb.append(htmlComment(CNName, author));
		sb.append("\r\n</head>");
		return sb;
	}
}
