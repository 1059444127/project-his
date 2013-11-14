<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="cn.ac.big.dp.bean.*" %>
<%@ taglib uri="/myTagLib" prefix="p"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科临床信息管理系统---病历添加</title>
<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}'/>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
<style type="text/css">
.user_info{
	margin:18px;
	text-align:left;
}
.user_info th{
	font-weight:bold;
	height:25px;
}
.tab_select{
	border-bottom:3px solid #24A0DA;
	font-weight:bold;
}
html,body,div,table,td,th,input,tr,span,p,ul,li,a,select{
	font-family:"微软雅黑"
}
</style>
<script type="text/javascript" src="scripts/html5.js"></script>
</head>
<body>
	<div style="height:30px;background-color:#666;position:fixed;top:0px;width:100%;z-index:100;">
		<div style="margin-left:20px;z-index:101;color:#fff;padding-top:7px;font-size:14px">
			当前位置&nbsp;:&nbsp;精确检索<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div>
		</div>
	</div>
	<section style="margin-top:20px;padding-top: 10px; padding-left: 20px;">
		<div class="detail" style="width: 290px; float: left;margin-top:20px;font-size:13px">
			<div class="alert fade in">
           		<a class="close" data-dismiss="alert" href="#">×</a>
           		<strong>病人基本信息</strong>
           		<table style="width:100%;" class="user_info">
				<tbody>
					<tr>
						<th width="100px">姓名:</th>
						<td><s:property value="patient.patientName"/></td>
					</tr>
					<tr>
						<th>病人ID:</th>
						<td><s:property value="patient.patientId"/></td>
					</tr>
					<tr>
						<th>性别:</th>
						<td><s:property value="patient.sex"/></td>
					</tr>
					<tr>
						<th>出生日期:</th>
						<td><s:date name="patient.birthday" format="yyyy年MM月dd日"/></td>
					</tr>
					<tr>
						<th>出生地:</th>
						<td><s:property value="patient.birthPlace"/></td>
					</tr>
					<tr>
						<th>婚姻状况:</th>
						<td><s:property value="patient.maritalStatus"/></td>
					</tr>
					<tr>
						<th>国籍:</th>
						<td><s:property value="patient.citizenship"/></td>
					</tr>
					<tr>
						<th>民族:</th>
						<td><s:property value="patient.nation"/></td>
					</tr>
					<tr>
						<th>费别:</th>
						<td><s:property value="patient.chargeType"/></td>
					</tr>
					<tr>
						<th>病人类型:</th>
						<td><s:property value="patient.identity"/></td>
					</tr>
					<tr>
						<th>通信地址:</th>
						<td><s:property value="patient.mailAddress"/></td>
					</tr>
					<tr>
						<th>办公电话:</th>
						<td><s:property value="patient.phoneNumberBussness"/></td>
					</tr>
					<tr>
						<th>联系人:</th>
						<td><s:property value="patient.nextOfKin"/></td>
					</tr>
					<tr>	
						<th>联系人电话:</th>
						<td><s:property value="patient.nextOfKinPhone"/></td>
					</tr>
					<tr>
						<th>上次就诊:</th>
						<td><s:property value="patient.lastVisitDate"/></td>
					</tr>
					<tr>
						<th>建卡日期:</th>
						<td><s:property value="patient.createDate"/></td>
					</tr>
					<tr>
						<th>操作员:</th>
						<td><s:property value="patient.operatorName"/></td>
					</tr>
				</tbody>
			</table>
         	 </div>
		</div>
		<div class="searchPanal" style="float:left;width:78%;">
			<div style="margin-top:20px;margin-left:20px">临床信息</div>
			<table class="table table-bordered" id="visitTable">
			<thead>
				<tr>
					<th align="center">序号</th>
					<th align="center">入院次</th>
					<th align="center">入院科室</th>
					<th align="center">出院科室</th>
					<th align="center">入院目的</th>
					<th align="center">入院时间</th>
					<th align="center">出院时间</th>
					<th align="center">主治医师</th>
					<th align="center">诊疗记录</th>
					<th align="center">检测结果</th>
					<th align="center">诊断结果</th>
					<th align="center">出院带药</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="patient.visitList" id="visit" status="index">
					<s:if test="#visit.id!=null">
						<tr id="<s:property value="#visit.id" />">
						<td><s:property value="#index.index + 1" /></td>
						<td><s:property value="#visit.visitId" /></td>
						<td><s:property value="#visit.deptDischargeFrom"/></td>
						<td><s:property value="#visit.admissionTo"/></td>
						<td><s:property value="#visit.admissionCause" /></td>
						<td><s:date name="#visit.admissionDateTime" format="yyyy-MM-dd"/></td>
						<td><s:date name="#visit.dischargeDateTime" format="yyyy-MM-dd"/></td>
						<td><s:property value="#visit.attendingDoctor" /></td>
						<td>
							<a href="javascript:showReportInfo('<s:property value='patient.patientId'/>','<s:property value='#visit.visitId'/>','<s:property value='patient.patientName'/>')">详情</a>
						</td>
						<td>
							<a href="javascript:showItemInfo('<s:property value='patient.patientId'/>','<s:property value='#visit.visitId'/>','<s:property value='patient.patientName'/>',0)">检验</a>
							<a href="javascript:showItemInfoE('<s:property value='patient.patientId'/>','<s:property value='#visit.visitId'/>','<s:property value='patient.patientName'/>',1)">检查</a>
						</td>
						<td>
							<a href="javascript:showDiagnoseInfo('<s:property value='patient.patientId'/>','<s:property value='#visit.visitId'/>','<s:property value='patient.patientName'/>')">诊断</a>
						</td>
						<td>
							<a href="javascript:showDrugnoseInfo('<s:property value='patient.patientId'/>','<s:property value='#visit.visitId'/>','<s:property value='patient.patientName'/>')">带药</a>
						</td>
					</tr>
					</s:if>
				</s:iterator>
			</tbody>
		</table>
		<div style="margin-bottom:100px;margin-top:-100px">
		<div style="margin-top:20px;margin-left:20px;margin-bottom:20px">生物信息
		</div>
		<div style="margin-left:20px">
			<img src="resources/imgs/chrom.png" usemap="#Map"/>
			<map name="Map" id="Map">
				<area shape="rect" coords="11,10,26,242" href="javascript:showBioInfo('chr1')"/>
				<area shape="rect" coords="39,41,52,250" href="javascript:showBioInfo('chr2')" />
				<area shape="rect" coords="67,44,80,221" href="javascript:showBioInfo('chr3')" />
				<area shape="rect" coords="96,83,108,229" href="javascript:showBioInfo('chr4')" />
				<area shape="rect" coords="124,87,137,232" href="javascript:showBioInfo('chr5')" />
				<area shape="rect" coords="153,68,163,234" href="javascript:showBioInfo('chr6')" />
				<area shape="rect" coords="178,70,191,217" href="javascript:showBioInfo('chr7')" />
				<area shape="rect" coords="208,84,221,210" href="javascript:showBioInfo('chr8')" />
				<area shape="rect" coords="235,82,247,207" href="javascript:showBioInfo('chr9')" />
				<area shape="rect" coords="265,86,278,206" href="javascript:showBioInfo('chr10')" />
				<area shape="rect" coords="290,74,304,205" href="javascript:showBioInfo('chr11')" />
				<area shape="rect" coords="319,92,332,208" href="javascript:showBioInfo('chr12')" />
				<area shape="rect" coords="347,105,362,207" href="javascript:showBioInfo('chr13')" />
				<area shape="rect" coords="376,100,388,197" href="javascript:showBioInfo('chr14')" />
				<area shape="rect" coords="402,101,412,196" href="javascript:showBioInfo('chr15')" />
				<area shape="rect" coords="430,86,444,178" href="javascript:showBioInfo('chr16')" />
				<area shape="rect" coords="459,93,472,178" href="javascript:showBioInfo('chr17')" />
				<area shape="rect" coords="485,102,501,175" href="javascript:showBioInfo('chr18')" />
				<area shape="rect" coords="513,93,524,157" href="javascript:showBioInfo('chr19')" />
				<area shape="rect" coords="540,97,554,163" href="javascript:showBioInfo('chr20')" />
				<area shape="rect" coords="571,104,584,155" href="javascript:showBioInfo('chr21')" />
				<area shape="rect" coords="599,104,613,164" href="javascript:showBioInfo('chr22')" />
				<area shape="rect" coords="626,66,640,215" href="javascript:showBioInfo('chrx')" />
				<area shape="rect" coords="655,110,667,148" href="javascript:showBioInfo('chry')" />
			</map>		
		</div>
		</div>
		</div>
			
		 <!-- 快速查询提示框 -->
         <div id="dmyModal" class="modal hide fade" style="display: none;">
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
         
         <!-- 生物信息列表 -->
         <div id="bioModal" class="modal hide fade" style="display: none;width:90%;left:25%;top:300px;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <div style="float:left;padding:5px;" class="tab_select" id="chromt"><a href="javascript:changeTab(3)" style="color:#666">染色体</a></div>
             	<div style="float:left;padding:5px;" id="chromc"><a href="javascript:changeTab(4)" style="color:#666">图表统计</a></div>
             	<div style="clear:both"></div>
            </div>
            <div id="biochart" style="overflow: scroll; height:450px;font-size:12px;padding:0px 10px;display: none">
            </div>
            <div id="biobody" style="overflow: scroll; height:450px;font-size:12px;padding:0px 10px;display:block">
            	<table class="biotable">
            		<thead>
            			<tr>
            				<th>Chromosome ID</th>
            				<th>Coordinate on chromosome</th>
            				<th>Reference genotype</th>
            				<th>Consensus genotype</th>
            				<th>Quality core of consensus genotype</th>
            				<th>Best base</th>
            				<th>Average quality score of best base</th>
            				<th>Count of uniquely mapped best base</th>
            				<th>Count of all mapped best base</th>
            				<th>Second of best bases</th>
            				<th>Average quality score of second best base</th>
            				<th>Count of uniquely mapped second best base</th>
            				<th>Count of all mapped second best base</th>
            				<th>Sequencing depth of site</th>
            				<th>Rank sum test p_value</th>
            				<th>Average copy number of nearby region</th>
            				<th>Whether th site is a dbSNP</th>
            			</tr>
            		</thead>
            		<tbody></tbody>
            	</table>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: submitSearch()" class="btn btn-primary">确定</a>
            </div>
         </div>
         
         <!-- 检验操作 -->
         <div id="ItemInfo" class="modal hide fade" style="display: none;width:70%;left:35%;top:300px">
         	<div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h2>检验详情</h2>
            </div>
            <div class="modal-body" style="height:500px;overflow: hidden;">
            	<div class="nav-container" style="width:26%;float:left;height:415px;overflow: scroll;overflow-x:hidden ">
            		<ul id="left-navi">
            		</ul>
            	</div>
            	<div style="width:74%;height:415px;float:left;overflow: scroll;overflow-x:hidden">
            		<table id="ItemInfoTable" class="table table-bordered" style="padding-bottom: 0;height:auto;padding:0px;">
					<thead>
						<tr>
							<th style="font-size:15px">序号</th>
							<th style="font-size:15px">名称</th>
							<th style="font-size:15px">结果</th>
							<th style="font-size:15px">说明</th>
							<th style="font-size:15px">低</th>
							<th style="font-size:15px">高</th>
							<th style="font-size:15px">时间</th>
							<th style="font-size:15px">趋势</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
            	</div>
            </div>
            <div class="modal-footer">
            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	            	<a class="btn" href="javascript:exportToExcel(1)">导出</a>
              	</sec:authorize>
             	<a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
         </div>
         
          <!-- 检查操作 -->
         <div id="ItemInfoE" class="modal hide fade" style="display: none;width:70%;left:35%;top:300px">
         	<div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h2>检查详情</h2>
            </div>
            <div class="modal-body" style="height:500px;overflow: hidden;">
            	<div class="nav-container" style="width:26%;float:left;height:415px;overflow: scroll;overflow-x:hidden ">
            		<ul id="left-naviE">
            		</ul>
            	</div>
            	<div style="width:74%;height:415px;float:left;overflow: scroll;overflow-x:hidden">
            		<table id="ItemInfoETable" class="table table-bordered" style="padding-bottom: 0;height:auto;padding:0px;">
					<tbody></tbody>
				</table>
            	</div>
            </div>
            <div class="modal-footer">
            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	            	<a class="btn" href="javascript:exportToExcel(2)">导出</a>
              	</sec:authorize>
             	<a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
         </div>
         
          <!-- 趋势 -->
         <div id="ChartInfo" class="modal hide fade" style="display: none;width:53%;left:42%;top:340px">
         	<div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>趋势</h3>
            </div>
            <div class="modal-body">
            	<div id="chartDisplayDiv">
            	</div>
            	 <form action="export/export_exportToExcel.action" method="post" name="exportChart" target="_blank">
            	 	<input type="hidden" name="patientId" value="<s:property value='patient.patientId'/>"/>
            	 	<input type="hidden" name="visitId" value="<s:property value='#visit.visitId'/>"/>
            	 	<input type="hidden" name="itemName" value="" id="chartItemName"/>
            	 	<input type="hidden" name="exportType" value="3"/>
            	 </form>
            	 <form action="export/export_exportToExcel.action" method="post" name="exportReport" target="_blank">
            	 	<input type="hidden" name="patientId" value="<s:property value='patient.patientId'/>"/>
            	 	<input type="hidden" name="visitId" value="<s:property value='#visit.visitId'/>"/>
            	 	<input type="hidden" name="exportType" value="4"/>
            	 </form>
            </div>
            <div class="modal-footer">
            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	            	<a class="btn" href="javascript:fValidate(document.exportChart)">导出</a>
              	</sec:authorize>
             	<a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
         </div>
         
         <!-- 诊断结果列表-->
         <div id="DiagResultInfo" class="modal hide fade" style="display: none;width:60%;left:42%;top:300px">
         	<div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
             	<div style="float:left;padding:5px;" class="tab_select">诊断结果</div>
             	<div style="clear:both"></div>
            </div>
            <div class="modal-body">
            	<div style="width:100%">
					<table id="diagResultTable" class="table table-bordered" style="width:100%;padding-bottom: 0;padding:0px;">
						<tbody></tbody>
					</table>        	
            	</div>
            </div>
            <div class="modal-footer">
            	<sec:authorize ifAnyGranted="ROLE_USER">
	            	<a class="btn" href="#">导出</a>
              	</sec:authorize>
             	<a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
         </div>
         
         <!-- 出院带药列表-->
         <div id="DrugResultInfo" class="modal hide fade" style="display: none;width:60%;left:42%;top:300px">
         	<div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
             	<div style="float:left;padding:5px;" class="tab_select">带药详情</div>
             	<div style="clear:both"></div>
            </div>
            <div class="modal-body">
            	<div style="width:100%">
					<table id="drugResultTable" class="table table-bordered" style="width:100%;padding-bottom: 0;padding:0px;">
						<tbody></tbody>
					</table>        	
            	</div>
            </div>
            <div class="modal-footer">
            	<sec:authorize ifAnyGranted="ROLE_USER">
	            	<a class="btn" href="#">导出</a>
              	</sec:authorize>
             	<a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
         </div>
         
         
         <!-- report列表-->
         <div id="ReportInfo" class="modal hide fade" style="display: none;width:53%;left:42%;top:300px">
         	<div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
             	<div style="float:left;padding:5px;" class="tab_select" id="rep"><a href="javascript:changeTab(1)" style="color:#666">住院摘要</a></div>
             	<div style="float:left;padding:5px;" id="dia"><a href="javascript:changeTab(2)" style="color:#666">诊疗记录</a></div>
             	<div style="clear:both"></div>
            </div>
            <div class="modal-body">
            	<div style="width:100%">
					<table id="diagInfoTable" class="table table-bordered" style="width:100%;padding-bottom: 0;padding:0px;">
						<tbody></tbody>
					</table>        	
            	</div>
            	<div style="width:100%">
            		<table id="reportInfoTable" class="table table-bordered" style="width:100%;padding-bottom: 0;padding:0px;display:none">
				</table>
            	</div>
            </div>
            <div class="modal-footer">
            	<sec:authorize ifAnyGranted="ROLE_USER">
	            	<a class="btn" href="javascript:fValidateR(document.exportReport)">导出</a>
              	</sec:authorize>
             	<a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
         </div>
         
          <!-- 选择subjec导出列表-->
         <div id="SubjectInfo" class="modal hide fade" style="display: none;width:53%;left:42%;top:340px">
         	<div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>项目选择</h3>
            </div>
            <div class="modal-body" style="font-size:15px;text-align:">
            <form action="export/export_exportToExcel.action" method="post" name="exportForm" target="_blank">
            	<div id="subjectSelect">
            	</div>
            	<input type="hidden" name="exportType" id="exportType">
            </form>
            </div>
            <div class="modal-footer">
              <a href="javascript:selectAll()" class="btn">全选</a>
              <a href="javascript:deSelectAll()" class="btn">全不选</a>
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: fValidate(document.exportForm)" class="btn btn-primary">导出</a>
            </div>
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
      	 <p:pager page="${page}" />
      	 <a class="win-command" onclick="fastSearch()">
            <span class="win-commandimage PNG-Search"></span>
            <span class="win-label" >查询</span>
         </a>
         <a class="win-command" href="actions/codeAction_query">
            <span class="win-commandimage PNG-Refresh"></span>
            <span class="win-label">刷新</span>
         </a>
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
   <script type="text/javascript" src="scripts/modal.js"></script>
   <script type="text/javascript" src="scripts/commonUtil.js"></script>
   <script type="text/javascript" src="scripts/validator.js"></script>
   <script type="text/javascript" src="scripts/FusionCharts.debug.js"></script>
   <script type="text/javascript">
   var keyTr = {
			ctrlDown : false,
			obj : {}
		}; //用于判断是否按下ctrl键，以及存储以选择行对象
		$(document).ready(function(){
			$(".table>tbody").mouseover(function(event){
				fTrBgColor(event, "mouseover");
			}).mouseout(function(event){
				fTrBgColor(event, "mouseout");
			}).click(function(event) {
				fTrBgColor(event, "click", keyTr);
			});;
		});
		
		//用于设置导航栏的显示状态
   		function fNavStatusToggle(){
   			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
   		}
  
		//用于改变行的背景色
		function fTrBgColor(event, type, keyTr){
			var temp = event.target;
			var obj = $(temp).parent(), isSelect = obj.attr("isselect");
			if(temp.nodeName.toUpperCase() == "A")
				obj = obj.parent();
			if(isSelect){
				if("click" == type){
					obj.removeClass("tr-click");
					obj.removeClass("tr-hover");
					obj.removeAttr("isselect");
					delete keyTr.obj["id-"+obj.attr("id")];
				}
			}else{
				if("click" == type){
					obj.addClass("tr-click");
					obj.attr("isselect",true);
					if(!!!keyTr.ctrlDown){
						var o = keyTr.obj;
						for(var p in o){
							var tr = o[p];
							tr.removeClass("tr-click");
							tr.removeClass("tr-hover");
							tr.removeAttr("isselect");
							delete o[p];
						}
					}
					keyTr.obj["id-"+obj.attr("id")] = obj;
				}else if("mouseover" == type)
					obj.addClass("tr-hover");
				else if("mouseout" == type)
					obj.removeClass("tr-hover");
			}
			event.stopPropagation();
		}
		var gvisitId = 0;
		var gpatientName = "";
		function showDiagnoseInfo(patientId, visitId, patientName) {
			gpatientName = patientName;
			var params = {patientId:patientId, visitId:visitId};
			action = "item_findDiagnose.action";
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/'+action,
				type:'post',
				dataType:'json',
				data:params,
				success:displayDiagResult
			});
		}
		function displayDiagResult(data) {
			var diagResult = data.diagResult;
			$("#DiagResultInfo").modal("show");
			var table = $("#diagResultTable>tbody");
			table.html("");
			if(diagResult==null || diagResult.length==0){
				table.html("没有诊断结果");
			} else {
				var patientid = diagResult.patientid;
				var visitid = diagResult.visitid;
				var treatdays = diagResult.treat_days;
				var dResult = diagResult.diagResult;
				table.append("<tr><td colspan='8' style='font-size:15px;height:15px;line-height:15px;padding:4px;text-align:center;font-weight:bold;background-color:#DEEDFE'>基础信息</td></tr>");
				table.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病人姓名</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
						gpatientName +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病人ID</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
						patientid +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病次</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
						visitid +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>治疗时间</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
						treatdays +"天</td></tr>");
				table.append("<tr><td colspan='8' style='font-size:15px;height:15px;line-height:15px;padding:4px;text-align:center;font-weight:bold;background-color:#DEEDFE'>诊断结果</td></tr>");
				table.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>类型</td><td colspan='3' style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>描述</td> <td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold' colspan='3'>治愈时间</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>代码</td></tr>");
				for(var index in dResult){
					var id = dResult[index].id;
					var type = dResult[index].diagnosis_type;
					var desc = dResult[index].diagnosis_desc;
					var date = dResult[index].diagnosis_date;
					var code = dResult[index].code_version;
					table.append("<tr>"+ 
							id +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
							type +"</td><td colspan='3' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
							desc +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;' colspan='3'>"+ 
							date +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
							code +"</td></tr>");
				}
			}
		}
		function showDrugnoseInfo(patientId, visitId, patientName) {
			gpatientName = patientName;
			var params = {patientId:patientId, visitId:visitId};
			action = "item_findDrug.action";
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/'+action,
				type:'post',
				dataType:'json',
				data:params,
				success:displayDrugResult
			});
		}
		function displayDrugResult(data) {
			var drugResult = data.drugList;
			$("#DrugResultInfo").modal("show");
			var table = $("#drugResultTable>tbody");
			table.html("");
			if(drugResult==null || drugResult.length==0){
				table.html("没有带药信息");
			} else {
				var patientid = drugResult[0].patientid;
				var visitid = drugResult[0].visitid;
				table.append("<tr><td colspan='10' style='font-size:15px;height:15px;line-height:15px;padding:4px;text-align:center;font-weight:bold;background-color:#DEEDFE'>基础信息</td></tr>");
				table.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病人姓名</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
						gpatientName +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病人ID</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
						patientid +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病次</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
						visitid +"</td></tr>");
				table.append("<tr><td colspan='10' style='font-size:15px;height:15px;line-height:15px;padding:4px;text-align:center;font-weight:bold;background-color:#DEEDFE'>带药详细</td></tr>");
				table.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:250px;font-weight:bold'>药品名</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>单位</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>净含量</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>频率</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>计量</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>服用</td></tr>");
				for(var index in drugResult){
					var name = drugResult[index].DRUG_NAME;
					var total = drugResult[index].PACKAGE_SPEC;
					var unit = drugResult[index].PACKAGE_UNITS;
					var frequency = drugResult[index].FREQUENCY;
					var count = drugResult[index].DOSAGE;
					var use = drugResult[index].ADMINISTRATION;
					table.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>" +
							name +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
							total +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
							unit +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;''>"+ 
							frequency +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
							count +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
							use +"</td></tr>");
				}
			}
		}
		function showItemInfo(patientId, visitId, patientName){
			gvisitId = visitId;
			var params = {patientId:patientId, visitId:visitId};
			action = "item_findLabItem.action";
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/'+action,
				type:'post',
				dataType:'json',
				data:params,
				success:processResult
			});
		}
	   	function processResult(data){
	   		var leftNavi = $("#left-navi");
	   		var itemInfo = $("#ItemInfoTable>tbody");
	   		var subjectSelect = $("#subjectSelect");
	   		subjectSelect.html("");
			itemInfo.html("");
	   		leftNavi.html("");
	   		var itemList = data.itemList;
		   
		   	if(itemList==null || itemList.length==0){
			   	leftNavi.append("没有检验项");
		   	}
		   	else{
		   		var c = 0;
		   		for(var i in itemList){
			   		var timeNavi = "<div style='padding:3px;color: #999999;font-weight:bold;border-left:3px solid #24A0DA'>" + itemList[i].execDate + "</div>";
			   		leftNavi.append(timeNavi);
			   		var subject = "<div><label style='padding-left:5px;font-size:15px;font-weight:bold;border-left:3px solid #24A0DA'><input type='checkbox' style='width:15px;height:15px' onclick='selectGroup(this)'/>"+ itemList[i].execDate +":</label><div id='subcheckbox'>";
			   		var itemNameList = itemList[i].itemList;
			   		if(itemNameList == null || itemNameList.length!=0){
			   			for(var j in itemNameList){
			   				var nameNavi = "<li class='win-label'><a style='color:#004D60;font-size:14px' href=\"javascript:showItemValue("+ (c++) +",'" + itemNameList[j].testNo + "')\">" + itemNameList[j].subject + "</a></li>";
			   				leftNavi.append(nameNavi);
			   				var nameSubj = "&nbsp;&nbsp;&nbsp;<input onclick='checkParent(this)' style='width:15px;height:15px' type='checkbox' name='testNos' value='"+ itemNameList[j].testNo +"'/>"+ itemNameList[j].subject;
			   				subject += nameSubj;
			   			}
			   		}
			   		subjectSelect.append(subject+"</div></div>");
			   	}
		   	}
			$("#ItemInfo").modal("show");
	   	}
	   	function showItemValue(i,id){
	   		$("#left-navi li>a").each(function(){
	   			$(this).css("font-weight","normal");
	   		});
	   		$("#left-navi li>a:eq(" + i + ")").css("font-weight","800");
	   		var action = null;
	   		var params = null;
	   		params = {testNo:id};
	   		action = "item_findSubLabItem.action";
	   		
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/'+action,
				type:'post',
				dataType:'json',
				data:params,
				success:processResult1
			});
	   	}
		function processResult1(data){
			var subItemList = data.subItemList;
			var itemInfo = $("#ItemInfoTable>tbody");
			itemInfo.html("");
			var tr = "<tr>";
			
			if(subItemList==null||subItemList.length==0){
				itemInfo.append("<tr><td style='font-size:15px'>没有结果</td></tr>");
			}
			else{
				for(var i in subItemList){
					var reportItemName = subItemList[i].reportItemName;
					var result = subItemList[i].result;
					var units = subItemList[i].units;
					var resultDateTime = subItemList[i].resultDateTime;
					var low = subItemList[i].low?subItemList[i].low:"";
					var high = subItemList[i].high?subItemList[i].high:"";
					var index = Number(i)+1;
					var unit = units?units:"";
					tr += "<td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + index + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + reportItemName + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + result + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + unit + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + low + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + high + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + resultDateTime + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'><a href=\"javascript:showChart('${patientId}','"+ gvisitId +"','"+ reportItemName +"')\">查看</a></td></tr>";
				}
				itemInfo.append(tr);
			}
			
		}
		function showItemInfoE(patientId, visitId, patientName){
			gvisitId = visitId;
			var params = {patientId:patientId, visitId:visitId};
			action = "item_findExamItem.action";
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/'+action,
				type:'post',
				dataType:'json',
				data:params,
				success:processResultE
			});
		}
	   	function processResultE(data){
	   		var leftNavi = $("#left-naviE");
	   		var itemInfo = $("#ItemInfoETable>tbody");
	   		var subjectSelect = $("#subjectSelect");
	   		subjectSelect.html("");
			itemInfo.html("");
	   		leftNavi.html("");
	   		var itemList = data.itemList;
		   
		   	if(itemList==null || itemList.length==0){
	   			leftNavi.append("没有检查项");
		   	}
		   	else{
		   		var c = 0;
		   		for(var i in itemList){
			   		var timeNavi = "<div style='padding:3px;color: #999999;font-weight:bold;border-left:3px solid #24A0DA'>" + itemList[i].execDate + "</div>";
			   		leftNavi.append(timeNavi);
			   		var subject = "<div><label style='padding-left:5px;font-size:15px;font-weight:bold;border-left:3px solid #24A0DA'><input type='checkbox' style='width:15px;height:15px' onclick='selectGroup(this)'/>"+ itemList[i].execDate +":</label><div id='subcheckbox'>";
			   		var itemNameList = itemList[i].itemList;
			   		if(itemNameList == null || itemNameList.length!=0){
			   			for(var j in itemNameList){
			   				var nameNavi = "<li class='win-label'><a style='color:#004D60;font-size:14px' href=\"javascript:showItemValueE("+ (c++) +",'" + itemNameList[j].testNo + "')\">" + itemNameList[j].subject;
			   				if(itemNameList[j].examSubClass){
			   					nameNavi += "(" + itemNameList[j].examSubClass + ")</a></li>";
			   				}
			   				leftNavi.append(nameNavi);
			   				var nameSubj = "&nbsp;&nbsp;&nbsp;<input onclick='checkParent(this)' style='width:15px;height:15px' type='checkbox' name='testNos' value='"+ itemNameList[j].testNo +"'/>"+ itemNameList[j].subject;
			   				subject += nameSubj;
			   			}
			   		}
			   		subjectSelect.append(subject+"</div></div>");
			   	}
		   	}
			$("#ItemInfoE").modal("show");
	   	}
	   	function showItemValueE(i,id){
	   		$("#left-naviE li>a").each(function(){
	   			$(this).css("font-weight","normal");
	   		});
	   		$("#left-naviE li>a:eq(" + i + ")").css("font-weight","800");
	   		var action = null;
	   		var params = null;
	   		action = "item_findSubExamItem.action";
	   		params = {examNo:id};
	   		
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/'+action,
				type:'post',
				dataType:'json',
				data:params,
				success:processResult1E
			});
	   	}
		function processResult1E(data){
			var subItemList = data.subItemList;
			var itemInfo = $("#ItemInfoETable>tbody");
			itemInfo.html("");
			
			if(subItemList==null||subItemList.length==0){
				itemInfo.append("<tr><td style='font-size:15px'>没有结果</td></tr>");
			}
			else{
				for(var i in subItemList){
					var examItem = subItemList[i].examItem;
					var description = subItemList[i].description;
					var impression = subItemList[i].impression;
					var examParamerter = subItemList[i].examParameter?subItemList[i].examParameter:"";
					var resultDateTime = subItemList[i].resultDateTime?subItemList[i].resultDateTime:"";
					var table = 
					"<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>检查名称:</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>" + examItem + 
					"</td></tr><tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>印象:</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ impression +
					"</td></tr><tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>检查参数:</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ examParamerter +"</td></tr><tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>报告日期:</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ resultDateTime +"</td></tr><tr><td>&nbsp;</td></tr>";
					itemInfo.append(table);
				}
			}
			
		}
		function fastSearch(){
			$("#dmyModal").modal("show");
		}
		function submitSearch(){
			$("#dmyModal").modal("hide");
			document.fastSearchForm.submit();
		}
		
		function showChart(patienId, visitId, itemName){
			var params = {patientId:patienId,visitId:visitId,itemName:itemName};
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/chart_findSameItemChart.action',
				type:'post',
				dataType:'json',
				data:params,
				success:displayChart
			});
			$("#chartItemName").val(itemName);
	   	}
		function displayChart(data){
			var myChart = new FusionCharts("Charts/MSLine.swf", "myChartId", "692","300", "0", "1");
			myChart.setJSONData(data);
			myChart.render("chartDisplayDiv");
			$("#ChartInfo").modal("show");
		}
		function showReportInfo(patientId, visitId){
			var params = {patientId:patientId,visitId:visitId};
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/report_reportList.action',
				type:'post',
				dataType:'json',
				data:params,
				success:processResult2
			});
		}
		function processResult2(data){
			var reportList = data.reportFileList;
			var diagList = data.diagList;
			var reportInfo = $("#reportInfoTable");
			var diagnoseInfo = $("#diagInfoTable>tbody");
			reportInfo.html("");
			diagnoseInfo.html("");
			var tr = "<tr>";
			
			if(reportList==null||reportList.length==0){
				reportInfo.append("<tr><td style='font-size:15px' colspan='3'>没有相关报告</td></tr>");
			}
			else{
				for(var i in reportList){
					var reportName = reportList[i].fileName;
					var path = reportList[i].path;
					var index = Number(i)+1;
					tr += "<td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + index + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'>" + reportName + 
					"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px'><a href=\"javascript:showReport('"+ path +"')\">查看</a></td></tr>";
				}
				reportInfo.append("<thead><tr><th style='font-size:15px;width:50px;text-align:center'>序号</th><th style='font-size:15px;width:600px'>报告名称</th><th style='font-size:15px;width:50px'>操作</th></tr></thead><tbody>"+tr+"</tbody>");
			}
			
			if(diagList==null||diagList.length==0) {
				diagnoseInfo.append("<tr><td style='font-size:15px' colspan='3'>没有相关报告</td></tr>");
			}
			else { 
				for(var i in diagList) {
					var patientId = diagList[i].patientId;
					var visitId = diagList[i].visitId;
					var patName = diagList[i].patientName;
					var sex = diagList[i].sex;
					var age = diagList[i].age;
					var operResult = diagList[i].operResult;
					var operConclusion = diagList[i].operConclusion;
					var operDate = diagList[i].operDate;
					var smoke = diagList[i].smoke;
					var alcohol = diagList[i].alcohol;
					var curIllness = diagList[i].curIllness;
					var hisIllness = diagList[i].hisIllness;
					var perHis = diagList[i].perHis;
					var familyHis = diagList[i].familyHis;
					var specialItem = diagList[i].specialItem;
					var leaveDia = diagList[i].leaveDia;
					var leaveTips = diagList[i].leaveTips;
					
					diagnoseInfo.append("<tr><td colspan='10' style='font-size:15px;height:15px;line-height:15px;padding:4px;text-align:center;font-weight:bold;background-color:#DEEDFE'>基本信息</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病人姓名</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
					patName +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病人ID</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
					patientId +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>性别</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
					sex +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>年龄</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ 
					age +"</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>病次</td><td style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ visitId +"</td></tr>");
					
					diagnoseInfo.append("<tr><td colspan='10' style='font-size:15px;height:15px;line-height:15px;padding:4px;text-align:center;font-weight:bold;background-color:#DEEDFE'>手术信息</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>手术日期</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ operDate +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>手术结果</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ operResult +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>结论</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ operConclusion +"</td></tr>");
					
					diagnoseInfo.append("<tr><td colspan='10' style='font-size:15px;height:15px;line-height:15px;padding:4px;text-align:center;font-weight:bold;background-color:#DEEDFE'>病史信息</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>吸烟史</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ smoke +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>饮酒史</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ alcohol +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>现病史</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ curIllness +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>既往史</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ hisIllness +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>个人史</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ perHis +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>家族史</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ familyHis +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>化验及特殊检查</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ specialItem +"</td></tr>");
					
					diagnoseInfo.append("<tr><td colspan='10' style='font-size:15px;height:15px;line-height:15px;padding:4px;text-align:center;font-weight:bold;background-color:#DEEDFE'>出院信息</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>出院诊断</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ leaveDia +"</td></tr>");
					diagnoseInfo.append("<tr><td style='font-size:15px;height:15px;line-height:15px;padding:4px;width:80px;font-weight:bold'>出院医嘱</td><td colspan='9' style='font-size:15px;height:15px;line-height:15px;padding:4px;'>"+ leaveTips +"</td></tr>");
				}
			}
			$("#ReportInfo").modal("show");
		}
		function showReport(path){
			window.open(path);
		}
		function exportToExcel(type){
			$("#exportType").val(type);
			$("#SubjectInfo").modal("show");
		}
		function fValidate(object){
			$("#SubjectInfo").modal("hide");
			object.submit();
		}
		function fValidateR(object){
			$("#ReportInfo").modal("hide");
			object.submit();
		}
		function changeTab(type) {
			var reportDiv = $("#rep");
			var diagnoseDiv = $("#dia");
			var diagInfoTable = $("#diagInfoTable");
			var repInfoTable = $("#reportInfoTable");
			
			var chromt = $("#chromt");
			var chromc = $("#chromc");
			
			var bioChart = $("#biochart");
			var bioTable = $("#biobody");
			
			if(type==1){
				diagInfoTable.css("display","block");
				repInfoTable.css("display","none");
				reportDiv.toggleClass("tab_select");
				diagnoseDiv.toggleClass("tab_select");
			} else if(type==3) {
				bioChart.css("display","none");
				bioTable.css("display","block");
				chromt.toggleClass("tab_select");
				chromc.toggleClass("tab_select");
			} else if(type==4) {
				bioChart.css("display","block");
				bioTable.css("display","none");
				chromt.toggleClass("tab_select");
				chromc.toggleClass("tab_select");
			}
			else {
				diagInfoTable.css("display","none");
				repInfoTable.css("display","block");
				reportDiv.toggleClass("tab_select");
				diagnoseDiv.toggleClass("tab_select");
			}
		}
		function selectAll() {
			$("#subjectSelect input[type=checkbox]").each(function(){$(this).attr( "checked", true)});
		}
		function deSelectAll() {
			$("#subjectSelect input[type=checkbox]").each(function(){$(this).attr( "checked", false)});
		}
		function selectGroup(obj){
			var flag = $(obj).attr("checked")=="checked"?true:false;
			$(obj).parent().parent().find("input[type=checkbox]:gt(0)").each(function(){$(this).attr("checked",flag)});
		}
		function showBioInfo(chrom) {
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/bio_infoAction.action',
				type:'post',
				dataType:'json',
				data:{choromsome:chrom},
				success:createBioInfo
			});
		}
		function createBioInfo(data) {
			var bioList = data.bioList;
			$("#bioModal").modal("show");
			var bioTable = $("#biobody tbody");
			bioTable.html("");
			$("#biochart").html("");
			for(var x in bioList) {
				var tr = "";
				tr += "<td>"+bioList[x].chromosomid+"</td>";
				tr += "<td>"+bioList[x].coordinate+"</td>";
				tr += "<td>"+bioList[x].reference+"</td>";
				tr += "<td>"+bioList[x].consensus+"</td>";
				tr += "<td>"+bioList[x].quality+"</td>";
				tr += "<td>"+bioList[x].bestbase+"</td>";
				tr += "<td>"+bioList[x].averagequality+"</td>";
				tr += "<td>"+bioList[x].countofunique+"</td>";
				tr += "<td>"+bioList[x].countofall+"</td>";
				tr += "<td>"+bioList[x].secondbest+"</td>";
				tr += "<td>"+bioList[x].averagequalitys+"</td>";
				tr += "<td>"+bioList[x].countofuniques+"</td>";
				tr += "<td>"+bioList[x].countofalls+"</td>";
				tr += "<td>"+bioList[x].sequencing+"</td>";
				tr += "<td>"+bioList[x].ranksum+"</td>";
				tr += "<td>"+bioList[x].averagecopy+"</td>";
				tr += "<td>"+bioList[x].whetherisdbsnp+"</td>";
				if(x%2==0) {
					bioTable.append("<tr>"+tr+"</tr>");
				} else {
					bioTable.append("<tr style='background-color:#eeeeee'>"+tr+"</tr>");
				}
			}
			$("#biochart").append("<img stlye='margin-left:50px' width='380px' height='380px' src='resources/imgs/S2PRB11a02830A_cumuPlot.png'/>");
			$("#biochart").append("<img stlye='margin-left:50px' width='380px' height='380px' src='resources/imgs/S2PRB11a02830A_depthByChr.png'/>");
			$("#biochart").append("<img style='margin-left:50px' width='380px' height='380px' src='resources/imgs/S2PRB11a02830A_histPlot.png'/>");
		}
		function checkParent(obj){
			var checkedNum = 0;
			var checkboxSize = $(obj).parent().parent().find("input[type=checkbox]:gt(0)").size();
			$(obj).parent().parent().find("input[type=checkbox]:gt(0)").each(function(){
				if($(this).attr("checked")){
					checkedNum++;
				}
			});
			if(checkedNum==0){
				$(obj).parent().parent().find("input[type=checkbox]:eq(0)").attr("checked",false);
			} else if(checkedNum==checkboxSize) {
				$(obj).parent().parent().parent().find("input[type=checkbox]:eq(0)").attr("checked",true);
			}
		}
   </script>
</body>
</html>