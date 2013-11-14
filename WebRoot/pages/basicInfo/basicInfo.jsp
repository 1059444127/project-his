<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.ac.big.dp.bean.Dict" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="/myTagLib" prefix="p"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科临床信息管理系统----检索结果</title>
<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}'/>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<link rel="stylesheet" type="text/css" href="pages/index/css/index.css">
<style type="text/css">
	.ta:hover{
		
	}
	.modal-body label{width: 90px; margin: 3px 0; }
	.modal-body input{ margin: 3px 0; width: 150px;}
	.modal-body select{width: 154px;}
	.nowrap{width: 200px;height:100%;display:inline-block;word-spacing: normal; white-space: nowrap;overflow:hidden;text-overflow:ellipsis;}
	html,body,div,table,td,th,input,tr,span,p,ul,li,a,select,tbody,thead{
		font-family:"微软雅黑"
	}
</style>
<script type="text/javascript" src="scripts/html5.js"></script>
</head>
<body>
	<div>
	<div style="height:30px;background-color:#666;position:fixed;width:100%;z-index:100;">
		<div style="margin-left:20px;z-index:101;color:#fff;padding-top:7px;font-size:14px">
			本次查询条件：
			<s:iterator value="#session.curConditionDis" id="con" status="index">
				<span>
				<s:property value="#con.replace('not','排除').replace('and','并且').replace('or','或者')"/></span>
			</s:iterator>
			<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div>
		</div>
	</div>
	<div style="padding-top:20px">
	<section>
		<table class="table table-bordered" id="displayTable" style="text-align:center">
			<thead>
				<tr>
					<th></th>
					<th colspan="6" style="text-align:center;font-size:14px">病人基本信息</th>
					<s:iterator value="dictList" id="dict" status="index">
						<th style="text-align:center;font-size:14px" colspan="<s:property value='#dict.subDict.size()'/>"><s:property value="#dict.dictName"/></th>
					</s:iterator>
				</tr>
				<tr>
					<th></th>
					<th style="font-size:14px">序号</th>
					<th style="font-size:14px" onclick="displayColumn(this,1)">姓名<a class="close">×</a></th>
					<th style="font-size:14px" onclick="displayColumn(this,1)">病人ID<a class="close">×</a></th>
					<th style="font-size:14px" onclick="displayColumn(this,1)">病次ID<a class="close">×</a></th>
					<th style="font-size:14px" onclick="displayColumn(this,1)">性别<a class="close">×</a></th>
					<th style="font-size:14px" onclick="displayColumn(this,1)">年龄<a class="close">×</a></th>
					<s:iterator value="dictList" id="ddict" status="ddindex">
						<s:iterator value="#ddict.subDict" id="subDict">
							<th align="center" style="font-size:14px" onclick="displayColumn(this,<s:property value='#ddindex.index'/>+2)"><s:property value="#subDict.dictName"/><a class="close">×</a></th>
						</s:iterator>
					</s:iterator>
				</tr>
			</thead>
			<tbody id="result_body">
				<s:iterator value="testResultList" id="result" status="rindex">
					<tr>
						<td><input type="checkbox" style="margin:0px;padding:0px;height:11px"/></td>
						<td style="text-align:center;vertical-align:middle;font-weight:bold"><s:property value="page.rowFrom+#rindex.index+1"/></td>
						<td style="text-align:center;vertical-align:middle;cursor: pointer;" onclick="window.open('search/patient_findPatient.action?patientId=<s:property value="#result.patientId"/>&isFirstSerachFlag=1')"><s:property value="#result.patientName"/></td>
						<td style="text-align:center;vertical-align:middle"><s:property value="#result.patientId"/></td>
						<td style="text-align:center;vertical-align:middle"><s:property value="#result.visitId"/></td>
						<td style="text-align:center;vertical-align:middle"><s:property value="#result.sex"/></td>
						<td style="text-align:center;vertical-align:middle"><s:property value="#result.age"/></td>
						<s:iterator value="dictList" id="sdict" status="sdindex">
							<s:iterator value="#sdict.subDict" id="subDict">
								<td align="center">
									<s:iterator value="#result.resultMap.get(#sdict.dictName+#subDict.dictName)" id="searchResult">
										<s:property value="#searchResult"/>
									</s:iterator>
								</td>
							</s:iterator>
						</s:iterator>
					</tr>
				</s:iterator>
			</tbody>
		</table>
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
         <!-- 保存提示框 -->
		<div id="myModal" class="modal hide fade" style="display: none; width:53%;left:42%">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>请选择要导出的字段名称</h3>
            </div>
            <div class="modal-body" style="font-size:15px;text-align:">
            <form action="export/export_exportToExcel.action" method="post" name="exportForm" target="_blank">
            	<s:iterator value="dictList" id="dict" status="index">
            	<div>
					
					<label style="font-size:15px;font-weight:bold;width:200px;border-left:3px solid #24A0DA">&nbsp;&nbsp;<input type="checkbox" style="width:15px;height:15px" onclick="selectGroup(this)"/><s:property value="#dict.dictName"/>:</label>
					<div style="margin-top:8px;margin-left:20px">
					<s:iterator value="#dict.subDict" id="subDict" status="sindex">
					<div style="float: left">
						<input onclick="checkParent(this)"style="width:15px;height:15px"  type="checkbox" name="fieldNames" value="<s:property value="#dict.dictName+#subDict.dictName"/>"/>
						<span><s:property value="#subDict.dictName"/></span>&nbsp;&nbsp;
					</div>
					</s:iterator>
					<div style="clear:both;margin-bottom:8px"></div>
					</div>
				</div>
            	</s:iterator>
            	<input type="hidden" name="resultMulti" value="<s:property value='resultMulti'/>"/>
            </form>
            </div>
            <div class="modal-footer">
              <a href="javascript:selectAll()" class="btn">全选</a>
              <a href="javascript:deSelectAll()" class="btn">全不选</a>
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: fValidate()" class="btn btn-primary">导出</a>
            </div>
         </div>
         
         <!-- 详情提示框 -->
         <div id="testInfoModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>详细信息</h3>
            </div>
            <div class="modal-body">
            	<span id="groupName"></span>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: fDelete()" class="btn btn-primary">确定</a>
            </div>
            <form name="delCondForm" action="search/search_deleteCondition.action" method="post">
            	<input type="hidden" value="" name="groupId" id="groupId"/>
            </form>
         </div>
         
	</section>
	</div>
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
       	 <a class="win-command" data-toggle="modal" href="#myModal">
            <span class="win-commandimage PNG-Save"></span>
            <span class="win-label">保存</span>
         </a>
         <a class="win-command" data-toggle="modal" href="javascript:printFunc()">
            <span class="win-commandimage PNG-Save"></span>
            <span class="win-label">打印</span>
         </a>
         <a class="win-command">
            <span class="win-commandimage PNG-Mail"></span>
            <span class="win-label">发送邮件</span>
         </a>
         <a class="win-command" href="actions/basicInfoAction_query">
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
   <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/date/WdatePicker.js"></script>
   <script type="text/javascript">
		   var keyTr = {ctrlDown: false, obj: {}};//用于判断是否按下ctrl键，以及存储以选择行对象
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
				}).click(function(event){
					fTrBgColor(event, "click", keyTr);
				});;
			});
		 //用于设置导航栏的显示状态
		function fNavStatusToggle(){
			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
		}

		//用于改变行的背景色
		function fTrBgColor(event, type, keyTr){
			var obj = $(event.target).parent(), isSelect = obj.attr("isselect");
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
		function fValidate(){
			$("#myModal").modal("hide");
			document.exportForm.submit();
		}
		function displayColumn(obj, trIndex){
			var newObj = $(obj);
			var colIndex = newObj.index();
			$("#displayTable>tbody>tr").each(function(){
				var rowObj = $(this);
				rowObj.find("td:eq(" + colIndex+ ")").css("display","none");
			});
			newObj.css("display","none");
			var thObject = $("#displayTable>thead>tr:eq(0)>th:eq(" + trIndex +")");
			var colspan = thObject.attr("colspan");
			if(colspan==1){
				thObject.css("display","none");
			}
			else{
				thObject.attr("colspan",colspan-1);
			}
		}
		function fastSearch(){
			$("#fsmyModal").modal("show");
		}
		function submitSearch(){
			$("#fsmyModal").modal("hide");
			document.fastSearchForm.submit();
		}
		function selectAll() {
			$("#myModal input[type=checkbox]").each(function(){$(this).attr( "checked", true)});
		}
		function deSelectAll() {
			$("#myModal input[type=checkbox]").each(function(){$(this).attr( "checked", false)});
		}
		function selectGroup(obj){
			var flag = $(obj).attr("checked")=="checked"?true:false;
			$(obj).parent().parent().find("input[type=checkbox]:gt(0)").each(function(){$(this).attr("checked",flag)});
		}
		function checkParent(obj){
			var checkedNum = 0;
			var checkboxSize = $(obj).parent().parent().find("input[type=checkbox]").size();
			$(obj).parent().parent().find("input[type=checkbox]").each(function(){
				if($(this).attr("checked")){
					checkedNum++;
				}
			});
			if(checkedNum==0){
				$(obj).parent().parent().parent().find("input[type=checkbox]:eq(0)").attr("checked",false);
			} else if(checkedNum==checkboxSize) {
				$(obj).parent().parent().parent().find("input[type=checkbox]:eq(0)").attr("checked",true);
			}
		}
		function printFunc() {
			var table = "<table style='border-collapse:collapse;border:1px solid #999999'>";
			$("#result_body tr").each(function(index,ele){
				table += "<tr>";
				if($(this).find("input[type='checkbox']").attr("checked")){
					$(this).find("td:gt(0)").each(function(){
						table += "<td style='width:30px;border-collapse:collapse;border:1px solid #999999'>"+$(this).html()+"</td>";
					});
				}
				table += "</tr>";
			});
			table += "</table>";
			var newWin = window.open('about:blank','','');
			newWin.document.write(table);
			newWin.document.location.reload();
			newWin.print();
			newWin.close();
		}
   </script>
   </div>
</body>
</html>