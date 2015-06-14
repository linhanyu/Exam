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
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>查看试题</p>
	</div>
	<div class="data_content">
		<table width="90%" align="center">
			<tr>
				<td><label>题目名称：</label></td>
				<td>
					<input type="text" id="subject" value="${question.subject }" readonly="readonly" class="input-xxlarge"/>
				</td>
			</tr>
			<tr>
				<td><label>题目类型：</label></td>
				<td>
					<c:choose>
						<c:when test="${question.type==1 }">
							<input type="text" id="type" value="单选题" readonly="readonly"/>
						</c:when>
						<c:otherwise>
							<input type="text" id="type" value="多选题" readonly="readonly"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td><label>所属试卷：</label></td>
				<td>
					<input type="text" id="paperName" value="${question.paper.paperName }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td><label>加入时间：</label></td>
				<td>
					<input type="text" id="joinTime" value="<fmt:formatDate value="${question.joinTime }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td><label>选项一：</label></td>
				<td>
					<input type="text" id="optionA" value="${question.optionA }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td><label>选项二：</label></td>
				<td>
					<input type="text" id="optionB" value="${question.optionB }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td><label>选项三：</label></td>
				<td>
					<input type="text" id="optionC" value="${question.optionC }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td><label>选项四：</label></td>
				<td>
					<input type="text" id="optionD" value="${question.optionD }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td><label>题目答案：</label></td>
				<td>
					<input type="text" id="answer" value="${question.answer }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>