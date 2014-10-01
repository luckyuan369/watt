<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.watt.framework.home.domain.User" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<Meta name="Keywords" Content="瓦特鉴定,瓦特">
<meta name="title" content="">
<meta name="description" content="真实的鉴定">
<meta name="author" content="上海趋峰管理咨询有限公司 ">
<Meta name="Copyright" Content="©2014 上海趋峰管理咨询有限公司 360jianding.com 版权所有">
<title>瓦特鉴定</title>

<link rel="stylesheet" href="lib/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="lib/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link href="assets/css/site.min.css" rel="stylesheet">
<link href="assets/css/watt.css" rel="stylesheet">
	
<script src="lib/jquery/1.11.1/jquery.min.js"></script>
<script src="lib/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="lib/jquery/plug-in/jquery-migrate-1.1.1.js"></script>
<script type="text/javascript" src="assets/js/watt.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="projects-header"></div>
	<div class="container projects">
		<div class="row">
			<div class="col-sm-6 col-md-7" style="background-image: url(images/phoenix/licai_cnt.jpg);height: 339px;width: 58%;background-repeat: no-repeat;background-position: 34% 46%;"></div>
			<div class="col-sm-6 col-md-5 " style="padding-top: 30px;border: 1px solid #d6d6d6; border-radius: 0px 0px 5px 5px; padding-bottom: 30px;">
				<form class="form-horizontal" id="userRegister" style="padding: 20px 40px;">
					<fieldset>
				      	<div id="legend" class="">
				        	<legend>用户注册</legend>
				      	</div>
				    	<form class="form-horizontal">
							<div id="messageAlert" class="alert alert-danger alert-dismissible fade in">
								<strong>警告: </strong><span></span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">用户昵称<font color="red">*</font></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="user_name" placeholder="请输入用户昵称" maxlength="20">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">用户密码<font color="red">*</font></label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="user_pwd" placeholder="请输入用户密码" maxlength="16">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">确认密码<font color="red">*</font></label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="confirm_user_pwd" placeholder="请输入确认密码" maxlength="16">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">注册邮箱<font color="red">*</font></label>
								<div class="col-sm-9">
									<input type="email" class="form-control" name="email" placeholder="请输入注册邮箱" maxlength="20">
								</div>
							</div>
							<div class="form-group" style="margin-left: 100px;">
								<button type="button" class="btn btn-primary" id="btnSubmit" style="width: 275px;">立即注册</button>
							</div>
						</form>
				    </fieldset>
				  </form>
				  <div class="quick-links">
					已有帐号 <a style="color:red;" href="user-login.watt">直接登录</a>
				  </div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="footer.jsp"/>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#messageAlert span").html("");
			$("#messageAlert").css("display","none");
			
			var is_submiting = false;
			$("#btnSubmit").click(function(){
				
				if(is_submiting) return false;
		 		var user_name = $("[name='user_name']").val();
		 		var user_pwd = $("[name='user_pwd']").val();
		 		var confirm_user_pwd = $("[name='confirm_user_pwd']").val();
		 		var email = $("[name='email']").val();
		 		
		 		if(!wx.validator.required(user_name)) {
		 			$("#messageAlert").css("display","block");
		 			$("#messageAlert span").html("请输入用户昵称");
					return false;
				};
				
				if(!wx.validator.required(user_pwd)) {
		 			$("#messageAlert").css("display","block");
		 			$("#messageAlert span").html("请输入用户密码");
					return false;
				};
				
				if(!wx.validator.required(confirm_user_pwd)) {
		 			$("#messageAlert").css("display","block");
		 			$("#messageAlert span").html("请输入确认密码");
					return false;
				};
				
				if(confirm_user_pwd !== user_pwd ) {
		 			$("#messageAlert").css("display","block");
		 			$("#messageAlert span").html("输入密码与确认密码不符");
					return false;
				};
				if(!wx.validator.required(email)) {
		 			$("#messageAlert").css("display","block");
		 			$("#messageAlert span").html("请输入注册邮箱");
					return false;
				};
				
		 		if(!wx.validator.email(email)) {
		 			$("#messageAlert").css("display","block");
		 			$("#messageAlert span").html("无效的邮件格式");
					return false;
				};
				
				var query = new Object();
				query.user_name = user_name;
				query.user_pwd = user_pwd;
				query.confirm_user_pwd = confirm_user_pwd;
				query.email = email;
				is_submiting = true;
				$.ajax({
					url: "user-ajax_register.watt",
					dataType: "json",
					data:query,
					type: "POST",
					success: function(ajaxobj){
						is_submiting = false;
						if(ajaxobj.status == 1) {
							$("#messageAlert span").html("");
							$("#messageAlert").css("display","none");
							window.location.href = "index.watt";
						} else {
							$("#messageAlert").css("display","block");
				 			$("#messageAlert span").html(ajaxobj.info);
						};
					},
					error:function(){
						$("#messageAlert").css("display","block");
			 			$("#messageAlert span").html("网络错误");
					}
				});
		  	});
		});
	</script>
</body>
</html>