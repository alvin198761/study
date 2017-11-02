<%@page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>角色详细</title>
<%--author:GZZ,DATE:2014-02-15 12:59:49--%>
</head>
<body>
	<div class="ti">角色详细</div>
	<table class="dataTab">
		<tr>
			<td class="right30">名称</td>
			<td>${role.name}</td>
		</tr>
		<tr>
			<td class="right30">时间戳</td>
			<td><fmt:formatDate value="${role.ts}" type="both" /></td>
			<%--type取值还有date,time,中文年月日时分秒等--%>
		</tr>
		<tr>
			<td class="right30">备注</td>
			<td>${role.remark}</td>
		</tr>
		<tr>
			<td class="right30">删除标志</td>
			<td>${role.dr}</td>
		</tr>
	</table>
</body>
</html>