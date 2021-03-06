<%@page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统参数修改</title>
<%--author:GZZ,DATE:2014-02-15 11:09:23--%>
</head>
<script type="text/javascript">
	function update_onclick() {//更新记录
		form1.action = "${webPath}/param/update";
		notBlank("name", "参数名称");//非空验证
		notBlank("param_key", "参数键");//非空验证
		notBlank("param_value", "参数值");//非空验证
		if (count > 0) {
			count = 0;
			return false;
		}
		form1.submit();
	}
	function list_back() {//返回列表
		form1.action = "${webPath}/param/list";
		form1.submit();
	}
</script>
<body>
	<form:form name="form1" method="post" commandName="param">
		<div class="ti">系统参数修改</div>
		<form:hidden path="id" />
		<table class="dataTab">
			<tr>
				<td class="right30">参数名称</td>
				<td class="left30"><form:input path="name" maxlength="50"  /><font color="#CE0000">*</font></td>
				<td class="left30_red" id="name_td"><form:errors path="name" /></td>
			</tr>
			<tr>
				<td class="right30">参数键</td>
				<td class="left30"><form:input path="param_key" maxlength="50"  /><font color="#CE0000">*</font></td>
				<td class="left30_red" id="param_key_td"><form:errors path="param_key" /></td>
			</tr>
			<tr>
				<td class="right30">参数值</td>
				<td class="left30"><form:input path="param_value" maxlength="100"  /><font color="#CE0000">*</font></td>
				<td class="left30_red" id="param_value_td"><form:errors path="param_value" /></td>
			</tr>
			<tr>
				<td class="right30">是否启用</td>
				<td class="left30"><form:radiobutton path="usable" value="1" />启用<form:radiobutton path="usable" value="0" />禁用</td>
				<td></td>
			</tr>
			<tr>
				<td class="right30">备注</td>
				<td class="left30"><form:textarea path="remark" maxlength="200"  class="tarea" />
					<div id="remark_div">最大长度为200个字节</div></td>
				<td></td>
			</tr>
		</table>
		<center class="btn_div">
			<input type="button" icon="icon-save" onclick="update_onclick()" value="保存"/>
			<input type="button" icon="icon-retry" onclick="list_back()"	value="返回"/>
		</center>
	</form:form>
</body>
<script type="text/javascript">
	$('#name').bind('input propertychange', function() {notBlank('name', '参数名称');});
	$('#param_key').bind('input propertychange', function() {notBlank('param_key', '参数键');});
	$('#param_value').bind('input propertychange', function() {notBlank('param_value', '参数值');});
</script>
</html>