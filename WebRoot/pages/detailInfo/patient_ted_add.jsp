<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="cn.ac.big.dp.bean.*"%>
<%@ taglib uri="/myTagLib" prefix="p"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科临床信息管理系统---病历添加</title>
<base
	href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}' />
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
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
#drug label.error {font-size:12px;color:red;font-weight:normal;width:60px;padding-left:5px}
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
.inputdiv{
	border:0px;
	border-bottom:1px dashed #666;
	background-color: transparent;
	width:190px;
	font-size:15px;
	font-family:楷体
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
						<li class="nav"><a href="pages/detailInfo/patient_ted_add.jsp"  class="selected">检查\检验\诊断\带药</a></li>
						<li class="nav"><a href="template/template_index.action">Excel导入</a></li>
					</ul>
           		</div>
         	 </div>
		</div>
		<div class="searchPanal" style="float:left;width:75%;" onclick="hideTips()">
			<form action="search/patient_s_addPatientTEDInfo.action" method="post" id="commonForm">
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:36px;font-size:16px;background-color: #eee">基本信息</label>
			<div id="basicInfo" class="searchbar" style="margin-top:20px">
				<div id="col1" style="width:33%;float:left">
					<div style="position: relative;">
						<label for="patient.patientName">姓名：</label>
						<input autocomplete="off" type="text" id="patName" onkeyup="autoSelectName(this.value)" class="required" name="patient.patientName" id="patientName"/>
						<div id="autoTips" style="display:none;position: absolute;left:78px;top:26px;border:1px solid #000">
						</div>
					</div>
					<div>
						<label for="patientId">ID：</label>
						<input type="hidden" id="patientIdH" name="patient.patientId"/>
						<input disabled="disabled" class="inputdiv" type="text" onclick="autoSelectId()" id="patientId" name="patient.patientId"/>
					</div>
					<div>
						<label for="sex">性别：</label>
						<input disabled="disabled" class="inputdiv" type="text" id="sex" />
					</div>
					<div>
						<label for="birthday">出生日期:</label>
						<input disabled="disabled" class="inputdiv" id="birthday" name="patient.birthday" type='text' size='20' class="required" onclick="WdatePicker({isShowClear:false,readOnly:true})"/>
					</div>
					<div>
					<label>婚否:</label>
						<input disabled="disabled" class="inputdiv" type="text" id="maritalStatus"/>
					</div>
					</div>
					<div id="col3" style="width:33%;float:left">
						<div>
						<label>民族:</label>
						<input disabled="disabled" class="inputdiv" type="text" id="nation"/>
						</div>
						<div>
						<label>病人类型:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="identity"/>
						</div>
						<div>
						<label>缴费类型:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="chargeType"/>
						</div>
						<div>
							<label for="mailAddress">通信地址:</label>
							<input disabled="disabled" class="inputdiv" type="text" name="patient.mailAddress" id="mailAddress"/>
						</div>
						<div>
						<label for="zipCode">邮政编码:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="zipCode" name="patient.zipCode"/>
						</div>
					</div>
					<div id="col2" style="width:33%;float:left">
						<div>
							<label for="phoneNumberHome">家庭电话:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="phoneNumberHome" name="patient.phoneNumberHome"/>
						</div>
						<div>
						<label for="phoneNumberBussness">常用电话:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="phoneNumberBussness" name="patient.phoneNumberBussness"/>
						</div>
						<div>
						<label for="nextOfKin">紧急联系人:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="nextOfKin" name="patient.nextOfKin"/>
						</div>
						<div>
						<label for="nextOfKinAddr">联系人地址:</label>
							<input disabled="disabled" class="inputdiv" type="text"  id="nextOfKinAddr" name="patient.nextOfKinAddr"/>
						</div>
						<div>
							<label for="nextOfKinPhone">联系人电话:</label>
								<input disabled="disabled" class="inputdiv" type="text" id="nextOfKinPhone" name="patient.nextOfKinPhone"/>
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
								<select id='visitId' onchange="autoVisitOther()" name="visit.visitId" class='required' style="width:140px">
								</select>
							</div>
							<div>
								<label>住院科室:</label>
								<input disabled="disabled" class="inputdiv" id="deptDischargeFrom" type="text"/>
							</div>
							<div>
								<label for='attendingDoctor'>治疗医师:</label>
								<input disabled="disabled" class="inputdiv" type='text' id="attendingDoctor"/>
							</div>
						</div>
						<div id='vcol2' style='width:33%;float:left'>
							<div>
								<label for='admissionDateTime'>住院日期:</label>
								<input disabled="disabled" class="inputdiv"id='admissionDateTime' type='text' size='20' onclick='WdatePicker({isShowClear:false,readOnly:true})'/>
							</div>
							<div>
								<label>病人类型:</label>
								<input disabled="disabled" class="inputdiv" id="patientClass" type="text"/>
							</div>
						</div>
						<div id='vcol3' style='width:33%;float:left'>
							<div>
								<label>入院目的:</label>
								<input disabled="disabled" class="inputdiv" type="text" id="admissionCause"/>
							</div>
							<div>
								<label for='consultingDoctor'>主治医师</label>
								<input disabled="disabled" class="inputdiv" type='text' id='consultingDoctor' class='required'/>
							</div>
						</div>
						<div style='clear:both'></div>
					</div>
			</div>
			<div style="clear:both"></div>
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:20px;font-size:16px;background-color: #eee">检验&nbsp;<input type="button" onclick="addTest()" value="添加"/></label>
			<div id="test_info" class="searchbar">
					<div id="test">
					</div>
			</div>
			<div style="clear: both;"></div>
			<div id="exam_info">
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:20px;font-size:16px;background-color: #eee">检查&nbsp;<input type="button" onclick="addExam()" value="添加"/></label>
				<div id="exam" class="searchbar">
				</div>
			</div>
			<div style="clear: both;"></div>
			<div id="diag_info">
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:20px;font-size:16px;background-color: #eee">诊断&nbsp;<input type="button" onclick="addDiag()" value="添加"/></label>
				<div id="diag" class="searchbar">
				</div>
			</div>
			<div style="clear: both;"></div>
			<div id="drug_info">
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:20px;font-size:16px;background-color: #eee">带药&nbsp;<input type="button" onclick="addDrug()" value="添加"/></label>
				<div id="drug" class="searchbar">
				</div>
			</div>
			<div style="padding-bottom:200px;margin-top:20px;float:right">
				<a href="javascript: submit()" class="btn btn-primary">确定</a>
				<a href="javascript: reset()" class="btn">重置</a>
			</div>
			</form>
		</div>

		<!-- 快速查询提示框 -->
		<div id="dmyModal" class="modal hide fade" style="display: none;">
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

		<script type="text/javascript" src="scripts/jquery.js"></script>
		<script type="text/javascript" src="scripts/commonUtil.js"></script>
		<script type="text/javascript" src="scripts/jquery.validate.js"></script>
		<script type="text/javascript" src="scripts/jquery.metadata.js"></script>
		<script type="text/javascript" src="scripts/cmxforms.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/date/WdatePicker.js"></script>
		<script type="text/javascript">
		var dictList;
		var newVisit;
		var newTest;
		var newExam;
		var newDiag;
		var newDrug;
		var testCount = -1;
		var examCount = -1;
		var diagCount = 0;
		var drugCount = 0;
		var labOptions = "";
		var examOptions = "";
		var diagOptions = "";
		var drugOptions = "";
		var countMap = {};
		var visitList;
		$(document).ready(function(){
			getAllDict();
			getAllDrug();
			$("#commonForm").validate();
		});
		/*添加新检验*/
		function addTest() {
			testCount++;
			$("#test").append("<div><input style='float:left' type='button' value='删除' onclick='removeThisItemLine(this)'/><div style='float:left'><label>抽样:</label><select name='item["+testCount+"].specimen'><option>静脉血</option><option>尿液</option></select><label>时间:</label><input id='execute_time' name='item["+testCount+"].executeTime' type='text' size='20' class='required' onclick='WdatePicker({isShowClear:false,readOnly:true})'/><label>检验项:</label><select name='item["+ testCount +"].subject' id='test_subject' onchange='resetSubItem(this,\"test\")'>"+ labOptions +"</select><input type='button' onclick='addTestResult(this,testCount)' value='检验小项'/></div><div style='margin-left:20px;float:left' id='sub_test'></div><div style='clear:both'></div></div>");
			countMap['test'+testCount]=0;
		}
		/*添加新检查*/
		function addExam() {
			examCount++;
			$("#exam").append("<div><input style='float:left' type='button' value='删除' onclick='removeThisItemLine(this)'/><div style='float:left'><label>时间:</label><input id='execute_time_e' name='iteme["+examCount+"].executeTime' type='text' size='20' class='required' onclick='WdatePicker({isShowClear:false,readOnly:true})'/><label>检查项目:</label><select name='iteme["+ examCount +"].subject' id='exam_subject' onchange='resetSubItem(this,\"exam\")'>"+ examOptions +"</select><input type='button' onclick='addExamResult(this,examCount)' value='检查小项'/></div><div style='margin-left:20px;float:left' id='sub_exam'></div><div style='clear:both'></div></div>");
			countMap['exam'+examCount]=0;
		}
		function addDiag() {
			$("#diag").append("<div><input style='float:left' type='button' value='删除' onclick='removeThisItemLine(this)'/><div style='float:left'><label>时间:</label><input name='diag["+ diagCount +"].diagnosis_date' type='text' size='20' class='required' onclick='WdatePicker({isShowClear:false,readOnly:true})'/><label>诊断结果:</label><select id='diag_subject' onchange='resetSubItem(this,\"diag\")'>"+ diagOptions +"</select><input type='button' onclick='addDiagResult(this)' value='诊断小项'/></div><div style='margin-left:20px;float:left' id='sub_diag'></div><div style='clear:both'></div></div>");
		}
		/*添加新带药*/
		function addDrug() {
			$("#drug").append("<div><input style='float:left' type='button' value='删除' onclick='removeThisItemLine(this)'/><div style='float:left'><label>药名:</label><select name='drug["+ drugCount +"].DRUG_NAME' id='drug_list' >"+ drugOptions +"</select><select name='drug["+ drugCount +"].ADMINISTRATION'><option value='口服'>口服</option><option value='外用'>外用</option></select><input type='text' size='10' class='required' name='drug["+ drugCount +"].DOSAGE'/><select name='drug["+ drugCount +"].DOSAGE_UNITS'><option value='支'>支</option><option value='片'>片</option><option value='袋'>袋</option><option value='粒'>粒</option><option value='适量'>适量</option><option value='mg'>mg</option></select><select name='drug["+ drugCount +"].FREQUENCY'><option value='1/日'>1/日</option><option value='2/日'>2/日</option><option value='3/日'>3/日</option><option value='1/晚'>1/晚</option><option value='即刻'>即刻</option><option value='必要时'>必要时</option><option value='1/隔日'>1/隔日</option></select></div><div style='clear:both'></div></div>");
			drugCount++;
		}
		/*获取所有检验\检查\诊断大项*/
		function getAllDict() {
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_queryDictInfo.action',
				type:'post',
				dataType:'json',
				success:generateSubject
			});
		}
		/*获取检验大小项回调函数*/
		function generateSubject(data) {
			dictList = data.dictList;
			for(var x in dictList) {
				if(dictList[x].elFlag.indexOf("检验")!=-1) {
					labOptions += "<option value='"+dictList[x].dictName+"_"+x +"'>"+ dictList[x].dictName +"</option>";
				} else if(dictList[x].elFlag.indexOf("检查")!=-1) {
					examOptions += "<option value='"+dictList[x].dictName+"_"+x +"'>"+ dictList[x].dictName +"</option>";
				} else if(dictList[x].elFlag.indexOf("诊断信息")!=-1) {
					diagOptions += "<option value='"+dictList[x].dictName+"_"+x +"'>"+dictList[x].dictName +"</option>";
				}
			}
		}
		function getAllDrug() {
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_queryAllDrug.action',
				type:'post',
				dataType:'json',
				success:generateDrug
			});
		}
		function generateDrug(data) {
			newDrug = data.drugList;
			for(var x in newDrug) {
				var drugname = newDrug[x].DRUG_NAME;
				var packagespec = newDrug[x].PACKAGE_SPEC;
				var packageunits = newDrug[x].PACKAGE_UNITS;
				drugOptions += "<option value='"+drugname+"'>"+ drugname +"("+packagespec+" "+ packageunits +")</option>";	
			}
		}
		/*生成检验小项和结果输入框*/
		function addTestResult(obj, tc) {
			var optionSelectedIndex = $(obj).parent().find("#test_subject>option:selected").attr("value");
			optionSelectedIndex = optionSelectedIndex.substr(optionSelectedIndex.indexOf("_")+1);
			var subDictList = dictList[optionSelectedIndex].subDict;
			var subTestLine = $(obj).parent().next("#sub_test");
			var subTestLineHtml = "<div><input style='float:left' type='button' value='删除' onclick='removeThisItemLine(this)'/><label>检验项:</label><select name='item["+ tc +"].subItemList["+ countMap['test'+tc] +"].reportItemName' >";
			for(var x in subDictList) {
				subTestLineHtml += "<option value="+ subDictList[x].dictName +">"+ subDictList[x].dictName +"   (单位"+ subDictList[x].unit +")</option>";
			}
			subTestLineHtml += "</select><label>值:</label><input class='required' name='item["+tc+"].subItemList["+ countMap['test'+tc] +"].result' type='text'/></div>";
			subTestLine.append(subTestLineHtml);
			countMap['test'+tc]++;
			
		}
		/*生成检查小项和结果输入框*/
		function addExamResult(obj, ec) {
			var optionSelectedIndex = $(obj).parent().find("#exam_subject>option:selected").attr("value");
			optionSelectedIndex = optionSelectedIndex.substr(optionSelectedIndex.indexOf("_")+1);
			var subDictList = dictList[optionSelectedIndex].subDict;
			var subExamLine = $(obj).parent().next("#sub_exam");
			var subExamLineHtml = "<div><input style='float:left' type='button' value='删除' onclick='removeThisItemLine(this)'/><label>检查项:</label><select name='iteme["+ ec +"].subItemList["+ countMap['exam'+ec] +"].reportItemName'>";
			for(var x in subDictList) {
				subExamLineHtml += "<option value="+ subDictList[x].dictName +">"+ subDictList[x].dictName +"</option>";
			}
			subExamLineHtml += "</select><label>值:</label><input type='text' class='required' name='iteme["+ ec +"].subItemList["+ countMap['exam'+ec] +"].result'/></div>";
			subExamLine.append(subExamLineHtml);
			countMap['exam'+ec]++;
		}
		/*生成诊断结果输入框*/
		function addDiagResult(obj) {
			var optionSelectedIndex = $(obj).parent().find("#diag_subject>option:selected").attr("value");
			var diagSubject = optionSelectedIndex.substr(0, optionSelectedIndex.indexOf("_"));
			optionSelectedIndex = optionSelectedIndex.substr(optionSelectedIndex.indexOf("_")+1);
			var subDictList = dictList[optionSelectedIndex].subDict;
			var subDiagLine = $(obj).parent().next("#sub_diag");
			var subDiagLineHtml = "<div><input value='"+ diagSubject +"' type='hidden' name='diag[" +diagCount +"].subject'/><input style='float:left' type='button' value='删除' onclick='removeThisItemLine(this)'/><label>诊断项:</label><select name='diag[" +diagCount +"].diagnosis_desc'>";
			for(var x in subDictList) {
				subDiagLineHtml += "<option value="+ subDictList[x].dictName +">"+ subDictList[x].dictName +"</option>";
			}
			subDiagLineHtml += "</select><label>值:</label><input type='text' class='required' name='diag["+ diagCount +"].diagnosis_value'/></div>";
			subDiagLine.append(subDiagLineHtml);
			diagCount++;
		}
		function resetSubItem(obj,type) {
			$(obj).parent().next().html("");
		}
		//用于设置导航栏的显示状态
   		function fNavStatusToggle(){
   			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
   		}
		/*移除item*/
		function removeThisItemLine(obj) {
			$(obj).parent().html();
			$(obj).parent().remove();
		}
		function submit() {
			$("#commonForm").submit();
		}
		function reset() {
			window.location.reload();
		}
		function autoSelectName(key) {
			resetForm();
			resetOtherForm();
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
			        	var name = str.substring(0,str.indexOf("-"));
			        	var id = str.substring(str.indexOf("-")+1);
			           	$("#patName").val(name);
			           	$("#patientId").val(id);
			           	$("#patientIdH").val(id);
			           	hideTips();
			           	autoBasicInof(id);
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
		function autoBasicInof(patientId){
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_queryPatient.action',
				type:'post',
				dataType:'json',
				data:{patientId:patientId},
				success:function(result) {
					generatePatientInfo(patientId,result.patient);
				}
			});
		}
		function autoVisitInfo(patientId) {
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_queryVisit.action',
				type:'post',
				dataType:'json',
				data:{patientId:patientId},
				success:function(result) {
					generateVisitInfo(result.visitList);
				}
			});
		}
		function autoVisitOther() {
			var x = document.getElementById("visitId").options.selectedIndex;
			if(visitList[x]!=null) {
				$("#deptDischargeFrom").val(visitList[x].deptDischargeFrom);
				$("#attendingDoctor").val(visitList[x].attendingDoctor);
				$("#admissionDateTime").val(visitList[x].admissionDateTime);
				$("#patientClass").val(visitList[x].patientClass);
				$("#admissionCause").val(visitList[x].admissionCause);
				$("#consultingDoctor").val(visitList[x].consultingDoctor);
			}
		}
		function generateVisitInfo(data) {
			if(data!=null&&data.length>0) {
				$("#visitId").html("");
				var option = "";
				for(var x in data) {
					if(data[x]){
						option += "<option value='"+ data[x].visitId +"'>"+ data[x].visitId +"</option>";
					}
				}
				$("#visitId").html(option);
				visitList = data;
				autoVisitOther();
			}
		}
		function resetOtherForm() {
			$("#deptDischargeFrom").val("");
			$("#attendingDoctor").val("");
			$("#admissionDateTime").val("");
			$("#patientClass").val("");
			$("#admissionCause").val("");
			$("#consultingDoctor").val("");
		}
		function resetForm() {
			$("#sex").val("");
			$("#birthday").val("");
			$("#maritalStatus").val("");
			$("#nation").val("");
			$("#identity").val("");
			$("#chargeType").val("");
			$("#mailAddress").val("");
			$("#zipCode").val("");
			$("#phoneNumberHome").val("");
			$("#phoneNumberBussness").val("");
			$("#nextOfKin").val("");
			$("#nextOfKinAddr").val("");
			$("#nextOfKinPhone").val("");
		}
		function generatePatientInfo(patientId, data) {
			$("#sex").val(data.sex);
			$("#birthday").val(data.birthday);
			$("#maritalStatus").val(data.maritalStatus);
			$("#nation").val(data.nation);
			$("#identity").val(data.identity);
			$("#chargeType").val(data.chargeType);
			$("#mailAddress").val(data.mailAddress);
			$("#zipCode").val(data.zipCode);
			$("#phoneNumberHome").val(data.phoneNumberHome);
			$("#phoneNumberBussness").val(data.phoneNumberBussness);
			$("#nextOfKin").val(data.nextOfKin);
			$("#nextOfKinAddr").val(data.nextOfKinAddr);
			$("#nextOfKinPhone").val(data.nextOfKinPhone);
			autoVisitInfo(patientId);
		}
		function hideTips(obj){
			$("#autoTips").css("display","none");
		}
		</script>
</body>
</html>
