<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="cn.ac.big.dp.bean.*" %>
<%@ taglib uri="/myTagLib" prefix="p"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>心内科临床信息管理系统-----用户管理</title>
		<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}' />
		<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
		<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
		<link rel="stylesheet" type="text/css" href="resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
		<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
		<style type="text/css">
select {
	width: 172px;
}
#autoTips{
	font-size:12px;
	width:150px;
	height:250px;
	background-color:white;
	overflow: scroll;
}
#formValidatorError p {
	line-height: 12pt;
	margin: 0 0 0 8px;
}
html,body,div,table, input{
		font-family:"微软雅黑"
}
	.nav{
	list-style-type: none;
	font-size:14px
}
.top_menu{
	margin: auto;
	text-align: center;
	margin-bottom:10px;
	margin-left:15px;
}
.top_menu a {
	color:#c09853;
}
#leftList,#rightList{
	float:left;
	height:180px;
	font-family: "微软雅黑";
}
.transferselect td{
	padding:0px
}
.myTable{
	font-size:14px;
	margin-top:10px;
	border-collapse: collapse;
	border:1px solid #999;
}
.myTable th {
	padding:5px 10px; 
	background-color: #eee;
	font-weight:bold;
	border-collapse: collapse;
	border:1px solid #999;
}
.myTable td {
	padding:5px 10px; 
	border-collapse: collapse;
	background-color:#fff;
	border:1px solid #999;
}
</style>
		<script type="text/javascript" src="scripts/html5.js"></script>
	</head>
	<body>
	<div style="height:30px;background-color:#666;position:fixed;top:0px;width:100%;z-index:100;">
		<div style="margin-left:20px;z-index:101;color:#fff;padding-top:7px;font-size:14px">
			当前位置&nbsp;:&nbsp;我的统计<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div>
		</div>
	</div>
	<section style="margin-top:20px;padding-top: 10px; padding-left: 20px;">
		<div class="detail" style="margin-right:20px;width: 290px; float: left;margin-top:20px">
				<div class="alert fade in">
					<a class="close" data-dismiss="alert" href="#">×</a>
					<div style="margin-top:20px">
           			<div class="top_menu">
           				<div style="background-color:#fbeedb;font-size:15px;font-weight:bold;padding:10px 22px;float:left;border-radius:10px 0px 0px 10px;border-right:1px solid #c09853"><a href="diag/diag_getDiagName.action">疾病统计</a></div>
           				<div style="background-color:#c09853;font-size:15px;font-weight:bold;padding:10px 22px;float:left;border-radius:0px 10px 10px 0px"><a href="diag/diag_getDiagNameM.action" style="color:white">我的统计</a></div>
           				<div style="clear:both"></div>
           			</div>
           			<div style="margin:10px 0px;margin-left:20px;width:200px;border-top:1px dashed #c09853"></div>
					<ul>
						<li class="nav"><a href="diag/diag_getDiagNameM.action#div1">病人选择</a></li>
						<li class="nav"><a href="diag/diag_getDiagNameM.action#div2">疾病选择</a></li>
						<li class="nav"><a href="diag/diag_getDiagNameM.action#div3">诊断</a></li>
						<li class="nav"><a href="diag/diag_getDiagNameM.action#div4">疾病分布</a></li>
					</ul>
           		</div>
				</div>
			</div>
			<div class="searchPanal" style="float: left; width: 75%;margin-bottom:300px" onclick="hideTips()">
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee;z-index:101">病人选择</label>
				<a name="div1"></a>
				<div class="searchbar" style="position: relative;">
					<label for="patientName">姓名：</label>
					<input type="hidden" id="patientIdH"/>
					<input autocomplete="off" type="text" value="${patientName }" id="patName" onkeyup="autoSelectName(this.value)" class="required" name="patientName" id="patientName" />
					<div id="autoTips" style="display:none;position: absolute;left:68px;top:49px;border:1px solid #000;z-index:100"></div>
				</div>
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee">疾病选择</label>
				<a name="div2"></a>
				<div class="searchbar" class="transferselect">
					<s:optiontransferselect list="%{diagNames}" label="疾病列表"   
						       	labelposition="top"   
						        name="leftList"   
						        addToLeftLabel="向左"   
						        addToRightLabel="向右"   
						        addAllToLeftLabel="反选"   
						        addAllToRightLabel="全选"   
						        doubleName="rightList"   
						        doubleList="{}"
					/>
					<div id="x_ray">
						横坐标参考<br/>
						<input type="radio" name="x" value="age" checked="checked"/>
						<label>病例数</label>
					</div>
					<div id="category">
						分类依据<br/>
						<input type="radio" name="category" value="sex" checked="checked"/>
						<label>性别</label>
						<input type="radio" name="category" value="treat_result"/>
						<label>治疗结果</label>
						<input type="radio" name="category" value="xy"/>
						<label>吸烟</label>
						<input type="radio" name="category" value="yj"/>
						<label>饮酒</label>
					</div>
           			<div>
						<a href="javascript: requestChart()" class="btn btn-primary">查询</a>
						<a href="javascript: reset()" class="btn">重置</a>
					</div>
           		</div>
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee">诊断</label>
				<a name="div3"></a>
				<div id="basicInfo" class="searchbar">
					<div id="diagChart"></div>
				</div>
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee">疾病分布</label>
				<a name="div4"></a>
				<div id="basicInfo" class="searchbar">
					<div id="x_rayP">
						<input type="radio" name="categorys" value="aregion" checked="checked"/>
						<label>年龄段</label>
						<input type="radio" name="categorys" value="diagnosis_date"/>
						<label>发病时间</label>
					</div>
					<div id="diagDistChart"></div>
				</div>
			</div>
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
		</section>
		<nav class="win-navigationlayout">
			<div class="container">
				<div class="nav-header">
					<a href="javascript: fNavStatusToggle()" class="win-command"> <span
						class="win-commandimage PNG-Right"></span> </a>
					<h2>
						功能导航
					</h2>
				</div>
				<div class="nav-container">
					<ul>
					<li class="win-label"><a href="pages/index/index.jsp">首页</a></li>
					<li class="win-label"><a href="pages/detailInfo/patient_add.jsp">病例管理</a></li>
					<li class="win-label"><a href="admin/userAction_getAllUsers.action?isFirstSerachFlag=1">用户信息管理</a></li>
					<li class="win-label"><a href="admin/codeAction_queryAllDictInfo.action?isFirstSerachFlag=1">代码信息管理</a></li>
					<li class="win-label"><a href="pages/search/search.jsp">病例检索</a></li>
					<li class="win-label"><a href="diag/diag_getDiagName.action">报表统计</a></li>
				</ul>
				</div>
			</div>
		</nav>
		<footer class="win-commandlayout">
			<div class="container">
				<sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SA">
					<!-- 给标签设置user属性绑定要展现的UserInfo对象  -->
					<a class="win-command" onclick="fastSearch()"> <span
						class="win-commandimage PNG-Search"></span> <span
						class="win-label">查询</span> </a>
				</sec:authorize>
				<a class="win-command" href="admin/userAction_getAllUser.action">
					<span class="win-commandimage PNG-Refresh"></span> <span
					class="win-label">刷新</span> </a>
				<a class="win-command" onclick="fNavStatusToggle()"> <span
					class="win-commandimage PNG-Navigation"></span> <span
					class="win-label">导航</span> </a>
				<a class="win-command" href="j_spring_security_logout"> <span
					class="win-commandimage PNG-Exit"></span> <span class="win-label">退出</span>
				</a>
			</div>
		</footer>
		<script type="text/javascript" src="scripts/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="scripts/modal.js"></script>
		<script type="text/javascript" src="scripts/commonUtil.js"></script>
		<script type="text/javascript" src="scripts/validator.js"></script>
		<script type="text/javascript" src="scripts/FusionCharts.debug.js"></script>
		<script type="text/javascript" src="scripts/FusionChartsExportComponent.js"></script>
		<script type="text/javascript">
		function requestChart() {
			var options = "";
			var category = "";
			var xRay = "";
			$("#rightList option").each(function(){
				options += "&diagNames="+$(this).val();
			});
			$("#x_ray input[type='radio']").each(function(){
				if($(this).attr("checked")){
					xRay = $(this).val();
				}
			});
			$("#category input[type='radio']").each(function(){
				if($(this).attr("checked")){
					category = $(this).val();
				}
			});
			getChartData(options+"&xRay="+xRay+"&category="+category+"&patientId="+$("#patientIdH").val());
		}
		function getChartData(params) {
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/chart_findMyChart.action?1=1'+params,
				type:'post',
				dataType:'json',
				success:processResult
			});
		}
		function processResult(data) {
			var myChart = new FusionCharts("Charts/StackedBar2D.swf", "myChartId", "692","600", "0", "1");
			myChart.setJSONData(data);
			myChart.render("diagChart");
		}
		function autoSelectName(key) {
	   		if(key!=""){
	   		var params = {keyWord:key,keyfill:"1"};
			$("#autoTips").css("display","");
			$("#autoTips").html("<img src='google/ajax-loader.gif'>&nbsp;正在获取提示...");
				$.ajax({
					url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_queryPatientName.action',
					type:'post',
					dataType:'json',
					data:params,
					success:function(result) {
						generateResultList(key,result.patList);
					}
				});
	   		}else {
	   			$("#autoTips").css("display","none");
	   		}
		}
		function generateResultList(key,patList) {
			$("#autoTips").html("");
			if(patList.length>0) {
				var formatStr = "";
				var elementText = key;
				var patName = "";
				var DIVStr = "";
				for(var x in patList) {
					patName = patList[x];
					formatStr = patName.replace(elementText,"<b><font color='blue'>"+elementText+"</font></b>");
					DIVStr += "<div style='cursor:pointer;line-height:20px'>"+ formatStr +"</div>";
				}
				$("#autoTips").html(DIVStr);
				$("#autoTips>div").each(function(index, element) {
			        $(this).click(function(e) {
			        	var str = $(this).text();
			        	var id = str.substring(str.indexOf("-")+1);
			           	$("#patName").val(str);
			           	$("#patientIdH").val(id);
			           	hideTips();
			           	$("#patName").focus();
			        });
			        $(this).mouseover(function(e) {
			            $(this).css("background-color","#DEEDFE");
			        });
			        $(this).mouseout(function(e){
			        	$(this).css("background-color","#ffffff");
			        });
			    });
			}
			else {
				$("#autoTips").html("没有符合条件的关键词!");
			}
		}
		function fNavStatusToggle() {
			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
		}
		function hideTips(){
			$("#autoTips").css("display","none");
		}
		function showAgeDistibution(subject, hasDiag) {
			var category = "";
			$("#x_rayP input[type='radio']").each(function(){
				if($(this).attr("checked")){
					category = $(this).val();
				}
			});
			getPyChartData("&category="+category+"&diagName="+subject+"&patientId="+$("#patientIdH").val()+"&hasDiag="+hasDiag);
		}
		function getPyChartData(params) {
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/chart_findDiagCountChart.action?1=1'+params,
				type:'post',
				dataType:'json',
				success:processPyResult
			});
		}
		function processPyResult(data) {
			var myChart = new FusionCharts("Charts/Pyramid.swf", "myChartId", "500","400", "0", "1");
			myChart.setJSONData(data);
			myChart.render("diagDistChart");
		}
		</script>
	</body>
</html>