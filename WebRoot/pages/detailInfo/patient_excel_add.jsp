<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="cn.ac.big.dp.bean.*"%>
<%@ taglib uri="/myTagLib" prefix="p"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科临床信息管理系统---病历添加</title>
<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}' />
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
<link rel="stylesheet" type="text/css" href="resources/css/uploadify.css" />
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<style type="text/css">
.user_info {
	margin: 18px;
	text-align: left;
}

.user_info th {
	font-weight: bold;
	height: 25px;
}

.tab_select {
	border-bottom: 3px solid #24A0DA;
	font-weight: bold;
}

html,body,div,table,td,th,input,tr,span,p,ul,li,a,select {
	font-family: "微软雅黑"
}
#basicInfo label { width:70px;font-weight:bold }
#visit label { width:70px;font-weight:bold }
#basicInfo label.error {font-size:12px;color:red;font-weight:normal;width:60px;padding-left:5px}
#visit label.error {font-size:12px;color:red;font-weight:normal;width:60px;padding-left:5px}
#test label.error {font-size:12px;color:red;font-weight:normal;width:60px;padding-left:5px}
#exam label.error {font-size:12px;color:red;font-weight:normal;width:60px;padding-left:5px}
#diag label.error {font-size:12px;color:red;font-weight:normal;width:60px;padding-left:5px}
#basicInfo div{
	margin:4px 0px
}
#visit div {
	margin:4px 0px
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
#autoTips{
	font-size:12px;
	width:150px;
	height:250px;
	background-color:white;
	overflow: scroll;
}
.label-left {
	padding:5px;
	margin: 10px 0px;
	border-left:5px solid #24A0DA;
	font-size:14px
}
.inputdiv{
	border:0px;
	border-bottom:1px dashed #666;
	background-color: transparent;
	width:190px;
	font-size:15px;
	font-family:楷体
}
.inputdiv-item {
	border:0px;
	border-bottom:1px dashed #666;
	background-color: transparent;
	width:50px;
	font-size:15px;
	font-family:楷体;
	text-align:center
}
.tab_select{
	border-bottom:3px solid #24A0DA;
	font-weight:bold;
}
</style>
<script type="text/javascript" src="scripts/html5.js"></script>
</head>
<body>
	<div
		style="height:30px;background-color:#666;position:fixed;top:0px;width:100%;z-index:100;">
		<div
			style="margin-left:20px;z-index:101;color:#fff;padding-top:7px;font-size:14px">
			当前位置&nbsp;:&nbsp;添加病例<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div></div>
	</div>
	<section style="padding-top: 10px; padding-left: 20px;">
		<div class="detail" style="margin-right:20px;width: 290px; float: left;margin-top:20px;font-size:13px">
			<div class="alert fade in" style="padding-bottom:25px;margin-top:20px">
           		<a class="close" data-dismiss="alert" href="#">×</a>
           		<div style="margin-top:20px">
           			<div class="top_menu">
           				<div style="background-color:#c09853;font-size:15px;font-weight:bold;padding:10px 22px;float:left;border-radius:10px 0px 0px 10px;border-right:1px solid #c09853"><a href="pages/detailInfo/patient_add.jsp" style="color:white">创建病例</a></div>
           				<div style="background-color:#fbeedb;;font-size:15px;font-weight:bold;padding:10px 22px;float:left;border-radius:0px 10px 10px 0px"><a href="search/patient_findPatientPager.action" >修改病例</a></div>
           				<div style="clear:both"></div>
           			</div>
           			<ul style="margin-top:20px">
						<li class="nav"><a href="pages/detailInfo/patient_add.jsp">病人完整信息</a></li>
						<li class="nav"><a href="pages/detailInfo/patient_basic_add.jsp">病人基本信息</a></li>
						<li class="nav"><a href="pages/detailInfo/patient_vis_add.jsp">病人住院信息</a></li>
						<li class="nav"><a href="pages/detailInfo/patient_ted_add.jsp">检查\检验\诊断\带药</a></li>
						<li class="nav"><a href="template/template_index.action" class="selected">Excel导入</a></li>
					</ul>
           		</div>
         	 </div>
		</div>
		<div class="searchPanal" style="float:left;width:75%;">
			<form action="search/patient_s_addPatientInfoExcel.action" method="post" id="commonForm">
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:36px;font-size:16px;background-color: #eee">模板下载</label>
			<div id="basicInfo" class="searchbar" style="margin-top:20px;">
				<div style="float:left"><a href="tmp/template.xls" class="btn btn-primary" style="margin-left:10px;margin-right:10px;font-weight:bold;font-size:13px;padding:7px 30px;margin-top:4px;border-radius:15px 15px 15px 15px">基本信息模板</a></div>
				<div style="float:left;"><input type="file" name="fileupload" id="file_upload_basic" /></div>
				<div style="float:left"><a href="javascript:selectTemplate()" class="btn btn-primary" style="margin-left:10px;margin-right:10px;font-weight:bold;font-size:13px;padding:7px 30px;margin-top:4px;border-radius:15px 15px 15px 15px">病例信息模板</a></div>
				<div style="float:left"><input type="file" name="fileupload" id="file_upload_ted" /></div>
				<div style="clear:both">
				</div>
			</div>
			<div style="clear: both;"></div>
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:36px;font-size:16px;background-color: #eee">基本信息</label>
			<div id="basicInfo" class="searchbar" style="margin-top:20px">
				<div id="col1" style="width:33%;float:left">
					<div style="position: relative;">
						<label for="patient.patientName">姓名：</label>
						<input class="inputdiv" type="text" id="patientName" name="patient.patientName"/>
					</div>
					<div>
						<label for="patientId">ID：</label>
						<input id="patientId" class="inputdiv" class="required" type="text" onclick="autoSelectId()" id="patientId" name="patient.patientId"/>
					</div>
					<div>
						<label for="sex">性别：</label>
						<input class="inputdiv" type="text" id="sex" name="patient.sex"/>
					</div>
					<div>
						<label for="birthday">出生日期:</label>
						<input class="inputdiv" id="birthday" name="patient.birthday" type='text' size='20' class="required" onclick="WdatePicker({isShowClear:false,readOnly:true})"/>
					</div>
					<div>
					<label>婚否:</label>
						<input class="inputdiv" type="text" id="maritalStatus" name="patient.maritalStatus"/>
					</div>
					</div>
					<div id="col3" style="width:33%;float:left">
						<div>
						<label>民族:</label>
						<input class="inputdiv" type="text" id="nation" name="patient.nation"/>
						</div>
						<div>
						<label>病人类型:</label>
							<input class="inputdiv" type="text" id="identity" name="patient.identity"/>
						</div>
						<div>
						<label>缴费类型:</label>
							<input class="inputdiv" type="text" id="chargeType" name="patient.chargeType"/>
						</div>
						<div>
							<label for="mailAddress">通信地址:</label>
							<input class="inputdiv" type="text" name="patient.mailAddress" id="mailAddress"/>
						</div>
						<div>
						<label for="zipCode">邮政编码:</label>
							<input class="inputdiv" type="text" id="zipCode" name="patient.zipCode"/>
						</div>
					</div>
					<div id="col2" style="width:33%;float:left">
						<div>
							<label for="phoneNumberHome">家庭电话:</label>
							<input class="inputdiv" type="text" id="phoneNumberHome" name="patient.phoneNumberHome"/>
						</div>
						<div>
						<label for="phoneNumberBussness">常用电话:</label>
							<input class="inputdiv" type="text" id="phoneNumberBussness" name="patient.phoneNumberBussness"/>
						</div>
						<div>
						<label for="nextOfKin">紧急联系人:</label>
							<input class="inputdiv" type="text" id="nextOfKin" name="patient.nextOfKin"/>
						</div>
						<div>
						<label for="nextOfKinAddr">联系人地址:</label>
							<input class="inputdiv" type="text"  id="nextOfKinAddr" name="patient.nextOfKinAddr"/>
						</div>
						<div>
							<label for="nextOfKinPhone">联系人电话:</label>
								<input class="inputdiv" type="text" id="nextOfKinPhone" name="patient.nextOfKinPhone"/>
						</div>
					</div>
				<div style="clear:both"></div>
			</div>
			<div style="clear: both;"></div>
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:20px;font-size:16px;background-color: #eee">住院信息</label>
			<div id="patient_visit" class="searchbar">
					<div id="visit">
						<div id='vcol1' style='width:33%;float:left'>
							<div>
								<label for='visitId'>病次:</label>
								<input class="inputdiv" id="visitId" type="text" name="visit.visitId"/>
							</div>
							<div>
								<label>住院科室:</label>
								<input class="inputdiv" id="deptDischargeFrom" type="text" name="visit.deptDischargeFrom"/>
							</div>
							<div>
								<label for='attendingDoctor'>治疗医师:</label>
								<input class="inputdiv" type='text' id="attendingDoctor" name="visit.attendingDoctor"/>
							</div>
						</div>
						<div id='vcol2' style='width:33%;float:left'>
							<div>
								<label for='admissionDateTime'>住院日期:</label>
								<input name="visit.admissionDateTime" class="inputdiv"id='admissionDateTime' type='text' size='20' onclick='WdatePicker({isShowClear:false,readOnly:true})'/>
							</div>
							<div>
								<label>病人类型:</label>
								<input class="inputdiv" id="patientClass" name="visit.patientClass" type="text"/>
							</div>
						</div>
						<div id='vcol3' style='width:33%;float:left'>
							<div>
								<label>入院目的:</label>
								<input class="inputdiv" type="text" id="admissionCause" name="visit.admissionCause"/>
							</div>
							<div>
								<label for='consultingDoctor'>主治医师</label>
								<input class="inputdiv" name="visit.consultingDoctor" type='text' id='consultingDoctor' class='required'/>
							</div>
						</div>
						<div style='clear:both'></div>
					</div>
			</div>
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:20px;font-size:16px;background-color: #eee">检查/检验/诊断/带药信息</label>
			<div id="patient_visit" class="searchbar">
				<div id="examresult">
				</div>
				<div id="labresult">
				</div>
				<div id="diagresult">
				</div>
				<div id="drugresult">
				</div>
			</div>
			
			<div style="padding-bottom:200px;margin-top:20px;float:right">
				<a href="javascript: submit()" class="btn btn-primary">确定</a>
				<a href="javascript: reset()" class="btn">重置</a>
			</div>
			</form>
		</div>

		 <!-- 保存提示框 -->
		<div id="exportModal" class="modal hide fade" style="display: none; width:53%;left:42%">
           <div class="modal-header" id="tab-header">
              <a class="close" data-dismiss="modal">×</a>
             	<div style="float:left;padding:5px;" class="tab_select" id="tab-0"><a href="javascript:changeTab(0)" style="color:#666">检查</a></div>
             	<div style="float:left;padding:5px;" id="tab-1"><a href="javascript:changeTab(1)" style="color:#666">检验</a></div>
             	<div style="float:left;padding:5px;" id="tab-2"><a href="javascript:changeTab(2)" style="color:#666">诊断</a></div>
             	<div style="float:left;padding:5px;" id="tab-3"><a href="javascript:changeTab(3)" style="color:#666">带药</a></div>
             	<div style="clear:both"></div>
            </div>
            <div class="modal-body" style="font-size:13px;" id="tab-content">
            <div id="tab-body-0">
				<form action="export/export_exportToExcel.action" method="post" id="exportForm_0" target="_blank">
					<s:iterator value="examDictList" id="dict" status="index">
						<div>
							<input type="checkbox" style="width:15px;height:15px" name="itemIds" value="${dict.dictId }" />
							<s:property value="#dict.dictName" />
							<div style="margin-top:8px;margin-left:20px">
								<div style="clear:both;margin-bottom:8px"></div>
							</div>
							<input type="hidden" name="exportType" value="5" />
							<input type="hidden" name="excelType" value="0"/>
						</div>
					</s:iterator>
				</form>
			</div>
			<div id="tab-body-1">
				<form action="export/export_exportToExcel.action" method="post" id="exportForm_1" target="_blank">
					<s:iterator value="labDictList" id="dict" status="index">
						<div>
							<input type="checkbox" style="width:15px;height:15px" name="itemIds" value="${dict.dictId }" />
							<s:property value="#dict.dictName" />
							<div style="margin-top:8px;margin-left:20px">
								<div style="clear:both;margin-bottom:8px"></div>
							</div>
							<input type="hidden" name="exportType" value="5" />
							<input type="hidden" name="excelType" value="1"/>
						</div>
					</s:iterator>
				</form>
			</div>
			<div id="tab-body-2">
				<form action="export/export_exportToExcel.action" method="post" id="exportForm_2" target="_blank">
					<s:iterator value="diagDictList" id="dict" status="index">
						<div>
							<input type="checkbox" style="width:15px;height:15px" name="itemIds" value="${dict.dictId }" />
							<s:property value="#dict.dictName" />
							<div style="margin-top:8px;margin-left:20px">
								<div style="clear:both;margin-bottom:8px"></div>
							</div>
							<input type="hidden" name="exportType" value="5" />
							<input type="hidden" name="excelType" value="2"/>
						</div>
					</s:iterator>
				</form>
			</div>
			<div id="tab-body-3">
				<form action="export/export_exportToExcel.action" method="post" id="exportForm_3" target="_blank">
					<s:iterator value="drugDictList" id="dict" status="index">
						<div>
							<input type="checkbox" style="width:15px;height:15px" name="itemIds" value="${dict.id }" />
							<s:property value="#dict.DRUG_NAME" />
							<div style="margin-top:8px;margin-left:20px">
								<div style="clear:both;margin-bottom:8px"></div>
							</div>
							<input type="hidden" name="exportType" value="5" />
							<input type="hidden" name="excelType" value="3"/>
							<input type="hidden" name="drugFlag" value="1" />
						</div>
					</s:iterator>
				</form>
			</div>
			</div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: fValidate()" class="btn btn-primary">导出模板</a>
            </div>
         </div>

		<!-- 快速查询提示框 -->
		<div id="dmyModal" class="modal hide fade" style="display: none; ">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>快速查找病人</h3>
			</div>
			<div class="modal-body">
				<form name="fastSearchForm"
					action="search/patient_findPatient.action" method="get"
					target="_blank">
					<label>病人ID：</label> <input type="text" value="" name="patientId" />
					<input type="hidden" value="1" name="isFirstSerachFlag" />
				</form>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">取消</a> <a
					href="javascript: submitSearch()" class="btn btn-primary">确定</a>
			</div>
		</div>
		</section>

		<nav class="win-navigationlayout">
			<div class="container">
				<div class="nav-header">
					<a href="javascript: fNavStatusToggle()" class="win-command"> <span
						class="win-commandimage PNG-Right"></span> </a>
					<h2>功能导航</h2>
				</div>
				<div class="nav-container">
					<ul>
						<li class="win-label"><a href="pages/index/index.jsp">首页</a>
						</li>
						<li class="win-label"><a
							href="pages/detailInfo/patient_add.jsp">病例管理</a>
						</li>
						<li class="win-label"><a
							href="admin/userAction_getAllUsers.action?isFirstSerachFlag=1">用户信息管理</a>
						</li>
						<li class="win-label"><a
							href="admin/codeAction_queryAllDictInfo.action?isFirstSerachFlag=1">代码信息管理</a>
						</li>
						<li class="win-label"><a href="pages/search/search.jsp">病例检索</a></li>
						<li class="win-label"><a href="diag/diag_getDiagName.action">报表统计</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<footer class="win-commandlayout">
			<div class="container">
				<a class="win-command" href="actions/codeAction_query"> <span
					class="win-commandimage PNG-Refresh"></span> <span
					class="win-label">刷新</span> </a> <a class="win-command"
					onclick="fNavStatusToggle()"> <span
					class="win-commandimage PNG-Navigation"></span> <span
					class="win-label">导航</span> </a> <a class="win-command"
					href="j_spring_security_logout"> <span
					class="win-commandimage PNG-Exit"></span> <span class="win-label">退出</span>
				</a>
			</div>
		</footer>

		<script type="text/javascript" src="scripts/jquery-1.7.2.min.js"></script>
   		<script type="text/javascript" src="scripts/commonUtil.js"></script>
		<script type="text/javascript" src="scripts/jquery.uploadify.min.js"></script>
   		<script type="text/javascript" src="scripts/modal.js"></script>
		<script type="text/javascript" src="scripts/date/WdatePicker.js"></script>
   		<script type="text/javascript">
   			function fNavStatusToggle(){
   				$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
   			}
		</script>

<script type="text/javascript">
var tabCount = 0;
//选项卡切换
function changeTab(type) {
	tabCount = type;
	var selectedTab = $("#exportModal #tab-body-"+type);	
	$("#tab-content>div").css("display", "none");
	selectedTab.css("display", "block");
	$("#tab-header>div").removeClass();
	$("#exportModal #tab-"+type).toggleClass("tab_select");
}
//校验导出模板modal至少选择一个大项
function fValidate() {
	$("#exportForm_"+tabCount).submit();
}
function selectTemplate() {
	$("#exportModal").modal("show");
}
$(function() {
    $('#file_upload_basic').uploadify({
    	'buttonText':'上传基本信息',
        'swf'  			: '<%=basePath%>uploadify.swf', 
        'uploader'     	: '<%=basePath%>upload/upload_Basic.action',
        'fileObjName' 	: 'fileupload',
        'fileTypeDesc'   : '支持格式:xls', 
        'fileTypeExts'   : '*.xls',  
        'onUploadSuccess' : function(file,data,response) {  
        	if(response) {
        		autoFillInputBasic(data);
        	}
        },  
    });
     $('#file_upload_ted').uploadify({
    	'buttonText':'上传病历信息',
        'swf'  			: '<%=basePath%>uploadify.swf', 
        'uploader'     	: '<%=basePath%>upload/upload_Ted.action',
        'fileObjName' 	: 'fileupload',
        'fileTypeDesc'   : '支持格式:xls', 
        'fileTypeExts'   : '*.xls',  
        'onUploadSuccess' : function(file,data,response) {  
        	if(response) {
        		autoFillInputTed(data);
        	}
        },  
    });
});
function autoFillInputTed(data) {
	var obj = eval('(' + data + ')');
	var tedFlag = obj.tedFlag;
	var divId = null;
	var valueMap = null;
	
	if(tedFlag.indexOf("检查")!=-1){
		divId = "examresult";
		valueMap = obj.exam;
	} else if(tedFlag.indexOf("检验")!=-1) {
		divId = "labresult";
		valueMap = obj.lab;
	} else if(tedFlag.indexOf("诊断")!=-1) {
		divId = "diagresult";
		valueMap = obj.diag;
	} else if(tedFlag.indexOf("带药")!=-1) {
		divId = "drugresult";
		valueMap = obj.drug;
	} else {
		//保留
	}
	var divContent = $("#"+divId);
	divContent.empty();
	var subject = null;
	var item = null;
	
	for(var i in valueMap) {
		subject = i;
		item = valueMap[subject];
		
		divContent.append("<div class='label-left'>"+ subject +"</div>");
		
		divContent.append(generateTable(4, item));
	}
}
function generateTable(colnum, list) {
	var tr = "<tr>";
	var trend = "</tr>";
	var td = "<td width='250px'>";
	var tdend = "</td>";
	var table = "<tr>";
	var cellnum = 0;
	for(var x in list) {
		if(cellnum!=0 && cellnum %colnum==0){
			table += trend + tr + "<label for='item'>"+ list[x].item +"</label><input style='float:right;margin-right:20px' class='inputdiv-item' type='text' value=" + list[x].result+">" + tdend;
			cellnum = 0;
		} else {
			table += td + "<label for='item'>"+ list[x].item +"</label><input style='float:right;margin-right:20px' class='inputdiv-item' type='text' value="+ list[x].result+">" + tdend;
			cellnum++;
		}
	}
	table += trend;
	return table;
}
function autoFillInputBasic(data) {
	var obj = eval('(' + data + ')');
    var msg = obj.result;
    if(msg.indexOf("ok")!=-1) {
	    var p = obj.patient;
	    $("#patientId").val(p.patientId);
	    $("#patientName").val(p.patientName);
	   	$("#sex").val(p.sex);
	   	$("#birthday").val(p.birthday);
	   	$("#nation").val(p.nation);
	   	$("#identity").val(p.identity);
    	$("#mailAddress").val(p.mailAddress);
    	$("#maritalStatus").val(p.maritalStatus);
	    $("#chargeType").val(p.chargeType);
	   	$("#phoneNumberHome").val(p.phoneNumberHome);
	   	$("#phoneNumberBussness").val(p.phoneNumberBussness);
	   	$("#zipCode").val(p.zipCode);
	   	$("#nextOfKinAddr").val(p.nextOfKinAddr);
	    $("#nextOfKin").val(p.nextOfKin);
	   	$("#nextOfKinPhone").val(p.nextOfKinPhone);
	   	var v = obj.visit;
	    $("#visitId").val(v.visitId);
	   	$("#deptDischargeFrom").val(v.deptDischargeFrom);
	   	$("#attendingDoctor").val(v.attendingDoctor);
	   	$("#admissionDateTime").val(v.admissionDateTime);
	   	$("#patientClass").val(v.patientClass);
    	$("#admissionCause").val(v.admissionCause);
    	$("#consultingDoctor").val(v.consultingDoctor);
    } else {
    	alert(msg);
    }
}
function submit() {
	var patientId = $("#patientId").val();
	if(patientId=="") {
		alert("错误,请先上传病人基本信息");
	} else {
		$("#commonForm").submit();
	}
}
</script>
</body>
</html>
