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
						<li class="nav"><a href="pages/detailInfo/patient_vis_add.jsp" class="selected">病人住院信息</a></li>
						<li class="nav"><a href="pages/detailInfo/patient_ted_add.jsp">检查\检验\诊断\带药</a></li>
						<li class="nav"><a href="template/template_index.action">Excel导入</a></li>
					</ul>
           		</div>
         	 </div>
		</div>
		<div class="searchPanal" style="float:left;width:75%;" onclick="hideTips()">
			<form action="search/patient_s_addPatientVisitInfo.action" method="post" id="commonForm">
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:36px;font-size:16px;background-color: #eee">基本信息</label>
			<div id="basicInfo" class="searchbar" style="margin-top:20px">
				<div id="col1" style="width:33%;float:left">
					<div style="position: relative;" onblur="hideTips()">
						<label for="patient.patientName">姓名：</label>
						<input autocomplete="off" type="text" id="patName" onkeyup="autoSelectName(this.value)" class="required" name="patient.patientName" id="patientName" />
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
						<input disabled="disabled" class="inputdiv"  type="text" id="nation"/>
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
							<input disabled="disabled" type="text" class="inputdiv" name="patient.mailAddress" id="mailAddress" class="required"/>
						</div>
						<div>
						<label for="zipCode">邮政编码:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="zipCode" name="patient.zipCode" class="required"/>
						</div>
					</div>
					<div id="col2" style="width:33%;float:left">
						<div>
							<label for="phoneNumberHome">家庭电话:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="phoneNumberHome" name="patient.phoneNumberHome" class="required"/>
						</div>
						<div>
						<label for="phoneNumberBussness">常用电话:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="phoneNumberBussness" name="patient.phoneNumberBussness" class="required"/>
						</div>
						<div>
						<label for="nextOfKin">紧急联系人:</label>
							<input disabled="disabled" class="inputdiv" type="text" id="nextOfKin" name="patient.nextOfKin" class="required"/>
						</div>
						<div>
						<label for="nextOfKinAddr">联系人地址:</label>
							<input disabled="disabled" class="inputdiv" type="text" class="required" id="nextOfKinAddr" name="patient.nextOfKinAddr"/>
						</div>
						<div>
							<label for="nextOfKinPhone">联系人电话:</label>
								<input disabled="disabled" class="inputdiv" type="text" class="required" id="nextOfKinPhone" name="patient.nextOfKinPhone"/>
						</div>
					</div>
				<div style="clear:both"></div>
			</div>
			<div style="clear: both;"></div>
			<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:20px;font-size:16px;background-color: #eee">住院信息</label>
			<div id="patient_visit" class="searchbar">
					<div id="visit">
						<div id='vcol1' style='width:32%;float:left'>
							<div>
								<label for='visitId'>*病次:</label>
								<input name='visit.visitId' id='visitId' class='required' type='text'>
							</div>
							<div>
								<label>住院科室:</label>
									<select name="visit.deptDischargeFrom">
										<optgroup label='心研所'>
											<option>一病区</option>
											<option>二病区</option>
											<option>三病区</option>
											<option>监护室</option>
										</optgroup>
										<optgroup label='心血管内科'>
											<option>一病区</option>
											<option>二病区</option>
											<option>三病区</option>
											<option>监护室</option>
										</optgroup>
										</select>
							</div>
							<div>
								<label for='attendingDoctor'>*治疗医师:</label>
								<input type='text' id="attendingDoctor" name="visit.attendingDoctor" class='required'/>
							</div>
						</div>
						<div id='vcol2' style='width:34%;float:left'>
							<div>
								<label for='admissionDateTime'>*住院日期:</label>
								<input class='required' name='visit.admissionDateTime' id='admissionDateTime' type='text' size='20' onclick='WdatePicker({isShowClear:false,readOnly:true})'/>
							</div>
							<div>
								<label>病人类型:</label>
								<select name="visit.patientClass">
									<option value="1">1</option><option value="2">2</option><option value="3">3</option></select>
							</div>
						</div>
						<div id='vcol3' style='width:33%;float:left'>
							<div>
								<label>入院目的:</label>
								<select name="visit.admissionCause">
									<option value="治疗">治疗</option><option value="其他">其他</option>
								</select>
							</div>
							<div>
								<label for='consultingDoctor'>*主治医师</label>
								<input type='text' name='visit.consultingDoctor' id='consultingDoctor' class='required'/>
							</div>
						</div>
						<div style='clear:both'></div>
					</div>
			</div>
			<div style="clear: both;"></div>
			<div style="padding-bottom:200px;margin-top:20px;float:right">
				<a href="javascript: submit()" class="btn btn-primary">确定</a>
				<a href="javascript: reset()" class="btn">重置</a>
			</div>
			</form>
		</div>

		<!-- 快速查询提示框 -->
		<div id="selectNameModel" class="modal hide fade" style="display: none; ">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>快速查找病人</h3>
			</div>
			<div class="modal-body">
				<label>病人ID：</label> <input type="text" value="" name="patientId" />
				<input type="hidden" value="1" name="isFirstSerachFlag" />
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">取消</a> <a
					href="javascript: submitSearch()" class="btn btn-primary">确定</a>
			</div>
		</div>
		<div id="selectIdModel" class="modal hide fade" style="display: none; ">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>快速查找病人</h3>
			</div>
			<div class="modal-body">
				<label>病人ID：</label> <input type="text" value="" name="patientId" />
				<input type="hidden" value="1" name="isFirstSerachFlag" />
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
		function autoSelectName(key) {
			resetForm();
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
					generatePatientInfo(result.patient);
				}
			});
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
		function generatePatientInfo(data) {
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
			
		}
		function hideTips(obj){
			$("#autoTips").css("display","none");
		}
		</script>
</body>
</html>
