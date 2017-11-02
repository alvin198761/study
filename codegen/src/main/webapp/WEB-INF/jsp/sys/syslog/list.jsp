<%@page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统日志列表</title>
<%--author:GZZ,DATE:2014-02-15 23:24:48--%>
</head>
<script type="text/javascript">
	function delete_onclick(id) {//删除单条记录
		if (confirm('确定删除吗？')) {
			form1.action = "${webPath}/syslog/delete?id=" + id;
			form1.submit();
		}
	}
	function delete_onclick_mu() {//删除多条记录
		var ids = "";
		var idsObj = $(":checkbox[name='chk']:checked").each(function() {
			ids += $(this).val() + ",";
		});
		if (idsObj.length == 0) {
			alert("请选择记录！");
			return;
		}
		if (!confirm("确定删除这些数据吗？")) {
			return;
		}
		form1.action = "${webPath}/syslog/delete?id=" + ids;
		form1.submit();
	}
	function query_onclick() {//按条件查询
		form1.action = "${webPath}/syslog/list";
		form1.submit();
	}
	function query_clean() {//清空查询条件
		$("#log_type_c").val("");
		$("#position_c").val("");
		$("#ip_c").val("");
		$("#user_name_c").val("");
		$("#detail_c").val("");
		$("#start_time").val("");
		$("#end_time").val("");
	}
</script>
<body>
	<form:form name="form1" method="post" commandName="cond">
		<div class="ti">系统日志查询</div>
		<table class="SearchTab">
			<tr>
				<td align="right">类型</td>
				<td><form:input path="log_type_c" /></td>
				<td align="right">发生位置</td>
				<td><form:input path="position_c" /></td>
				<td align="right">IP地址</td>
				<td><form:input path="ip_c" /></td>
				<td align="right">操作用户</td>
				<td><form:input path="user_name_c" /></td>
			</tr>
			<tr>
				<td align="right">详细</td>
				<td><form:input path="detail_c" /></td>
				<td align="right">开始时间</td>
				<td><form:input path="start_time" format="yyyy-MM-dd HH:mm:ss" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  /></td>
				<td align="right">结束时间</td>
				<td><form:input path="end_time" format="yyyy-MM-dd HH:mm:ss" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  /></td>
				<td></td>
				<td>
					<input type="button" icon="icon-search" value="查询" onclick="query_onclick()" /> 
					<input type="button" icon="icon-reload" value="清空"	onclick="query_clean()" />
				</td>
			</tr>
		</table>
		<table class="titleTab">
			<tr>
				<td class="ti">系统日志列表</td>
				<td class="bu">
					<input type="button" icon="icon-delete" value="删除" onclick="delete_onclick_mu()" />
				</td>
			</tr>
		</table>
		<table class="dataTab">
			<tr>
				<th><input type="checkbox" id="chkAll" onclick="checkAll()">序号</th>
				<th>类型</th>
				<th>发生位置</th>
				<th>IP地址</th>
				<th>操作用户</th>
				<th>详细</th>
				<th>备注</th>
				<th>发生时间</th>
				<th>删除</th>
			</tr>
			<c:forEach items="${dataList}" var="wz" varStatus="vs">
				<tr>
					<td class="sqe_w" ><input type="checkbox" name="chk" value="${wz['id']}" /> <u:sequence index="${vs.count}" /></td>
					<td>${wz['log_type']}</td>
					<td>${wz['position']}</td>
					<td>${wz['ip']}</td>
					<td>${wz['user_name']}</td>
					<td>${wz['detail']}</td>
					<td>${wz['remark']}</td>
					<td><fmt:formatDate value="${wz['occur_time']}" type="both" /></td>
					<td class="td-del" onclick="delete_onclick('${wz['id']}')"></td>
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="/WEB-INF/jsp/page.jsp" />
	</form:form>
</body>
</html>