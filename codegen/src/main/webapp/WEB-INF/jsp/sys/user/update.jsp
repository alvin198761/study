<%@page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户修改</title>
<%--author:GZZ,DATE:2014-02-16 00:23:30--%>
</head>
<script type="text/javascript">
	function update_onclick() {//更新记录
		form1.action = "${webPath}/user/update";
		notBlank("organize_id", "组织机构");//非空验证
		notBlank("login_id", "登录名");//非空验证
		notBlank("name", "姓名");//非空验证
		if (count > 0) {
			count = 0;
			return false;
		}
		form1.submit();
	}
	function list_back() {//返回列表
		form1.action = "${webPath}/user/list";
		form1.submit();
	}
</script>
<body>
	<form:form name="form1" method="post" commandName="user">
		<div class="ti">用户修改</div>
		<form:hidden path="id" />
		<table class="dataTab">
			<tr>
				<td class="right30">姓名</td>
				<td class="left30"><form:input path="name" maxlength="50"  /><font color="#CE0000">*</font></td>
				<td class="left30_red" id="name_td"><form:errors path="name" /></td>
			</tr>
			<tr>
				<td class="right30">登录名</td>
				<td class="left30"><form:input path="login_id" maxlength="50"  /><font color="#CE0000">*</font></td>
				<td class="left30_red" id="login_id_td"><form:errors path="login_id" /></td>
			</tr>
			<tr>
				<td class="right30">性别</td>
				<td class="left30"><form:select path="sex_stat" items="${sexmap}" class="sel"/><font color="#CE0000">*</font></td>
				<td class="left30_red" id="sex_stat_td"><form:errors path="sex_stat" /></td>
			</tr>
			<tr>
				<td class="right30">电邮</td>
				<td class="left30"><form:input path="e_mail" maxlength="50"  /></td>
				<td class="left30_red" id="e_mail_td"><form:errors path="e_mail" /></td>
			</tr>
			<tr>
				<td class="right30">组织机构</td>
				<td class="left30"><form:input path="org_name"  readonly="readonly" onClick="getAreaRef('org_name','organize_id','${webPath}');"
					class="inputref" /><form:hidden path="organize_id" /><font color="#CE0000">*</font></td>
				<td class="left30_red" id="organize_id_td"><form:errors path="organize_id" /></td>
			</tr>
			<tr>
				<td class="right30">身份证号</td>
				<td class="left30"><form:input path="id_card" maxlength="50"  /></td>
				<td class="left30_red" id="id_card_td"><form:errors path="id_card" /></td>
			</tr>
			<tr>
				<td class="right30">联系电话</td>
				<td class="left30"><form:input path="tel" maxlength="50"  /></td>
				<td class="left30_red" id="tel_td"><form:errors path="tel" /></td>
			</tr>
			<tr>
				<td class="right30">备注</td>
				<td class="left30"><form:textarea path="remark" maxlength="200"  class="tarea" />
					<div id="remark_div">最大长度为200个字节</div></td>
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
	$('#organize_id').bind('input propertychange', function() {notBlank('organize_id', '组织机构');});
	$('#login_id').bind('input propertychange', function() {notBlank('login_id', '登录名');});
	$('#name').bind('input propertychange', function() {notBlank('name', '姓名');});
	$('#remark').bind('input propertychange', function() {notifyLength(this);});
</script>
</html>