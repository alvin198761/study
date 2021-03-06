<%@page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>角色修改</title>
<%--author:GZZ,DATE:2014-02-15 12:59:49--%>
</head>
<script type="text/javascript">
	function update_onclick() {//更新记录
		form1.action = "${webPath}/role/update";
		notBlank("name", "名称");//非空验证
		if (count > 0) {
			count = 0;
			return false;
		}
		form1.submit();
	}
	function list_back() {//返回列表
		form1.action = "${webPath}/role/list";
		form1.submit();
	}
</script>
<body>
	<form:form name="form1" method="post" commandName="role">
		<div class="ti">角色修改</div>
		<form:hidden path="id" />
		<table class="dataTab">
			<tr>
				<td class="right30">名称</td>
				<td class="left30"><form:input path="name" /><font color="#CE0000">*</font></td>
				<td class="left30_red" id="name_td"><form:errors path="name" /></td>
			</tr>
			<tr>
				<td class="right30">备注</td>
				<td class="left30"><form:textarea path="remark" maxlength="300"  class="tarea" />
					<div id="remark_div">最大长度为300个字节</div></td>
				<td class="left30_red" id="remark_td"><form:errors path="remark" /></td>
			</tr>
		</table>
		<center class="btn_div">
			<input type="button" icon="icon-save" onclick="update_onclick()" value="保存"/>
			<input type="button" icon="icon-retry" onclick="list_back()"	value="返回"/>
		</center>
	</form:form>
</body>
<script type="text/javascript">
	$('#name').bind('input propertychange', function() {notBlank('name', '名称');});
	$('#remark').bind('input propertychange', function() {notifyLength(this);});
</script>
</html>