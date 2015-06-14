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
    
    <title>My JSP 'selectPaper.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function checkForm(){
		var paperId=$("#id").val();
		if(paperId==null || paperId==""){
			alert("请选择考试试卷！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="data_list">
	<div class="data_content">
		<form action="paper_getDetailPaper" method="post" onsubmit="return checkForm()">
			<table width="40%" align="center">
				<tr>
					<td><label><strong>请选择考试试卷：</strong></label></td>
					<td>
						<select id="id" name="id">
							<option value="">请选择...</option>
							<c:forEach var="paper" items="${paperList }">
								<option value="${paper.id }">${paper.paperName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td>
						<input type="submit" class="btn btn-primary" value="确定"/>
					</td>
					<td>
						<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>