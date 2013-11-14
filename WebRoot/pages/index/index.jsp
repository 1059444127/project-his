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
</style>
</head>
<body>
	<div style="height:30px;background-color:#666;position:fixed;top:0px;width:100%;z-index:100;">
		<div style="margin-left:20px;z-index:101;color:#fff;padding-top:7px;font-size:14px">
			当前位置&nbsp;:&nbsp;首页<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div>
		</div>
	</div>
	<header>
		<div style="float:left;margin-left:-40px;margin-top:50px;font-size:40px;">开始</div>
		<div class="user">
			<!-- <span class="userName"></span> -->
			<% User ud = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();%>
			<% 
				Date date = new Date(); 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
				String formatDate = sdf.format(date);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				String weekStr = "";
				int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
				switch(dayOfWeek){
				case 1:weekStr = "星期日";break;
				case 2:weekStr = "星期一";break;
				case 3:weekStr = "星期二";break;
				case 4:weekStr = "星期三";break;
				case 5:weekStr = "星期四";break;
				case 6:weekStr = "星期五";break;
				case 7:weekStr = "星期六";
				}
			
			%>
			<div class="userImg" style="float:right;margin-top:40px;margin-left:10px"></div>
			<div style="float:right;font-size:20px;margin-top:50px;"><%=ud.getUsername()%></div>
			<div style="float:right;font-size:14px;margin-top:80px;margin-right:-40px"><%=formatDate+" "+weekStr%></div>
		</div>
	</header>
	<section style="padding-top: 40px; padding-left: 20px;">
		<div id="metroaqui_novo" class="metro-panel" style="float:left;width:68%"></div>
		<div id="metroaqui_novo1" style="float:right;width:28%;margin-right:10px"></div>
		<section>
		<div>
	   		 <!-- 快速查询提示框 -->
         <div id="fsmyModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>快速查找病人</h3>
            </div>
            <div class="modal-body">
            	<form name="fastSearchForm" action="search/patient_findPatient.action" method="get" target="_blank">
            		<label>病人ID：</label>
            		<input type="text" value="" name="patientId"/>
            		<input type="hidden" value="1" name="isFirstSerachFlag"/>
            	</form>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: submitSearch()" class="btn btn-primary">确定</a>
            </div>
         </div>
		</div>
	</section>
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
      <% Statistic statistic = Statistic.getInstance();%>
   </footer>
   
   <script type="text/javascript" src="scripts/jquery-1.7.2.min.js"></script>
   <script src="scripts/metro/jquery.metro-btn.js" type="text/javascript"></script>
   <script type="text/javascript">
		$(document).ready(function () {
			var $metroPanel = $("#metroaqui_novo");
			var $metroPanel1 = $("#metroaqui_novo1");
			$metroPanel.AddMetroDoubleButton('bt1', 'metro-azul', 'resources/imgs/Search.png', '病例检索', 'toggleClick("search");');
			$metroPanel.AddMetroSimpleButton('bt1', 'metro-roxo', 'resources/imgs/Manage.png', '代码管理', 'toggleClick("codeM");');
			$metroPanel.AddMetroSimpleButton('bt1', 'metro-laranja', 'resources/imgs/UserM.png', '用户管理', 'toggleClick("userM");');
			$metroPanel.AddMetroDoubleButton('bt1', 'metro-yellow', 'resources/imgs/Check.png', '病历管理', 'toggleClick("ecardM");');
			$metroPanel.AddMetroSimpleButton('bt1', 'metro-vermelho', 'resources/imgs/Chart.png', '报表统计', 'toggleClick("chartM");');
			$metroPanel1.AddMetroDoubleWithTrailerWithBG('bt1', 'resources/imgs/static.png', '', '', '');
			array = {'病人总数：':'<%=statistic.getPatientCount()%> 例','住院总次：': '<%=statistic.getVisitCount()%> 次','起止时间：':'2010年1月1日 --> 2013年1月1日','检查总项：':'<%=statistic.getExamCount()%> 条','检验总项：':'<%=statistic.getLabCount()%> 条'};
			$metroPanel1.AddMetroDoubleTextButton('bt1', 'metro-green', 'resources/imgs/Wait.png', array, 'toggleClick("");');
		});
   
   		function fNavStatusToggle(){
   			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
   		}
   		
   		function toggleClick(id){
   			id = jQuery.trim(id);
   			var obj = $("#" + id);
   			if(!!obj.attr("id")){
   				location.href = obj[0].href;  
   	         	return false;  
   			}else if(id == "check"){
   				alert("您当前没有权限访问此功能！");
   			}else{
   				alert("此功能还没开发！");
   			}
   		}
   </script>
</body>
</html>