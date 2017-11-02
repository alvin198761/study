<%@page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>字典类型详细</title>
<%--author:GZZ,DATE:2014-02-15 00:11:52--%>
</head>
<body>
	<div class="ti">字典类型详细</div>
	<table class="dataTab">
		<tr>
			<td>类型标识</td>
			<td>${dicttype.type_code}</td>
			<td>类型名称</td>
			<td>${dicttype.type_name}</td>
			<td>备注</td>
			<td>${dicttype.remark}</td>
			<td>时间戳</td>
			<td><fmt:formatDate value="${dicttype.ts}" type="both" /></td>
			<%--type取值还有date,time,中文年月日时分秒等--%>
		</tr>
	</table>
	<iframe width="100%" height="500px" frameborder="0" src="${webPath}/dict/list?typeid=${dicttype.id}"></iframe>
</body>
</html>