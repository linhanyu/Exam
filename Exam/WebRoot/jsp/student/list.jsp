<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function studentDelete(studentId){
		if(confirm("确定要删除这条记录吗?")){
			$.post("student_deleteStudent",{id:studentId},
				function(result){
					var result=eval('('+result+')');
					if(result.success){
						alert("删除成功！");
						window.location.href="student_list?page="+"${page}";
					}else{
						alert("删除失败");
					}
				}
			);
		}
	}
</script>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>考生信息管理</p>
	</div>
	<div class="search_content">
		<form action="student_list" method="post">
			<table align="center">
				<tr>
					<td><label>姓名：</label></td>
					<td><input type="text" id="sname" name="sName" value="${sName }"/></td>
					<td>&nbsp;</td>
					<td><button class="btn btn-primary" style="margin-bottom: 8px" type="submit">查询</button></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><button style="float: right;margin-bottom: 8px;" class="btn btn-mini btn-primary" type="button" onclick="javascript:window.location='student_preSave'">添加考生信息</button></td>
				</tr>
			</table>
		</form>
		
	</div>
	<div class="data_content">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>学校</th>
				<th>专业</th>
				<th>电话</th>
				<th>操作</th>
			</tr>
			<c:forEach var="student" items="${studentList }" varStatus="status">
			<tr>
				<td>${(page-1)*5+(status.index+1) }</td>
				<td>${student.name }</td>
				<td>${student.sex }</td>
				<td>${student.school}</td>
				<td>${student.major }</td>
				<td>${student.phone }</td>
				<td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='student_preSave?id=${student.id}&page=${page }'">修改</button>&nbsp;&nbsp;<button class="btn btn-mini btn-danger" type="button" onclick="studentDelete('${student.id}')">删除</button></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<div class="pagination pagination-centered">
			<ul>
				${pageCode }
			</ul>
		</div>
	</div>
</div>
</body>
</html>