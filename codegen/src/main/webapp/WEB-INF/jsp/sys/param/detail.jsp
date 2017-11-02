<%@page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统参数详细</title>
<%--author:GZZ,DATE:2014-02-15 11:09:23--%>
</head>
<body>
	<div class="ti">系统参数详细</div>
	<table class="dataTab">
		<tr>
			<td class="right30">参数名称</td>
			<td>${param.name}</td>
		</tr>
		<tr>
			<td class="right30">参数键</td>
			<td>${param.param_key}</td>
		</tr>
		<tr>
			<td class="right30">备注</td>
			<td>${param.remark}</td>
		</tr>
		<tr>
			<td class="right30">时间戳</td>
			<td><fmt:formatDate value="${param.ts}" type="both" /></td>
			<%--type取值还有date,time,中文年月日时分秒等--%>
		</tr>
		<tr>
			<td class="right30">参数值</td>
			<td>${param.param_value}</td>
		</tr>
		<tr>
			<td class="right30">删除标记</td>
			<td>${param.dr}</td>
		</tr>
		<tr>
			<td class="right30">是否启用</td>
			<td>${param.usable}</td>
		</tr>
	</table>
</body>
</html>