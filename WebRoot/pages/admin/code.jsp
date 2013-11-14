<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="cn.ac.big.dp.bean.*" %>
<%@ taglib uri="/myTagLib" prefix="p"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科临床信息管理系统---代码管理</title>
<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}'/>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
<style type="text/css">
	select{width: 172px;}
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
		<div class="detail" style="width:350px;float:left;margin-top:20px">
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
           			4、关系表示如果查询时需要多个查询条件，则需要选择。（逻辑或：表示查询条件之间是或的关系只要有一个满足就可以， 逻辑与：表示查询条件之间是与的关系必须所有条件都满足方能查出）。
           		</p>
           		<p>
           			5、如果想删除某条查询条件则只需将此条件的上一条的关系设置为空即可（注意：但某条条件的关系为空时，那么处于他以下的所有条件都将删除）。
           		</p>
           		<p>
           			6、查询并保存操作将会保存当前设置的查询条件，此次保存后将会在下次进入查询（或者执行刷新）时显示在我的查询条件中.
           		</p>
         	 </div>
		</div>
		<div class="searchPanal" style="float:left;width:70%">
		<table id="code" class="table table-bordered" style="padding-bottom:20px">
			<thead>
				<tr>
					<th>序号</th>
					<th>代码名称</th>
					<th>代码描述</th>
					<th>条件类型</th>
					<th>是否可用</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="dictList" id="code" status="index">
					<tr id="<s:property value="#code.dictId" />" info='{dictId:"<s:property value='#code.dictId'/>",dictName:"<s:property value='#code.dictName'/>",dictNameEn:"<s:property value='#code.dictNameEn'/>",status:"<s:property value='#code.status'/>"}'>
						<td><s:property value="page.rowFrom+#index.index + 1" /></td>
						<td><s:property value="#code.dictName" /></td>
						<td><s:property value="#code.dictNameEn" /></td>
						<td><s:property value="#code.type" /></td>
						<td><s:if test="#code.status==1">可用</s:if><s:else>不可用</s:else></td>
						<td><a href="javascript: fShowInfo('<s:property value="#code.dictId" />','<s:property value="#code.dictName" />')">查看详情</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		</div>
		
		<!-- 删除提示框 -->
		<div id="myModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>系统提示消息</h3>
            </div>
            <div class="modal-body">
            	<p>你确定删除选择项么？</p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: fDelete()" class="btn btn-primary">确定</a>
            </div>
         </div>
         <form action="actions/codeAction_delete" name="deleteForm" method="post">
         	<input type="hidden" id="ids" name="ids" value="" >
         </form>
         
         <!-- 修改弹出框1 -->
         <div id="myModalUpdateAdd" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>系统消息</h3>
            </div>
            <div class="modal-body">
            	<form action="admin/codeAction_updateDict.action" name="updateAddForm" method="POST">
            		<div id="codeError" class="detail" style="display: none">
						<div class="alert fade in">
			           		<a class="close" href="javascript: fError('out')">×</a>
			           		<div id="formValidatorError"></div>         		
			         	</div>
					</div>
            		<input type="hidden" name="dict.dictId" id="m_id" value="">
            		<label for="name">编码名称：</label><input type="text" id="m_name" name="dict.dictName" autofocus="autofocus" required="required" placeholder="例如: Code_fmfs" />
            		<label for="detail">编码描述：</label><input type="text" id="m_detail" name="dict.dictNameEn" required="required" placeholder="请输入编码描述"/><br/>
            		<label for="detail">状态：</label><select id="m_status" name="dict.status" ><option value="1">可用</option><option value="0">不可用</option></select><br/>
            	</form>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript:fCodeValidator()" class="btn btn-primary">确定</a>
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
         <!-- codeInfo操作 -->
         <div id="codeInfo" class="modal hide fade" style="display: none;width:70%;left:35%;top:300px" ">
         	<div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>代码详情</h3>
            </div>
            <div class="modal-body">
            	<table id="codeInfo" class="table table-bordered" style="padding-bottom: 0;">
					<thead>
						<tr>
							<th>序号</th>
							<th>代码名称</th>
							<th>代码描述</th>
							<th>单位</th>
							<th>是否可用</th>
							<th>显示</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
            </div>
            <div class="modal-footer">
            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	            	<a class="btn" href="javascript: fShowCodeInfoEdit()">编辑</a>
              	</sec:authorize>
             	<a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
         </div>
          <!-- 修改弹出框2 -->
         <div id="codeInfoUpdateAdd" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>系统消息</h3>
            </div>
            <div class="modal-body">
            	<div id="infoError" class="detail" style="display: none">
					<div class="alert fade in">
		           		<a class="close" href="javascript: fError('out','infoError')">×</a>
		           		<div id="formValidatorInfoError"></div>         		
		         	</div>
				</div>
           		<input type="hidden" name="dictId" id="infoId" value="">
           		<label for="name">名称：</label><input type="text" id="infoName" name="infoName" autofocus="autofocus" required="required" placeholder="请输入名称" />
           		<label for="unit">单位：</label><input type="text" id="infoUnit" name="infoUnit" autofocus="autofocus" required="required" placeholder="请输入单位" />
           		<input type="hidden" name="infoNameEn" id="infoNameEn" value=""/><br/>
           		<label for="detail">状态：</label><select id="infoStatus" name="infoStatus" ><option value="1">可用</option><option value="0">不可用</option></select>
           		<label for="display">显示：</label><select id="infoDisplayStatus" name="infoDisplayStatus" ><option value="1">显示</option><option value="0">隐藏</option></select><br/>
            </div>
            <div class="modal-footer">
              <a href="javascript:void 0" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript:void 0" class="btn btn-primary">确定</a>
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
      	<sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SA">
	         <a class="win-command" data-toggle="modal" onclick="fSetUpdateVal()">
	            <span class="PNG-Edit win-commandimage"></span>
	            <span class="win-label">编辑</span>
	         </a>
	      </sec:authorize>
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
   <script type="text/javascript">
   		var keyTr = {ctrlDown: false, obj: {}}, keyCodeInfoTr = {ctrlDown: false, obj: {}},//用于判断是否按下ctrl键，以及存储以选择行对象
   			codeValidator = null, infoValidator = null;
		$(document).ready(function(){
			$(".table>tbody>tr:odd").each(function(){
	   			$(this).addClass("tr-bgcolor");
	   		});
			$("body").keydown(function(event){
				var e=e||event, currKey=e.keyCode||e.which||e.charCode;
				if(currKey==17){
					keyTr.ctrlDown = true;
					keyCodeInfoTr.ctrlDown = true;
				}
			}).keyup(function(event){
				var e=e||event, currKey=e.keyCode||e.which||e.charCode;
				if(currKey==17){
					keyTr.ctrlDown = false;
					keyCodeInfoTr.ctrlDown = false;
				}
			});
			$(".table>tbody").mouseover(function(event){
				fTrBgColor(event, "mouseover");
			}).mouseout(function(event){
				fTrBgColor(event, "mouseout");
			});
			$("#code>tbody").click(function(event){
				fTrBgColor(event, "click", keyTr);
			});
			$("#codeInfo>tbody").click(function(event){
				fTrBgColor(event, "click", keyCodeInfoTr);
			});
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
		
		//用于删除
		function fDelete(){
			var ids = $("#ids"), val = ids.val();
			for(var o in keyTr.obj){
				val = val ? val + "," : val; 
				val += keyTr.obj[o].attr("id");
				ids.val(val);
			}
			if(val)
				document.deleteForm.submit();
		}
		
		//用于修改
		function fSetUpdateVal(){
			for(var o in keyTr.obj){
				var info = eval("("+keyTr.obj[o].attr("info")+")");
				fSetVal(info);
				return;
			}
		}
		
		//type指当前表单提交为 添加 还是 修改 用于code的添加 修改
		function fSetVal(obj){
			obj = obj || {id: "", name: "", detail: ""};
			$("#m_id").val(obj.dictId);
			$("#m_name").val(obj.dictName);
			$("#m_detail").val(obj.dictNameEn);
			setDefault("m_status", obj.status);
			$("#myModalUpdateAdd").modal("show");
		}
		
		function fShowInfo(id,name){
			var params = {dictId:id};
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_queryDictByPdId.action',
				type:'post',
				dataType:'json',
				data:params,
				success:processResult
			});
		}
	   	function processResult(data){
	   		var array = data.dictList;
	   		var table = $("#codeInfo>tbody"), tr = "";
	   		for(var i=0; i<array.length;i++){
				var o = array[i];
				var str = "{unit:\""+ o.unit +"\",dictId:\""+o.dictId+"\",dictName:\""+o.dictName +"\",dictNameEn:\""+o.dictNameEn+"\",status:\""+o.status+"\",displayFlag:\""+o.displayFlag+"\"}";
				tr += "<tr id="+o.dictId+" info="+str+"><td>"+(i+1)+"</td><td>"+o.dictName+"</td><td>"+o.dictNameEn+"</td><td>"+ o.unit +"</td><td>"+ o.status+"</td><td>"+ o.displayFlag+"</td></tr>";
			}
			table.html(tr);
			$("#codeInfo").modal("show");
	   	}
		
		function fCodeInfoDelete(){
			var ids = "";
			for(var o in keyCodeInfoTr.obj){
				ids = ids ? ids + "," : ids; 
				ids += keyCodeInfoTr.obj[o].attr("id");
			}
			$.post("ajaxActions/codeInfoAction_delete",{infoIds: ids}, function(){
				for(var o in keyCodeInfoTr.obj){
					keyCodeInfoTr.obj[o].remove();
				}
			});
		}
		
		//type指当前表单提交为 添加 还是 修改 
		function fShowCodeInfoEdit(){
			for(var o in keyCodeInfoTr.obj){
				var info = eval("("+keyCodeInfoTr.obj[o].attr("info")+")");
				fCodeInfoSetVal(info);
				return;
			}
		}
		
		//用于codeInfo的添加 修改
		function fCodeInfoSetVal(obj){
			obj = obj || {codeInfoId: "", codeInfoName: "", codeInfoStatus: "", codeInfoOrder: ""};
			$("#infoId").val(obj.dictId);
			$("#infoName").val(obj.dictName);
			$("#infoNameEn").val(obj.dictNameEn);
			$("#infoUnit").val(obj.unit);
			setDefault("infoStatus", obj.status);
			setDefault("infoDisplayStatus", obj.displayFlag);
			$("#codeInfoUpdateAdd").modal("show");
			$("#codeInfoUpdateAdd .btn-primary").click(function(){fInfoValidator();});
		}
		
		function fCodeInfoSubmitEdit(type){
			var url = "", successMethod,
			infoId = $("#infoId").val(),
			infoStatus = $("#infoStatus").val(),
			infoDisplayStatus = $("#infoDisplayStatus").val();
			infoUnit = $("#infoUnit").val(),
			infoName = $("#infoName").val();
			infoNameEn = $("#infoNameEn").val();
			url = "ajax/ajax_updateDict.action";
			tds = "<td>"+infoName+"</td><td>"+infoNameEn+"</td><td>"+ infoUnit +"</td><td>"+ infoStatus+"</td><td>"+ infoDisplayStatus+"</td>",
			str = "{unit:\""+ infoUnit +"\",dictId:\""+infoId+"\",dictName:\""+infoName +"\",dictNameEn:\""+infoNameEn+"\",status:\""+infoStatus+"\",displayFlag:\""+infoDisplayStatus+"\"}";
			successMethod = function(){
				var o = $("#codeInfo>tbody>#"+infoId);
				o.attr("info", str);
				o.attr("info", str);
				o.html("<td>" + o.find("td:first").text() + "</td>" + tds);
				$("#codeInfoUpdateAdd").modal("hide");
			};
			$.post(url,{"dict.dictId": infoId, "dict.status": infoStatus, "dict.dictName": infoName,"dict.displayFlag":infoDisplayStatus}, successMethod);
		}
		//检验表单是否完整
		function fCodeValidator(){
			document.updateAddForm.submit();
		}
		//检验表单是否完整
		function fInfoValidator(){
			fCodeInfoSubmitEdit();
		}
		
		function fError(type, id){
			id = id || "codeError";
			if(type)
				$("#" + id).fadeOut();
			else
				$("#" + id).fadeIn();
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