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
html,body,div,table{
		font-family:"微软雅黑"
	}
	.nav{
	list-style-type: none;
	font-size:14px
}
.nav a{
	text-align:center;
	width:200px;
	margin:auto;
	vertical-align:middle;
	display: block;
	padding:10px 0px;
	color:#c09853;
	font-weight:bold;
	padding-left:10px;
}
.nav .selected {
	background-color: #fbeed5
}
.nav a:hover {
	background-color: #fbeed5
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
	<div style="height:30px;background-color:#666;position:fixed;top:0px;width:100%;z-index:100;">
		<div style="margin-left:20px;z-index:101;color:#fff;padding-top:7px;font-size:14px">
			当前位置&nbsp;:&nbsp;精确检索<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div>
		</div>
	</div>
	<section style="padding-top: 10px; padding-left: 20px;">
			<div class="detail" style="margin-right:20px;width: 290px; float: left;margin-top:20px">
				<div class="alert fade in" style="padding-bottom:25px;margin-top:20px">
					<a class="close" data-dismiss="alert" href="#">×</a>
					<div style="margin-top:20px">
           			<div class="top_menu">
           				<div style="background-color:#fbeedb;font-size:15px;font-weight:bold;padding:10px 22px;float:left;border-radius:10px 0px 0px 10px;border-right:1px solid #c09853"><a href="pages/detailInfo/patient_add.jsp">创建病例</a></div>
           				<div style="background-color:#c09853;;font-size:15px;font-weight:bold;padding:10px 22px;float:left;border-radius:0px 10px 10px 0px"><a href="search/patient_findPatientPager.action" style="color:white">修改病例</a></div>
           				<div style="clear:both"></div>
           			</div>
           			<ul>
						<li class="nav"><a href="search/patient_findPatientPager.action" class="selected">病人列表</a></li>
						<li class="nav"><a href="search/patient_findVisitPager.action">病次列表</a></li>
						<li class="nav"><a href="search/patient_findDiagItemPager.action">诊断列表</a></li>
					</ul>
           		</div>
				</div>
			</div>
			<div class="searchPanal" style="float: left; width: 75%;margin-top:20px">
				<label style="padding-left:10px;padding-right:10px;position: relative;left:20px;top:19px;font-size:16px;background-color: #eee">快速检索</label>
				<div class="searchbar">
					<div>
					<form action="search/patient_findPatientPager.action" id="searchForm">
						<label style="font-weight:bold">姓名:</label>&nbsp;<input type="text" value="${patient.patientName}" name="patient.patientName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label style="font-weight:bold">性别:</label>&nbsp;<input type="text" value="${patient.sex}" name="patient.sex"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label style="font-weight:bold">ID号:</label>&nbsp;<input type="text" value="${patient.patientId}" name="patient.patientId"/>
						<div style="float:right">
							<a href="javascript: submit()" class="btn btn-primary">查询</a>
							<a href="javascript: reset()" class="btn">重置</a>
						</div>
					</form>
					</div>
				</div>
				<table class="table table-bordered" style="padding-bottom:20px">
					<thead>
						<tr>
							<th>
								序号
							</th>
							<th>
								ID
							</th>
							<th>
								姓名
							</th>
							<th>
								性别
							</th>
							<th>
								缴费类型
							</th>
							<th>
								出生日期
							</th>
							<th>
								创建日期
							</th>
							<th>
								联系电话
							</th>
							<th>
								操作员
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="patList" id="patient" status="index">
							<tr>
								<td>
									<s:property value="page.rowFrom+#index.index + 1" />
								</td>
								<td>
									<s:property value="#patient.patientId" />
								</td>
								<td>
									<s:property value="#patient.patientName" />
								</td>
								<td>
									<s:property value="#patient.sex" />
								</td>
								<td>
									<s:property value="#patient.chargeType" />
								</td>
								<td>
									<s:date format="yyyy-MM-dd" name="#patient.birthday"/>
								</td>
								<td>
									<s:property value="#patient.createDate" />
								</td>
								<td>
									<s:property value="#patient.phoneNumberHome" />
								</td>
								<td>
									<s:property value="#patient.operatorName" />
								</td>
								<td>
									<img src="resources/imgs/delete.png" style="cursor:pointer;margin:0px;padding:0px;width:15px;height:15px" onclick="deleteConfirm('<s:property value='#patient.patientId'/>','<s:property value="#patient.patientName" />')"/>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div style="float:left;margin-left:400px">
					<div>
						<div style="float:right;padding:8px 15px;background-color: #0055cc;font-size:13px;color:#ffffff;border-radius:0px 5px 5px 0px;cursor: pointer;" onclick="window.location.href='search/patient_findPatientPagerV.action'">视图</div>
						<div style="float:right;padding:8px 15px;background-color: #ffffff;font-size:13px;color:#0055cc;border-radius:5px 0px 0px 5px;cursor: pointer;" onclick="window.location.href='search/patient_findPatientPager.action'">列表</div>
					</div>
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
         <!-- 确认删除框-->
         <div id="dmyModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>确认删除</h3>
            </div>
            <div class="modal-body">
            	<form id="fastDeleteForm" action="search/patient_deletePatientAllInfo.action" method="post">
            		确认删除<span id="patientInfo"></span>？
            		<input type="hidden" id="pid" name="patientId"/>
            	</form>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: submitDelete()" class="btn btn-primary">确定</a>
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
					<p:pager page="${page}" />
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
		<script type="text/javascript">
	var keyTr = {
		ctrlDown : false,
		obj : {}
	}, //用于判断是否按下ctrl键，以及存储以选择行对象
	validator = null; //表单检验对象
	$(document).ready(function() {
		$(".table>tbody>tr:odd").each(function() {
			$(this).addClass("tr-bgcolor");
		});
		$("body").keydown(function(event) {
			var e = e || event, currKey = e.keyCode || e.which || e.charCode;
			if (currKey == 17)
				keyTr.ctrlDown = true;
		}).keyup(function(event) {
			var e = e || event, currKey = e.keyCode || e.which || e.charCode;
			if (currKey == 17)
				keyTr.ctrlDown = false;
		});
		$(".table>tbody").mouseover(function(event) {
			fTrBgColor(event, "mouseover");
		}).mouseout(function(event) {
			fTrBgColor(event, "mouseout");
		}).click(function(event) {
			fTrBgColor(event, "click", keyTr);
		});
	});

	//用于设置导航栏的显示状态
	function fNavStatusToggle() {
		$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
	}

	//用于改变行的背景色
	function fTrBgColor(event, type, keyTr) {
		var obj = $(event.target).parent(), isSelect = obj.attr("isselect");
		if (isSelect) {
			if ("click" == type) {
				obj.removeClass("tr-click");
				obj.removeClass("tr-hover");
				obj.removeAttr("isselect");
				delete keyTr.obj["id-" + obj.attr("id")];
			}
		} else {
			if ("click" == type) {
				obj.addClass("tr-click");
				obj.attr("isselect", true);
				//如果没有按Ctrl将已选行删除
				if (!!!keyTr.ctrlDown) {
					var o = keyTr.obj;
					for ( var p in o) {
						var tr = o[p];
						tr.removeClass("tr-click");
						tr.removeClass("tr-hover");
						tr.removeAttr("isselect");
						delete o[p];
					}
				}
				keyTr.obj["id-" + obj.attr("id")] = obj;
			} else if ("mouseover" == type)
				obj.addClass("tr-hover");
			else if ("mouseout" == type)
				obj.removeClass("tr-hover");
		}
		event.stopPropagation();
	}
	function submit(){
		$("#searchForm").submit();
	}
	function reset() {
		window.location.href = "search/patient_findPatientPager.action";
	}
	function fastSearch(){
		$("#fsmyModal").modal("show");
	}
	function deleteConfirm(patientId,patientName) {
		$("#patientInfo").html(patientId+" "+patientName);
		$("#pid").val(patientId);
		$("#dmyModal").modal("show");
	}
	function submitDelete() {
		$("#fastDeleteForm").submit();
	}
</script>
	</body>
</html>