<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatePassword.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function checkForm(){
		var newPassword=$("#newPassword").val();
		var newPassword2=$("#newPassword2").val();
		if(newPassword==null || newPassword==""){
			alert("请输入新密码！");
			return false;
		}
		if(newPassword2==null || newPassword2==""){
			alert("请输入确认新密码！");
			return false;
		}
		if(newPassword!=newPassword2){
			alert("确认新密码与新密码不同，请重新输入！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>修改个人密码</p>
	</div>
	<div class="data_content">
		<form action="student!updatePassword" method="post" onsubmit="return checkForm()">
			<input type="hidden" name="id" value="${currentUser.id }"/>
			<table width="40%" align="center">
				<tr>
					<td><label>用户名：</label></td>
					<td>
						<input type="text" value="${currentUser.name }" name="name" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td><label>新密码：</label></td>
					<td>
						<input type="password" id="newPassword" name="password"/>
					</td>
				</tr>
				<tr>
					<td><label>确认新密码：</label></td>
					<td>
						<input type="password" id="newPassword2" />
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-primary" type="submit">修改密码</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>