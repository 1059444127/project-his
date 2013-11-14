<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="scripts/jquery.js"></script>
    <script type="text/javascript" src="scripts/jquery.validate.js"></script>
	<script type="text/javascript" src="scripts/jquery.metadata.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#submitForm").validate()
	});
	</script>
  </head>
  
  <body>
  	<form id="submitForm">
  		验证值：<input name="testNo" id="testNo" class="{required:true,remote:'search/patient_checkTestNo.action'}"/>
  		<input type="submit"/>
  	</form>
  </body>
</html>
