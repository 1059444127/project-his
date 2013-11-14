<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科信息检索系统</title>
<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}'/>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/alert.css">
<link rel="stylesheet" type="text/css" href="pages/search/css/search.css">
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<style type="text/css">
html,body,div,table,td,th,input,tr,span,p,ul,li,a,select{
		font-family:"微软雅黑"
	}
</style>
<script type="text/javascript" src="scripts/html5.js"></script>
</head>
<body>
	<section style="padding-top: 10px; padding-left: 20px;">
		<div class="detail" style="margin-top:20px">
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
		<div class="searchPanal" style="margin-top:25px">
		<form action="search/search_queryTestInfo.action" id="searchForm" method="post" target="_blank">
			<input name="saveName" type="hidden" id="saveNameHide"/>
			<input name="saveFlag" type="hidden" id="saveFlagHide" value="0"/>
			<div id="condition">
				<div>
			   		<label>项目：</label>
			   		<input name="searchForm.testType" id="testType" type="hidden"/>
			   		<input name="searchForm.subItemEn" id="subItemEn" type="hidden">
			   		<input name="simpleSearch" type="hidden" value="1"/>
			   		<select id="sub_dict" onchange="getSubItemType(this)" name="searchForm.subItem">
			   		</select>
			   		
			   		<label>运算符：</label>
			   		<select id="dict_value" name="searchForm.operator" onchange="changeInput(this)">
			   		</select>
			   		<span id="val"></span>
			   		<label>关系：</label>
			   		<select onchange="fCondition(this)" name="searchForm.relation">
			   			<option value="-1">无</option>
			   			<option value="or">逻辑或</option>
			   			<option value="and">逻辑与</option>
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
					<li class="win-label"><a href="admin/userAction_getAllUsers.action?isFirstSerachFlag=1">用户信息管理</a></li>
					<li class="win-label"><a href="admin/codeAction_queryAllDictInfo.action?isFirstSerachFlag=1">代码信息管理</a></li>
					<li class="win-label"><a href="pages/search/search.jsp">精确搜索</a></li>
					<li class="win-label"><a href="pages/search/search_sub.jsp">模糊搜索</a></li>
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
   <script type="text/javascript">
   		var conditionHtmlObj = null;
   		var list = null;
   		var condList = null;
   		$(document).ready(function(){
   			requestAllDict();
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
   		function requestAllDict(){
			$.ajax({
				url:'${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}ajax/ajax_querySubDictInfo.action',
				type:'post',
				dataType:'json',
				success:processResult
			});
		}
   		function responseResult(data){
   			condList = data.condList;
   			genFreSearchConditon();
   		}
   		function processResult(data){
   			list = data.dictList;
   			genMainDictSelect();
   			conditionHtmlObj = $("#condition>div").clone();
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
   		function genMainDictSelect(){
   			var sub_dict = $("#sub_dict");
   			var obj = {};
   			for(var i in list){
   				var option = "<option value=" + list[i].dictName + ">" + list[i].dictName + "</option>";
   				if(typeof(obj[list[i].elFlag]) == "undefined"){
   					obj[list[i].elFlag] = "";
   				}
   				obj[list[i].elFlag] += option;
   			}
   			for(var p in obj){
   				var optiongroup = "<optgroup label='"+ p +"'>"+obj[p]+"</optgroup>";
   				var newObj = $(optiongroup);
   				sub_dict.append(newObj);
   			}
   			sub_dict.find("option:eq(0)").attr("selected","selected");
   			getSubItemType(sub_dict);
   		}
   		function getSubItemType(obj){
   			var obj = $(obj);
   			var selectIdx = obj.find("option:selected").index();
   			var testType = obj.parent().find("#testType");
   			var subItemEn  = obj.parent().find("subItemEn");
   			
   			var subDictType = list[selectIdx].type;
   			var elFlag = list[selectIdx].elFlag;
   			var subItemEnVal = list[selectIdx].dictNameEn;
   			
   			subItemEn.val(subItemEnVal);
   			testType.val(elFlag);
   
   			var option;
   			switch(subDictType){
   			
   				case 1:option = "<option value='eq'>等于</option><option value='gt'>大于</option><option value='nlt'>大于等于</option><option value='lt'>小于</option><option value='ngt'>小于等于</option><option value='region'>范围</option>";break;
   				case 2:option = "<option value='normal'>正常</option><option value='unnormal'>不正常</option>";break;
   				case 3:option = "<option value='date_eq'>当天</option><option value='date_lt'>早于</option><option value='date_gt'>晚于</option><option value='date_region'>介于</option>";break;
   				case 4:option = "<option value='string_eq'>完全匹配</option><option value='string_lk'>部分匹配</option>";break;
   				case 5:option = "<option value='sex_m'>男</option><option value='sex_f'>女</option>";break;
   				case 6:option = "<option value='judge_yes'>是</option><option value='judge_no'>否</option>";break;
   				case 7:option = "<option value='count_1'>单个</option><option value='count_m'>多个</option>";
   			}
   			var subDict = obj.parent().find("#dict_value");
   			subDict.empty();
   			subDict.append(option);
   			subDict.find("option:eq(0)").attr("selected","selected");
   			changeInput(subDict);
   		}
   		
   		function changeInput(obj){
   			var obj = $(obj);
   			var valueType = obj.parent().find("#dict_value option:selected").val();
   			var valInput = obj.parent().find("#val");
   			valInput.empty();
   			
   			if(valueType == "region"){
   				valInput.append("<label>值：</label><input type='text' name='searchForm.itemValue1' size='10'/><input type='text' id='val2' name='searchForm.itemValue2' size='10'/>");
   			}
   			else if(valueType.match(/^date/)){
   				if(valueType == "date_region"){
   					valInput.append("<label>值：</label><input type='text' name='searchForm.itemValue1' size='10' onclick='WdatePicker({isShowClear:false,readOnly:true})'/><input type='text' id='val2' name='searchForm.itemValue2' size='10' onclick='WdatePicker({isShowClear:false,readOnly:true})'/>");
   				}
   				else{
   					valInput.append("<label>值：</label><input type='text' name='searchForm.itemValue1' size='24' onclick='WdatePicker({isShowClear:false,readOnly:true})'/>");
   				}
   			}
   			else if(valueType.match(/^string/)){
   				valInput.append("<label>名：</label><input type='text' name='searchForm.itemValue1' size='24'/>");
   			}
   			else if(valueType.match(/normal$/) || valueType.match(/^sex/) || valueType.match(/^judge/)){
   				valInput.append("");
   			}
   			else{
   				valInput.append("<label>值：</label><input type='text' name='searchForm.itemValue1' size='24'/>");
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
		function changeAutoTips(type) {
			var html = "";
			if(type==1){
				html="<input type=\"text\" id=\"ShowText\" onblur=\"javascript:setTimeout('HideTTip()',300);\" onkeyup=\"javascript:if ( this.value!=''){ ShowTip(); } else { HideTTip(); }\" size=\"50\" autocomplete=\"off\"/><div id=\"ShowTip\" name=\"ShowTip\" style=\"display:none;overflow: scroll; height: 300px\"></div>";
			}
			else{
				html="<select id=\"sub_dict\" onchange=\"getSubItemType(this)\" name=\"searchForm.subItem\">";
			}
			$("#project").html(html);
		}
		function sychoniseFastSearch(obj){
			var value = (obj.checked==true?'on':'off');
			$("#resultM").val(value);
		}
   </script>
</body>
</html>