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
<link rel="stylesheet" type="text/css"
	href="resources/css/commandIcon.css">
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
#basicInfo label { width:75px;font-weight:bold }
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
						<li class="nav"><a href="pages/detailInfo/patient_basic_add.jsp"  class="selected">病人基本信息</a></li>
						<li class="nav"><a href="pages/detailInfo/patient_vis_add.jsp">病人住院信息</a></li>
						<li class="nav"><a href="pages/detailInfo/patient_ted_add.jsp">检查\检验\诊断\带药</a></li>
						<li class="nav"><a href="template/template_index.action">Excel导入</a></li>
					</ul>
           		</div>
         	 </div>
		</div>
		<div class="searchPanal" style="float:left;width:75%;">
			<form action="search/patient_s_addPatientBasicInfo.action" method="post" id="commonForm">
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:36px;font-size:16px;background-color: #eee">基本信息</label>
			<div id="basicInfo" class="searchbar" style="margin-top:20px">
				<div id="col1" style="width:33%;float:left">
					<div>
						<label for="patient.patientName">*姓名：</label>
						<input type="text" class="required" name="patient.patientName" id="patientName"/>
					</div>
					<div>
						<label for="patientId">*ID：</label>
						<input type="text" class="required" id="patientId" name="patient.patientId"/>
					</div>
					<div>
						<label for="sex">*性别：</label>
							<select name="patient.sex">
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
					</div>
					<div>
						<label for="birthday">*出生日期:</label>
						<input id="birthday" name="patient.birthday" type='text' size='20' class="required" onclick="WdatePicker({isShowClear:false,readOnly:true})"/>
					</div>
					<div>
					<label>婚否:</label>
						<select name="patient.maritalStatus">
							<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
							<option value="丧偶">丧偶</option>
						</select>
					</div>
					</div>
					<div id="col3" style="width:32%;float:left">
						<div>
						<label>民族:</label>
							<select name="patient.nation">
								<option value="汉族">汉族</option>
								<option value="其他">其他</option>
							</select>
						</div>
						<div>
						<label>病人类型:</label>
							<select name="patient.identity">
								<option value="一般人员">一般人员</option>
								<option value="免费家属">免费家属</option>
								<option value="司局级干部">司局级干部</option>
								<option value="师职干部">师职干部</option>
							</select>
						</div>
						<div>
						<label>缴费类型:</label>
							<select name="patient.chargeType">
								<option value="全费">全费</option>
								<option value="军队医改">军队医改</option>
							</select>
						</div>
						<div>
							<label for="mailAddress">*通信地址:</label>
							<input type="text" name="patient.mailAddress" id="mailAddress" class="required"/>
						</div>
						<div>
						<label for="zipCode">邮政编码:</label>
							<input type="text" id="zipCode" name="patient.zipCode"/>
						</div>
					</div>
					<div id="col2" style="width:34%;float:left">
						<div>
							<label for="phoneNumberHome">家庭电话:</label>
							<input type="text" id="phoneNumberHome" name="patient.phoneNumberHome"/>
						</div>
						<div>
						<label for="phoneNumberBussness">*常用电话:</label>
							<input type="text" id="phoneNumberBussness" name="patient.phoneNumberBussness" class="required"/>
						</div>
						<div>
						<label for="nextOfKin">*紧急联系人:</label>
							<input type="text" id="nextOfKin" name="patient.nextOfKin" class="required"/>
						</div>
						<div>
						<label for="nextOfKinAddr">联系人地址:</label>
							<input type="text" id="nextOfKinAddr" name="patient.nextOfKinAddr"/>
						</div>
						<div>
							<label for="nextOfKinPhone">*联系人电话:</label>
								<input type="text" class="required" id="nextOfKinPhone" name="patient.nextOfKinPhone"/>
						</div>
					</div>
				<div style="clear:both"></div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div style="padding-bottom:200px;margin-top:20px;float:right">
				<a href="javascript: submit()" class="btn btn-primary">确定</a>
				<a href="javascript: reset()" class="btn">重置</a>
			</div>
			</form>
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

		<script type="text/javascript" src="scripts/jquery.js"></script>
		<script type="text/javascript" src="scripts/commonUtil.js"></script>
		<script type="text/javascript" src="scripts/jquery.validate.js"></script>
		<script type="text/javascript" src="scripts/jquery.metadata.js"></script>
		<script type="text/javascript" src="scripts/cmxforms.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/date/WdatePicker.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#commonForm").validate();
		});
		//用于设置导航栏的显示状态
   		function fNavStatusToggle(){
   			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
   		}
		function submit() {
			$("#commonForm").submit();
		}
		function reset() {
			window.location.reload();
		}
		</script>
</body>
</html>
