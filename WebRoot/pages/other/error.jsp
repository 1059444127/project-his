<%@ page language="java" import="cn.ac.big.dp.util.*,java.text.SimpleDateFormat,java.util.*,org.springframework.security.core.context.*,org.springframework.security.core.userdetails.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科临床信息管理系统</title>
<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}'/>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
<link rel="stylesheet" type="text/css" href="pages/search/css/search.css">
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<link rel="stylesheet" type="text/css" href="pages/index/css/index.css">
<script type="text/javascript" src="scripts/html5.js"></script>
<link href="scripts/metro/jq-metro.css" rel="stylesheet" type="text/css" />
<style type="text/css">
html,body,div,table,td,th,input,tr,span,p,ul,li,a,select{
		font-family:"微软雅黑"
	}
.open{
	display:none;
}
</style>
</head>
<body>
	<div style="height:30px;background-color:#666;position:fixed;top:0px;width:100%;z-index:100;">
		<div style="margin-left:20px;z-index:101;color:#fff;padding-top:7px;font-size:14px">
			当前位置&nbsp;:&nbsp;首页<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div>
		</div>
	</div>
	<section style="padding-top: 40px; padding-left: 20px;">
		<div id="metroaqui_novo" class="metro-panel" style="float:left;width:90%">
			 操作不成功，请与管理员联系&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="pages/index/index.jsp" class="btn btn-primary">返回首页</a><br/><br/>
    		发生错误错误的请求地址：<s:property value="#tipCourse"/>&nbsp;&nbsp;&nbsp;<a href="javascript:changeDisplay()" class="btn btn-primary" >详细信息</a>
    		<div id="debugInfo"><s:property value="#tipMessage"/></div>
		</div>
	</section>
	<nav class="win-navigationlayout">
		<div class="container">
			<div class="nav-header">
	            <a href="javascript: fNavStatusToggle()" class="win-command">
	               <span class="win-commandimage PNG-Right"></span>
	            </a>
	            <h2>功能导航</h2>
         	</div>
			<div class="nav-container">
					<ul>
					<li class="win-label"><a href="pages/index/index.jsp">首页</a></li>
					<li class="win-label"><a href="pages/detailInfo/patient_add.jsp" id="ecardM">病例管理</a></li>
					<li class="win-label"><a href="admin/userAction_getAllUsers.action?isFirstSerachFlag=1" id="userM">用户信息管理</a></li>
					<li class="win-label"><a href="admin/codeAction_queryAllDictInfo.action?isFirstSerachFlag=1" id="codeM">代码信息管理</a></li>
					<li class="win-label"><a href="pages/search/search.jsp" id="search">病例检索</a></li>
					<li class="win-label"><a href="diag/diag_getDiagName.action" id="chartM">报表统计</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<footer class="win-commandlayout">
      <div class="container">
         <a class="win-command" onclick="fNavStatusToggle()">
            <span class="win-commandimage PNG-Navigation"></span>
            <span class="win-label">导航</span>
         </a>
         <a class="win-command" href="j_spring_security_logout">
            <span class="win-commandimage PNG-Exit"></span>
            <span class="win-label">退出</span>
         </a>
      </div>
   </footer>
   
   <script type="text/javascript" src="scripts/jquery-1.7.2.min.js"></script>
   <script src="scripts/metro/jquery.metro-btn.js" type="text/javascript"></script>
   <script type="text/javascript">
   		function changeDisplay() {
   			$("#debugInfo").toggleClass("open");
   		}
   		changeDisplay();
   </script>
</body>
</html>
