<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'examList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>考生成绩列表</p>
	</div>
	<div class="search_content">
		<form action="exam!list" method="post">
			<table align="center">
				<tr>
					<td><label>学生姓名：</label></td>
					<td><input type="text" id="s_id" name="exam.student.name" value="${exam.student.name }"/></td>
					<td>&nbsp;</td>
					<td><label>试题名称：</label></td>
					<td><input type="text" id="s_name" name="exam.paper.paperName" value="${exam.paper.paperName }"/></td>
					<td>&nbsp;</td>
					<td><button class="btn btn-primary" style="margin-bottom: 8px" type="submit">查询</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="data_content">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>考生姓名</th>
				<th>试卷名称</th>
				<th>考试日期</th>
				<th>单选题得分</th>
				<th>多选题得分</th>
				<th>总分</th>
			</tr>
			<c:forEach var="exam" items="${examList }" varStatus="status">
			<tr>
				<td>${status.index+1 }</td>
				<td>${exam.student.name }</td>
				<td>${exam.paper.paperName }</td>
				<td><fmt:formatDate value="${exam.examDate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${exam.singleScore }</td>
				<td>${exam.moreScore }</td>
				<td><font color="red">${exam.score }</font></td>
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