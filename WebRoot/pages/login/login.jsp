<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科临床信息管理系统---登录</title>
 <base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet/less" type="type/css" href="pages/login/css/login.less" />
<script type="text/javascript" src="scripts/less-1.3.0.min.js"></script>
<script type="text/javascript" src="scripts/html5.js"></script>
<style type="text/css">
html,body,div,table,td,th,input,tr,span,p,ul,li,a,select{
		font-family:"微软雅黑"
	}
.ps {
	border-left:5px solid #0073ca;
	padding-left:10px
}
</style>
</head>
<body class="body">
	<section>
		<div style="height:550px;margin-top:90px;background-image: url('resources/imgs/bottom.gif');background-repeat:no-repeat;background-position: 180px 20px">
		<div style="float:left;margin-left:260px;">
			<div>
				<img width="430px" src="pages/login/imgs/Security.jpg">
			</div>
			<div style="height:90px;width:430px;background-color:#0073ca;">
				<div style="font-size:23px; color:#ffffff;padding-left:20px;padding-top:20px">欢迎使用心内科临床信息管理系统</div>
				<div style="color:#ffffff;padding-left:20px;padding-top:10px">Powered by BGI</div>
			</div>
		</div>
		<div style="width:400px;float: left;margin-left:60px">
			<form action="j_spring_security_check" name="login" method="post" >
				<div style="margin-left:50px"><img src="pages/login/imgs/hospital.png" style="margin-left:40px"/></div>
				<div style="font-size:14px">
					<label class="ps" style="font-size:16px">用户名：</label><input type="text" name="j_username" class="input" autofocus="autofocus" required="required" placeholder="请输入用户名">
					<div style="height:15x">&nbsp;</div>
					<label class="ps" style="font-size:16px">密&nbsp;&nbsp;&nbsp;码：</label><input type="password" name="j_password" class="input" required="required" placeholder="请输入密码"><br/>
					<div style="margin-top:10px">
						<div style="margin-top:10px;float:left"><input type="checkbox" id="remember" name="remember" class="remember">记住用户名</div>
						<div style="margin-top:10px;margin-left:160px;float:left"><a class="btn btn-primary" title="登录" onclick="fSubmit()">登录</a></div>
						<div style="clear:both"></div>
					</div>
				</div>
				<div class="time" style="margin-left:100px;text-align:left;margin-top:-10px;margin-bottom:-5px"></div>
				<div style="font-size:13px;"><label class="ps">没有 系统 帐户? </label><a href="#">立即注册</a></div>
			</form>
		</div>
		<div style="clear:both"></div>
		<div style="padding-top:40px;margin-left:260px;margin-top:80px;width:800px">
			<span>©2013 解放军总医院</span>
			<span style="float:right">帮助中心 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;反馈 </span>
		</div>
		</div>
	</section>
	<script type="text/javascript" src="scripts/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			if(!!window.localStorage){
				var username = localStorage.getItem("username");
				$("input[name='j_username']").val(username);
				if(!!username)
					$("#remember").attr("checked","checked");
			}
			fTime();
			$(window).keydown(fKeyDown);
		});
		
		function fTime(){
			var date = new Date(), hour = date.getHours(), min = date.getMinutes(), sec = date.getSeconds();
			$(".time").html((hour<10?"0"+hour:hour) + ":" + (min<10?"0"+min:min) + ":" + (sec<10?"0"+sec:sec));
			setTimeout(arguments.callee, 1000);
		}
		
		function fKeyDown(e){
			var e=e||event;
			var currKey=e.keyCode||e.which||e.charCode;
			if(currKey==13){
				fSubmit();
			}
		}
		
		function fSubmit(){
			if(!!$("#remember").attr("checked") && !!window.localStorage){
				localStorage.setItem("username",$("input[name='j_username']").val());
			}else
				localStorage.setItem("username","");
			document.login.submit();
		}
	</script>
</body>
</html>