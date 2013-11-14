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
		<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
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
			<div class="detail" style="width: 350px; float: left;margin-top:20px">
				<div class="alert fade in">
					<a class="close" data-dismiss="alert" href="#">×</a>
					<strong>搜索功能说明</strong>
					<p>
						1、属性字段表示当前根据那个字段查询。
					</p>
					<p>
						2、运算符表示在查询时根据指定类型来进行关键的匹配，如：等于（姓名="XXX"）。
					</p>
					<p>
						3、值表示您想要搜索的内容（注意：在输入时请按照指定类型，如：数字类型则只能输入数字）。
					</p>
					<p>
						4、关系表示如果查询时需要多个查询条件，则需要选择。（逻辑或：表示查询条件之间是或的关系只要有一个满足就可以，
						逻辑与：表示查询条件之间是与的关系必须所有条件都满足方能查出）。
					</p>
					<p>
						5、如果想删除某条查询条件则只需将此条件的上一条的关系设置为空即可（注意：但某条条件的关系为空时，那么处于他以下的所有条件都将删除）。
					</p>
					<p>
						6、查询并保存操作将会保存当前设置的查询条件，此次保存后将会在下次进入查询（或者执行刷新）时显示在我的查询条件中.
					</p>
				</div>
			</div>
			<div class="searchPanal" style="float: left; width: 70%">
				<table class="table table-bordered" style="padding-bottom:20px">
					<thead>
						<tr>
							<th>
								序号
							</th>
							<th>
								姓名
							</th>
							<th>
								用户名
							</th>
							<th>
								帐号状态
							</th>
							<th>
								用户角色
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="userList" id="doctor" status="index">
							<tr id="<s:property value="#doctor.userId" />"
								info='{id:"<s:property value="#doctor.userId" />", name:"<s:property value="#doctor.name" />",username:"<s:property value="#doctor.username" />",password:"<s:property value="#doctor.password" />",status: "<s:property value="#doctor.status" />"}'>
								<td>
									<s:property value="#index.index + 1" />
								</td>
								<td>
									<s:property value="#doctor.name" />
								</td>
								<td>
									<s:property value="#doctor.username" />
								</td>
								<td>
									<s:property value="#doctor.status == 0 ? '可用' : '不可用'" />
								</td>
								<td>
									<s:property value="#doctor.role" />
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
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
			<!-- 删除提示框 -->
			<div id="myModal" class="modal hide fade" style="display: none;">
				<div class="modal-header">
					<a class="close" data-dismiss="modal">×</a>
					<h3>
						系统提示消息
					</h3>
				</div>
				<div class="modal-body">
					<p>
						你确定删除选择项么？
					</p>
				</div>
				<div class="modal-footer">
					<a href="#" class="btn" data-dismiss="modal">取消</a>
					<a href="javascript: fDelete()" class="btn btn-primary">确定</a>
				</div>
			</div>
			<form action="admin/userAction_deleteUser.action" name="deleteForm"
				method="post">
				<input type="hidden" id="ids" name="ids" value="">
			</form>

			<!-- 修改弹出框 -->
			<div id="myModalUpdateAdd" class="modal hide fade"
				style="display: none;">
				<div class="modal-header">
					<a class="close" data-dismiss="modal">×</a>
					<h3>
						系统提示消息
					</h3>
				</div>
				<div class="modal-body">
					<div class="detail" style="display: none">
						<div class="alert fade in">
							<a class="close" href="javascript: fError('out')">×</a>
							<div id="formValidatorError"></div>
						</div>
					</div>
					<form action="admin/userAction_update" name="updateAddForm"	method="POST">
						<input type="hidden" name="user.userId" id="id" value="">
						<label for="name">
							姓名：
						</label>
						<input type="text" id="name" name="user.name" value="" />
						<label for="username">
							用户名：
						</label>
						<input type="text" id="username" name="user.username" value="" />
						<br />
						<label for="password">
							密 码：
						</label>
						<input type="password" name="user.password" id="password"
							maxlength="16" value="">
					</form>
				</div>
				<div class="modal-footer">
					<a href="#" class="btn" data-dismiss="modal">取消</a>
					<a href="javascript:fValidator()" class="btn btn-primary">确定</a>
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
					<a class="win-command" data-toggle="modal"
						onclick="fSetVal(null, 'add')"> <span
						class="win-commandimage PNG-Add"></span> <span class="win-label">添加</span>
					</a>
					<a class="win-command" data-toggle="modal"
						onclick="fSetUpdateVal()"> <span
						class="PNG-Edit win-commandimage"></span> <span class="win-label">编辑</span>
					</a>
					<a class="win-command" data-toggle="modal" href="#myModal"> <span
						class="win-commandimage PNG-Delete"></span> <span
						class="win-label">删除</span> </a>
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

	//用于删除
	function fDelete() {
		var ids = $("#ids"), val = ids.val();
		for ( var o in keyTr.obj) {
			val = val ? val + "," : val;
			val += keyTr.obj[o].attr("id");
			ids.val(val);
		}
		if (val)
			document.deleteForm.submit();
	}

	//用于修改
	function fSetUpdateVal() {
		for ( var o in keyTr.obj) {
			var info = eval("(" + keyTr.obj[o].attr("info") + ")");
			fSetVal(info);
			return;
		}
	}

	//type指当前表单提交为 添加 还是 修改
	function fSetVal(obj, type) {
		obj = obj || {
			id : "",
			name : "",
			username : "",
			password : "",
			role : "ROLE_ADMIN",
			status : "true"
		};
		$("#id").val(obj.id);
		$("#name").val(obj.name);
		$("#username").val(obj.username);
		$("#password").val(obj.password);
		if (type && type == "add")
			document.updateAddForm.action = "admin/userAction_addUser.action?isFirstSerachFlag=1";
		else
			document.updateAddForm.action = "admin/userAction_updateUser.action?isFirstSerachFlag=1";
		$("#myModalUpdateAdd").modal("show");
	}

	//检验表单是否完整
	function fValidator() {
		if (!!!validator)
			validator = new FormValidator("formValidatorError", {
				fieldId : 'name',
				fieldName : '\'医生姓名\'',
				rules : 'required'
			}, {
				fieldId : 'username',
				fieldName : '\'用户名\'',
				rules : 'required'
			}, {
				fieldId : 'password',
				fieldName : '\'密码\'',
				rules : 'required'
			}, fError, function() {
				document.updateAddForm.submit();
			});
		validator.validator();
	}

	function fError(type) {
		if (type)
			$(".detail").fadeOut();
		else
			$(".detail").fadeIn();
	}
	function fastSearch(){
		$("#fsmyModal").modal("show");
	}
	function submitSearch(){
		$("#fsmyModal").modal("hide");
		document.fastSearchForm.submit();
	}
</script>
	</body>
</html>