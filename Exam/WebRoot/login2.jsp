<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    var msg = '${error}';
	    if (msg != "") {
		alert(msg);
	}
	
	function checkForm(){
		var name=document.getElementById("name").value;
		var password=document.getElementById("password").value;
		if(name==null || name==""){
			alert("用户名不能为空！");
			return false;
		}
		if(password==null || password==""){
			alert("密码不能为空！");
			return false;
		}
		return true;
	}

	function resetValue(){
		document.getElementById("name").value="";
		document.getElementById("password").value="";
	}
</script>
</head>
<body>
<div align="center" style="padding-top: 35px;">
	<form action="manager_login" method="post" onsubmit="return checkForm()">
	<table width="1004" height="547" background="image/login.jpg">
		<tr height="200">
			<td colspan="4"></td>
		</tr>
		<tr height="10">
			<td width="68%"></td>
			<td width="10%"><label>用户名：</label></td>
			<td><input type="text" id="name" name="name" value="${name }"/></td>
			<td width="30%"></td>
		</tr>
		<tr height="10">
			<td width="68%"></td>
			<td width="10%"><label>密码：</label></td>
			<td><input type="password" id="password" name="password" value="${password }"/></td>
			<td width="30%"></td>
		</tr>
		<tr height="10">
			<td width="68%"></td>
			<td width="10%"><button class="btn btn-primary" type="submit">登录</button></td>
			<td><button class="btn btn-primary" type="button" onclick="resetValue()">重置</button></td>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>
