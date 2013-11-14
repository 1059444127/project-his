<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科临床信息管理系统---检索条件</title>
<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}'/>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
<link rel="stylesheet" type="text/css" href="pages/search/css/search.css">
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
 <link href="google/Tip.css" type="text/css" rel="stylesheet" />
<style type="text/css">
html,body,div,table,td,th,input,tr,span,p,ul,li,a,select{
		font-family:"微软雅黑"
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
<body><div style="height:30px;background-color:#666;position:fixed;top:0px;width:100%;z-index:100;">
		<div style="margin-left:20px;z-index:101;color:#fff;padding-top:7px;font-size:14px">
			当前位置&nbsp;:&nbsp;模糊检索<div class="user_status"><a style="font-size:12px;text-decoration:underline;color:white;margin-right:10px" href="pages/index/index.jsp">首页</a><sec:authentication property="name"/></div>
		</div>
	</div>
	<section style="margin-top:20px;padding-top: 10px; padding-left: 20px;">
		<div class="detail" style="margin-top:20px">
			<div class="alert fade in">
           		<a class="close" data-dismiss="alert" href="#">×</a>
           		<div class="top_menu" style="margin-top: 20px">
           				<div style="background-color:#fbeedb;font-size:15px;font-weight:bold;padding:10px 30px;float:left;border-radius:10px 0px 0px 10px;border-right:1px solid #c09853"><a href="pages/search/search.jsp">精确检索</a></div>
           				<div style="background-color:#c09853;;font-size:15px;font-weight:bold;padding:10px 30px;float:left;border-radius:0px 10px 10px 0px"><a href="pages/search/search_sub.jsp" style="color:white">模糊检索</a></div>
           				<div style="clear:both"></div>
           		</div>
           		<div style="margin-top:30px">
           		<strong style="margin-left:10px">搜索功能说明</strong>
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
		</div>
		<div class="searchPanal" style="margin-top:25px">
		<form action="search/search_queryTestInfo.action" id="searchForm" method="post" target="_blank">
			<input name="saveName" type="hidden" id="saveNameHide"/>
			<input name="saveFlag" type="hidden" id="saveFlagHide" value="0"/>
			<div id="condition">
				<div>
					<input type="hidden" id="auto" value="0"/>
					<label>类型</label>
					<select id="testType" name="searchForm.testType" onchange="requestAllDict($(this))">
						<option value="检验">检验</option>
						<option value="检查">检查</option>
					</select>
			   		<label>项目：</label>
			   		<input name="simpleSearch" type="hidden" value="1"/>
			   		<input name="searchForm.subItemEn" id="subItemEn" type="hidden">
			   		<span id="project">
			   			<select id="sub_dict" ondblclick="changeAutoTips($(this), 1)" name="searchForm.subItem">
			   			</select>
			   		</span>
			   		<label>运算符：</label>
			   		<select id="dict_value" name="searchForm.operator" onchange="changeInput(this)">
			   			<option value="eq" selected="selected">等于</option>
			   			<option value="lt">小于</option>
			   			<option value="gt">大于</option>
			   			<option value="nlt">大于等于</option>
			   			<option value="ngt">小于等于</option>
			   			<option value="region">范围</option>
			   			<option value="count_1">单个</option>
			   			<option value="count_m">多个</option>
			   		</select>
			   		<span id="val">
			   			<input type="text" name="searchForm.itemValue1"/>
			   		</span>
			   		<label>关系：</label>
			   		<select onchange="fCondition(this)" name="searchForm.relation">
			   			<option value="-1">无</option>
			   			<option value="or">或者</option>
			   			<option value="and">并且</option>
			   			<option value="not">排除</option>
			   		</select>
		   		</div>
	   		</div>
	   		<div style="font-size:14px;margin-top:10px">
		   			<input type="checkbox" name="resultMulti" style="height:12px" checked="checked" onclick="sychoniseFastSearch(this)"/>显示最近一次指标结果
		   	</div>
	   		<div style="padding-top: 30px; text-align:right">
	   			<!-- 查询表单数据 -->
			   		<a href="javascript: fSearchSubmit(0)" class="btn btn-primary" >查询</a>
		   			<a href="#myModal" data-toggle="modal" class="btn btn-primary" >查询并保存</a>
	   		</div>
	   		<input type="hidden" name="isFirstSerachFlag" value="1"/>
			</form>
	   		<div style="padding-top: 20px;">
	   			<label id="mySearch"><strong>我的查询条件：</strong></label><br/>
	   				<table id="searchCond" style="font-size:14px">
	   					<tbody></tbody>
	   				</table>
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
		<!-- 保存提示框 -->
		<div id="myModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>系统提示消息</h3>
            </div>
            <div class="modal-body">
            	<label for="searchname">条件保存名：</label>
            	<input type="text" id="saveName" name="searchname">
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: fSearchSubmit(1)" class="btn btn-primary">确定</a>
            </div>
         </div>
         <!-- 删除提示框 -->
         <div id="dmyModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>系统提示消息</h3>
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
         <form name="queryFCForm" action="search/search_queryTestInfoFC.action" method="post" target="_blank">
            <input type="hidden"  name="groupId" id="fcGroupId"/>
            <input type="hidden" name="resultMulti" id="resultM" value="on"/>
            <input name="simpleSearch" type="hidden" value="1"/>
            <input type="hidden" name="isFirstSerachFlag" value="1"/>
         </form>
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
      	<a class="win-command" onclick="fastSearch()">
            <span class="win-commandimage PNG-Search"></span>
            <span class="win-label" >查询</span>
        </a>
      	<a class="win-command" href="actions/searchAction_query">
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
   <script type="text/javascript" src="scripts/alert.js"></script>
   <script type="text/javascript" src="scripts/modal.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/date/WdatePicker.js"></script>
 
   <script type="text/javascript" src="google/Tip.js"></script>
   <script type="text/javascript">
   		var conditionHtmlObj = null;
   		var list = null;
   		var condList = null;
   		$(document).ready(function(){
   			requestAllDict($("#testType"));
   			requestAllConds();
   		});
   		function reSetTable(){
   			$("table>tbody>tr").each(function(index, element) {
   		        var trObj = $(element);
   				trObj.hover(function(){$(this).addClass("tr-hover");},function(){$(this).removeClass("tr-hover");});
   		    });
   		}
   		function requestAllConds(){
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_selectAllConds.action',
				type:'post',
				dataType:'json',
				success:responseResult
			});
		}
   		function requestAllDict(jqObj){
   			var value = jqObj.find("option:selected").val();
   			var auto = jqObj.parent().find("#auto").val();
   			if(auto==0){
	   			var params = {testType:value};
				$.ajax({
					url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_querySubDictInfo.action',
					type:'post',
					dataType:'json',
					data:params,
					success:function(result) {
						list = result.dictList;
			   			genMainDictSelect(jqObj);
			   			conditionHtmlObj = $("#condition>div").clone();
					}
				});
   			}
		}
   		function responseResult(data){
   			condList = data.condList;
   			genFreSearchConditon();
   		}
   		function genFreSearchConditon(){
   			var searchCond = $("#searchCond");
   			for(var i in condList){
   				var index = parseInt(i)+1;
   				var condId = condList[i].condId;
   				var condDisplay = condList[i].condDisplay;
   				var tr = "<tr style=\"height:23px;line-height:23px\"><td style='width:50px'>" + index + "</td><td style=\"width:20px\"></td><td style='width:100px'>" + condId + "</td><td style=\"width:20px\"></td><td style='width:500px'>";
   				for(var j in condDisplay) {
   					tr += condDisplay[j];
   				}
   				tr += "</td><td><a class=\"searchClose\" data-toggle=\"modal\" href=\"#dmyModal\" onclick=\"fSetVal('"+ condId +"')\">&nbsp;&nbsp;×</a></td><td style=\"width:15px\"></td><td><a class=\"searchClose\" style=\"font-size:12px;color:blue\" href=\"javascript:fcSetVal('"+ condId + "')\">&nbsp;&nbsp;Go</a></td></tr>";
   				searchCond.append(tr);
   			}
   			reSetTable();
   		}
   		function genMainDictSelect(obj){
   			var sub_dict = $(obj).parent().find("#sub_dict");
   			sub_dict.empty();
   			for(var i in list){
   				var option = "<option value=" + list[i].dictName + ">" + list[i].dictName + "</option>";
   				sub_dict.append(option);
   			}
   			sub_dict.find("option:eq(0)").attr("selected","selected");
   		}
   		
   		function changeInput(obj){
   			var selectedVal = $(obj).find("option:selected").val();
   			var valueInput = $(obj).parent().find("#val");
   			valueInput.html("");
   			if(selectedVal=="region") {
   				valueInput.html("<input type='text' name='searchForm.itemValue1'/><input type='text' name='searchform.itemValue2'/>");
   			}
   			else {
   				valueInput.html("<input type='text' name='searchForm.itemValue1'/>");
   			}
   		}
   		function fSearchSubmit(type){
   			if(type==1){
   				$("#saveFlagHide").val(1);
   				var saveName = $("#saveName").val();
   				$("#saveNameHide").val(saveName);
   			}
   			else{
   				$("#saveFlagHide").val(0);
   			}
   			$("#myModal").modal("hide");
   			$("#searchForm").submit();
   		}
   		
   		function fNavStatusToggle(){
   			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
   		}
   		
   		
   		//用于动态添加、删除查询条件
   		function fCondition(obj){
   			var $obj = $(obj), val = $obj.find("option:selected").val(),
   			pIndex = $obj.parent().index(), panal = $("#condition"), childNum = panal.children().length;
   			if(val!=-1){
   				if(pIndex == (childNum -1)){
   					var o = conditionHtmlObj.clone();
   					panal.append(o);
   				}
   			}else{
   				panal.find("div:gt("+pIndex+")").remove();
   			}
   		}
   		function fcSetVal(groupIdFC){
   			$("#fcGroupId").val(groupIdFC);
   			document.queryFCForm.submit();
   		}
   		function fSetVal(groupId){
   			$("#groupId").val(groupId);
   			$("#groupName").html("确定删除查询组合 "+groupId+" ?");
   		}
		function fDelete(){
			document.delCondForm.submit();
		}
		function fastSearch(){
			$("#fsmyModal").modal("show");
		}
		function submitSearch(){
			$("#fsmyModal").modal("hide");
			document.fastSearchForm.submit();
		}
		function changeAutoTips(obj, type) {
			var html = "";
			var testObj = obj.parent().parent().find("#testType");
			if(type==1){
				html="<input name=\"searchForm.subItem\" ondblclick=\"changeAutoTips($(this), 0)\" type=\"text\" id=\"ShowText\" onkeyup=\"requestResult(this)\" size=\"20\" autocomplete=\"off\"/><div id=\"ShowTip\" name=\"ShowTip\" style=\"display:none;position:absolute;left:590px\"></div>";
			}
			else{
				html="<select id=\"sub_dict\" ondblclick=\"changeAutoTips($(this), 1)\" name=\"searchForm.subItem\">";
				requestAllDict(testObj);
			}
			obj.parent().parent().find("#project").html(html);
			obj.parent().parent().find("auto").val(type);
		}
		function sychoniseFastSearch(obj){
			var value = (obj.checked==true?'on':'off');
			$("#resultM").val(value);
		}
		
		function requestResult(obj) {
			var nobj = $(obj);
			if(!nobj.val()) {
				hideTips(nobj);
			}
			else {
				showTips(nobj);
			}
		}
		function hideTips(obj){
			obj.parent().find("#ShowTip").css("display","none");
		}
		function showTips(obj) {
			obj.parent().find("#ShowTip").css("display","");
			obj.parent().find("#ShowTip").html("<img src='google/ajax-loader.gif'>&nbsp;正在获取提示...");
	   		var value = obj.parent().parent().find("option:selected").val();
	   		var key = obj.val();
	   		var params = {testType:value,keyWord:key,keyfill:"1"};
	   		
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_querySubDictInfo.action',
				type:'post',
				dataType:'json',
				data:params,
				success:function(result) {
					generateResultList(obj, result.dictList);
				}
			});
		}
		function generateResultList(obj, dictList) {
			obj.parent().find("#ShowTip").html("");
			if(dictList && dictList.length>0) {
				var formatStr = "";
				var elementText = obj.val();
				var dictName = "";
				var DIVStr = "";
				for(var x in dictList) {
					dictName = dictList[x].dictName;
					formatStr = dictName.replace(elementText,"<b><font color='blue'>"+elementText+"</font></b>");
					DIVStr += "<div style='cursor:pointer;line-height:20px'>"+ formatStr +"</div>";
				}
				obj.parent().find("#ShowTip").html(DIVStr);
				obj.parent().find("#ShowTip>div").each(function(index, element) {
			        $(this).click(function(e) {
			           	obj.val($(this).text());
			           	hideTips(obj);
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
				obj.parent().find("#ShowTip").html("没有符合条件的关键词!");
			}
		}
   </script>
</body>
</html>