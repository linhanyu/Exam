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
		var paperName=$("#paperName").val();
		if(paperName==null || paperName==""){
			$("#error").html("试卷名称不能为空！");
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
		<form action="paper_savePaper" method="post" onsubmit="return checkForm()">
		<table width="40%" align="center">
			<tr>
				<td><label>试卷名称：</label></td>
				<td><input type="text" id="paperName" name="paperName" value="${paper.paperName }"/></td>
			</tr>
			<tr>
				<td>
					<input type="hidden" id="id" name="id" value="${paper.id }"/>
					<button class="btn btn-primary" type="submit">保存</button>
				</td>
				<td>
					<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
					&nbsp;&nbsp;<font id="error" color="red"></font>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>