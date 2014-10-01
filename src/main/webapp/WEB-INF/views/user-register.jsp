<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- IE兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="keywords" content="A,B,C">
<meta name="description" content="D,E,F">
<title>瓦特鉴定-中国最具影响力的鉴定平台</title>
<!-- watt自定义的CSS文件 -->
<link rel="stylesheet" href="css/watt.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="lib/jquery/jquery-1.11.1.min.js"></script>
<script src="lib/jquery/plug-in/jquery-migrate-1.1.1.js"></script>
<!-- watt自定义的JS文件 -->
<script src="js/watt.js"></script>
</head>
<body>
	<div class="header" pbid="header">
		<div class="wrap">
			<div class="img-logo">
				<h1>
					<a alt="瓦特鉴定网" class="ie6fixpic" title="瓦特鉴定网" href="index.watt">瓦特鉴定网</a>
				</h1>
			</div>
			<div class="quick-links">
				已有账号 <a class="red" href="user-login.watt">直接登录</a>
			</div>
		</div>
	</div>
	<link rel="stylesheet" type="text/css" href="css/user-register.css">
	<div class="main">
		<div class="wrap">
			<div class="main-inner" style="background-image: url(images/phoenix/licai_cnt.jpg)">
			</div>
			<div class="signin-block"
				style="position: absolute; right: 0; top: 60px;">
				<div class="signin-tit">
					<h3>用户注册</h3>
				</div>
				<div class="signin-form">
					<form method="post" id="JS-user_register_form">
						<div class="form-item clearfix">
							<label>邮箱：</label> <input type="text" placeholder="请输入您的邮箱" name="email" maxlength="20">
						</div>
						<div class="form-item clearfix">
							<label>昵称：</label> <input type="text" placeholder="请输入昵称" name="user_name" maxlength="20">
						</div>
						<div class="form-item clearfix">
							<label>密码：</label> <input type="password" name="user_pwd" placeholder="请输入6-16位密码" maxlength="16">
						</div>
						<div class="form-item clearfix">
							<label>确认密码：</label> <input type="password" name="confirm_user_pwd" placeholder="请再次输入密码" maxlength="16">
						</div>
						<div class="form-reg">
							<input type="checkbox" checked="checked" name="checkbox"
								value="1">阅读并同意瓦特鉴定网的<a target="_blank" class="red"
								href="help-registerpro.watt">《服务协议》</a>
						</div>
						<div class="login-form-btn">
							<input type="submit" value="立即注册">
						</div>
					</form>
				<script>
					var is_submiting = false;
					function jmzgetLength(str) {
						var realLength = 0, len = str.length, charCode = -1;
						for (var i = 0; i < len; i++) {
						charCode = str.charCodeAt(i);
						if (charCode >= 0 && charCode <= 128) realLength += 1;
							else realLength += 2;
						}
						return realLength;
					} 
					$("#JS-user_register_form").bind("submit", function(event){
						if(is_submiting) return false;
						var checkbox = parseInt($("#JS-user_register_form").find("input[name='checkbox']:checked").val());
						if(checkbox!==1) {
							wx.alert('请阅读并同意瓦特鉴定网服务协议');
							return false;
						}
						var email = $.trim($("#JS-user_register_form").find("input[name='email']").val());
						var user_pwd = $.trim($("#JS-user_register_form").find("input[name='user_pwd']").val());
						var confirm_user_pwd = $.trim($("#JS-user_register_form").find("input[name='confirm_user_pwd']").val());
						var user_name = $.trim($("#JS-user_register_form").find("input[name='user_name']").val());
						if(email == '' || !wx.validator.rule.email(email)) {
							wx.alert("邮件格式不正确");
							return false;
						}
						if(user_pwd.length < 6 || user_pwd.length > 16) {
							wx.alert("密码必须是6到16位的字母或数字");
							return false;
						}
						
						if(user_pwd != confirm_user_pwd) {
							wx.alert("确认密码失败");
							return false;
						}
						if(user_name=="" || jmzgetLength(user_name)>24) {
							wx.alert("昵称不能为空,最多为12个汉字或24个字符");
							return false;
						}
						is_submiting = true;
						var ajaxurl = 'user-ajax_register.watt';
						var query = new Object();
						query.email = email;
						query.user_name = user_name;
						query.user_pwd = user_pwd;
						query.confirm_user_pwd = confirm_user_pwd;
						$.ajax({
							url: ajaxurl,
							dataType: "json",
							data:query,
							type: "POST",
							success: function(ajaxobj){
								is_submiting = false;
								if(ajaxobj.status==1)
								{
									wx.alert("注册成功", function() {
										window.location.href = "user-login.watt";
									});
								} else {
									if (ajaxobj.info != "") {
										wx.alert(ajaxobj.info);
										return;
									}
									wx.alert("注册错误");
								};
							},
							error:function(ajaxobj)
							{
								is_submiting = false;
								wx.alert('网络错误');
							}
						});
						return false;
					});
				</script>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-login">
		<p>©2014 上海趋峰管理咨询有限公司 360jianding.com 版权所有</p>
	</div>
	<!--footer end-->
</body>
</html>