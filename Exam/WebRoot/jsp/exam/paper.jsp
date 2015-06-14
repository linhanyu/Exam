<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'paper.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	//禁止按键F5
	document.onkeydown = function(e) {
		e = window.event || e;
		var keycode = e.keyCode || e.which;
		if (keycode = 116) {
			if (window.event) {// ie
				try {
					e.keyCode = 0;
				} catch (e) {
				}
				e.returnValue = false;
			} else {// ff
				e.preventDefault();
			}
		}
	}

	//禁止鼠标右键菜单
	document.oncontextmenu = function(e) {
		return false;
	}
</script>
</script>
<script type="text/javascript">
	var examTime=30*60;
	var useTime=0,remainTime=examTime;
	
	function showCount(){
		
		if(remainTime==0){
			document.getElementById("myForm").submit();
		}
		
		useTime+=1;
		remainTime-=1;
		
		//计算考试时间
		var hourU=Math.floor(useTime/3600);
		var minuteU=Math.floor((useTime-hourU*3600)/60);
		var secondU=Math.floor(useTime-hourU*3600-minuteU*60);
		document.getElementById("useTime").innerHTML=format(hourU)+":"+format(minuteU)+":"+format(secondU);
		
		var hourR=Math.floor(remainTime/3600);
		var minuteR=Math.floor((remainTime-hourR*3600)/60);
		var secondR=Math.floor(remainTime-hourR*3600-minuteR*60);
		document.getElementById("remainTime").innerHTML=format(hourR)+":"+format(minuteR)+":"+format(secondR);
	}
	
	function format(timeNumber){
		if(timeNumber<10){
			return "0"+timeNumber;
		}else{
			return timeNumber;
		}
	}
	
	window.setInterval("showCount()", 1000);
</script>
</head>
<body>
	<div class="data_list">
		<div class="data_info">
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考试时间：<strong>30分钟</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				计时：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="useTime"
					style="font-weight: bold;"></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				剩余时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="remainTime"
					style="font-weight: bold;"></font>
			</p>
			<hr />
			<p class="examTitle" align="center">${paper.paperName}&nbsp;&nbsp;</p>
			<p class="examScoreInfo">(&nbsp;满分100&nbsp;&nbsp;单选题50分&nbsp;&nbsp;多选题50分&nbsp;)</p>
		</div>
		<div class="data_exam_content">
			<form id="myForm" action="exam!add" method="post">
				<input type="hidden" name="exam.student.id"
					value="${currentUser.id }" /> <input type="hidden"
					name="exam.paper.id" value="${paper.id }" /> <strong><big>一.单选题</big></strong>(每题5分，答错不得分)<br />
				<br />
				<c:forEach var="s" items="${squestionSet}" varStatus="status">
					<strong>[&nbsp;${status.index+1 }&nbsp;]&nbsp;${s.subject }</strong>
					<br />
					<br />
					<label class="radio"> <input type="radio"
						name="id-r-${s.id }" value="A" /> A.${s.optionA }
					</label>
					<label class="radio"> <input type="radio"
						name="id-r-${s.id }" value="B" /> B.${s.optionB }
					</label>
					<label class="radio"> <input type="radio"
						name="id-r-${s.id }" value="C" /> C.${s.optionC }
					</label>
					<label class="radio"> <input type="radio"
						name="id-r-${s.id }" value="D" /> D.${s.optionD }
					</label>
					<br />
				</c:forEach>
				<br /> <strong><big>一.多选题</big></strong>(每题10分，答错不得分)<br />
				<br />
				<c:forEach var="m" items="${mquestionSet}" varStatus="status">
					<strong>[&nbsp;${status.index+1 }.&nbsp;]&nbsp;${m.subject }</strong>
					<br />
					<br />
					<label class="checkbox"> <input type="checkbox"
						name="id-c-${m.id }" value="A" /> A.${m.optionA }
					</label>
					<label class="checkbox"> <input type="checkbox"
						name="id-c-${m.id }" value="B" /> B.${m.optionB }
					</label>
					<label class="checkbox"> <input type="checkbox"
						name="id-c-${m.id }" value="C" /> C.${m.optionC }
					</label>
					<label class="checkbox"> <input type="checkbox"
						name="id-c-${m.id }" value="D" /> D.${m.optionD }
					</label>
					<br />
				</c:forEach>
				<button class="btn btn-primary" type="submit">交卷</button>
			</form>
		</div>
	</div>
</body>
</html>