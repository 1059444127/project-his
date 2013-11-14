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
		<base
			href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}' />
		<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
		<link rel="stylesheet" type="text/css"
			href="resources/css/commandIcon.css">
		<link rel="stylesheet" type="text/css" href="resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
		<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
		<style type="text/css">
select {
	width: 172px;
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
			当前位置&nbsp;:&nbsp;疾病统计<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div>
		</div>
	</div>
	<section style="margin-top:20px;padding-top: 10px; padding-left: 20px;">
		<div class="detail" style="margin-right:20px;width: 290px; float: left;margin-top:20px">
				<div class="alert fade in">
					<a class="close" data-dismiss="alert" href="#">×</a>
					<div style="margin-top:20px">
           			<div class="top_menu">
           				<div style="background-color:#c09853;font-size:15px;font-weight:bold;padding:10px 22px;float:left;border-radius:10px 0px 0px 10px;border-right:1px solid #c09853"><a href="diag/diag_getDiagName.action" style="color:white">疾病统计</a></div>
           				<div style="background-color:#fbeedb;font-size:15px;font-weight:bold;padding:10px 22px;float:left;border-radius:0px 10px 10px 0px"><a href="diag/diag_getDiagNameM.action">我的统计</a></div>
           				<div style="clear:both"></div>
           			</div>
           			<div style="margin:10px 0px;margin-left:20px;width:200px;border-top:1px dashed #c09853"></div>
					<ul>
						<li class="nav"><a href="diag/diag_getDiagName.action#div1">疾病选择</a></li>
						<li class="nav"><a href="diag/diag_getDiagName.action#div2">诊断信息</a></li>
						<li class="nav"><a href="diag/diag_getDiagName.action#div3">详细信息</a></li>
						<li class="nav"><a href="diag/diag_getDiagName.action#div4">病例信息</a></li>
					</ul>
           		</div>
				</div>
			</div>
			<div class="searchPanal" style="float: left; width: 75%;margin-bottom:300px" >
				<A id="div1" name="div1">&nbsp;</A>
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee">疾病选择</label>
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
           			<div>
						<a href="javascript: requestChart()" class="btn btn-primary">查询</a>
						<a href="javascript: reset()" class="btn">重置</a>
					</div>
           			</div>
           		<A id="div2" name="div2">&nbsp;</A>
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee">诊断</label>
				<div id="basicInfo" class="searchbar">
					<div id="diagChart"></div>
					<div id="diagFcexpDiv"></div>
					<div id="diagTable" style="overflow: scroll;"></div>
				</div>
				<A id="div3" name="div3">&nbsp;</A>
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee">详细</label>
				<div id="basicInfo" class="searchbar">
					<div id="detailChart"></div>
					<div id="detailFcexpDiv"></div>
					<div id="subDiagTable" style="overflow: scroll;"></div>
				</div>
				<A id="div4" name="div4">&nbsp;</A>
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee">病例列表</label>
				<div class="searchbar">
					<div id="patientDiv"></div>
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
		//用于设置导航栏的显示状态
		function showPatientTable(dName, dValue) {
			$("#patientDiv").html("");
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/chart_findDiagItemPager.action',
				type:'post',
				dataType:'json',
				data:{'diagItem.diagnosis_desc':dName,'diagItem.diagnosis_value':dValue},
				success:processPatientResult
			});
		}
		function showPatientTablePage(linkHref,pageNo,rowCount,pageSize) {
			$.ajax({
				url:linkHref +"&pageNo="+ pageNo + "&rowCount="+ rowCount+ "&pageSize="+ pageSize,
				type:'post',
				dataType:'json',
				success:processPatientResult
			});
		}
		function processPatientResult(data) {
			$("#next").remove();
			var dList = data.diagItemList;
			var thead = "<thead><tr><th>序号</th><th>ID</th><th>姓名</th><th>病次</th><th>诊断结果</th><th>参考值</th><th>治疗时间</th><th>治疗结果</th><th>诊断时间</th></tr></thead>";
			var tbody = "<tbody>";
			for(var x in dList) {
				var result = !dList[x].treat_result?"":dList[x].treat_result;
				var tr = "<tr><td>"+(x*1+1)+"</td><td>"+dList[x].patient_id+"</td><td>"+dList[x].name+"</td><td>"+dList[x].visit_id+"</td><td>"+dList[x].diagnosis_desc+"</td><td>"+dList[x].diagnosis_value+"</td><td>"+dList[x].treat_days+"天</td><td>"+result+"</td><td>"+dList[x].diagnosis_date+"</td></tr>";
				tbody += tr;
			}
			tbody +="</tbody>";
			var table = "<table class='myTable'>"+thead+tbody+"</table>";
			$("#patientDiv").append(table);
			var hasNextPage = data.page.isHasNextPage;
			if(hasNextPage=="1") {
				$("#patientDiv").append("<a id=\"next\" href=\"javascript:showPatientTablePage('"+data.page.linkHref+"','"+data.page.nextPageNo+"','"+data.page.rowCount+"','"+data.page.pageSize+"')\">更多</a>");
			}
		}
		function fNavStatusToggle() {
			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
		}
		function requestChart() {
			var options = "";
			$("#rightList option").each(function(){
				options += "&diagNames="+$(this).val();
			});
			getChartData(options);
		}
		function getChartData(params) {
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/chart_findDiagChart.action?1=1'+params,
				type:'post',
				dataType:'json',
				success:processResult
			});
		}
		function processResult(data) {
			var myChart = new FusionCharts("Charts/Column2D.swf", "myChartId", "692","300", "0", "1");
			myChart.setJSONData(data);
			$("#detailChart").html("");
			$("#diagTable").html("");
			$("#subDiagTable").html("");
			$("#detailFcexpDiv").html("");
			$("#patientDiv").html("");
			myChart.render("diagChart");
			createDiagTable(data.data, "diagTable");
			extractDownloadButton("diagFcexpDiv","2");
		}
		function createDiagTable(data,target) {
			var thead = "<thead><tr>";
			var tbody = "<tbody><tr>";
			for(var x in data) {
				var label = data[x].label;
				var value = data[x].value;
				thead += "<th>"+label+"</th>";
				tbody += "<td>"+value+"</td>";
			}
			thead += "</tr></thead>";
			tbody += "</tr></tbody>";
			var table = "<table class='myTable'>"+thead+tbody+"</table>";
			$("#"+target).append(table);
		}
		function showDetail(key) {
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/chart_findDetailDiagChart.action',
				type:'post',
				data:{'diagName':key},
				dataType:'json',
				success:processResult1
			});
		}
		function processResult1(data) {
			$("#subDiagTable").html("");
			var myChart = new FusionCharts("Charts/Pie3D.swf", "myChartId", "600","200", "0", "1");
			myChart.setJSONData(data);
			myChart.render("detailChart");
			createDiagTable(data.data, "subDiagTable");
			$("#patientDiv").html("");
			extractDownloadButton("detailFcexpDiv","1");
		}
		function extractDownloadButton(target,number) {
			var myExportComponent = new FusionChartsExportObject("fcExporter"+number, "FCExporter.swf");       
			myExportComponent.componentAttributes.btnFontSize = '12';       
			myExportComponent.componentAttributes.btndisabledtitle = '等待导出';        
			myExportComponent.componentAttributes.btnsavetitle = '下载';       
			myExportComponent.Render(target);
		}
		</script>
	</body>
</html>