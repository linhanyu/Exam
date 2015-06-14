<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'save.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function checkForm(){
		var name=$("#name").val();
		var sex=$("#sex").val();
		var cardNo=$("#school").val();
		var prefession=$("#major").val();
		var password=$("#password").val();
		var password=$("#phone").val();
		
		if(name==null || name==""){
			$("#error").html("姓名不能为空！");
			return false;
		}
		if(sex==null || sex==""){
			$("#error").html("请选择性别！");
			return false;
		}
		if(school==null || school==""){
			$("#error").html("学校不能为空！");
			return false;
		}
		if(major==null || major==""){
			$("#error").html("专业不能为空！");
			return false;
		}
		if(password==null || password==""){
			$("#error").html("密码不能为空！");
			return false;
		}
		if(phone==null || phone==""){
			$("#error").html("电话不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>${title }</p>
	</div>
	
	<div class="data_content">
		<form action="student_saveStudent?page=${page}" method="post" onsubmit="return checkForm()">
		<table width="80%" align="center">
			<tr>
				<td><label>姓名：</label></td>
				<td><input type="text" id="name" name="name" value="${student.name }"/></td>
				<td>&nbsp;</td>
				<td><label>性别：</label></td>
				<td>
					<select id="sex" name="sex">
						<option value="">请选择性别：</option>
						<option value="男" ${student.sex=='男'?'selected':'' }>男</option>
						<option value="女" ${student.sex=='女'?'selected':'' }>女</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>学校：</label></td>
				<td><input type="text" id="school" name="school" value="${student.school }"/></td>
				<td></td>
				<td><label>专业：</label></td>
				<td><input type="text" id="major" name="major" value="${student.major }"/></td>
			</tr>
			<tr>
				<td><label>密码：</label></td>
				<td><input type="password" id="password" name="password" value="${student.password}"/></td>
				<td></td>
				<td><label>电话：</label></td>
				<td><input type="text" id="phone" name="phone" value="${student.phone }"/></td>
			</tr>
			<tr>
				<td>
					<input type="hidden" id="id" name="id" value="${student.id }"/><button class="btn btn-primary" type="submit">保存</button>
				</td>
				<td colspan="4">
					<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
					&nbsp;&nbsp;<font id="error" color="red">${error }</font>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>