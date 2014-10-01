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
				还没有帐号？立即 <a class="red" href="user-register.watt">免费注册</a>
			</div>

		</div>
	</div>
	<link rel="stylesheet" type="text/css" href="css/user-register.css">
	<div class="main">
		<div class="wrap">
			<div class="main-inner" style="background-image: url(images/phoenix/licai_cnt.jpg)"></div>
			<div class="login-block" style="position: absolute; right: 0; top: 60px;">
				<div class="login-func">
					<ul class="clearfix">
						<li id="Js-pcbtn" class="select" style="width: 350px; cursor: default;"><span>用户登录</span></li>
					</ul>
				</div>
				<div id="Js-pclogin" class="login-form">
					<form method="post" id="JS-user_login_form">
						<div class="login-form-ipt">
							<input class="uid icon-login ie6fixpic" type="text" placeholder="请输入昵称/邮箱" name="user_name" maxlength="20">
						</div>
						<div class="login-form-ipt">
							<input class="ped icon-login ie6fixpic" type="password" placeholder="请输入密码" name="user_pwd" maxlength="16">
						</div>
						<div class="login-form-btn">
							<input type="submit" value="登录">
						</div>
					</form>
					<div class="pass-login clearfix">
						<a class="red fr" href="user-getpassword.watt">忘记密码？</a>
					</div>
				</div>
			</div>
			<script>
				(function() {
					$("#JS-user_login_form").bind("submit",
							function() {
								var user_name = $.trim($("#JS-user_login_form")
										.find("input[name='user_name']").val());
								var password = $.trim($("#JS-user_login_form")
										.find("input[name='user_pwd']").val());

								if (user_name == '') {
									wx.alert("账号不能为空");
									return false;
								}

								if (password == '') {
									wx.alert("密码不能为空");
									return false;
								}

								var ajaxurl = 'user-ajax_login.watt';
								var query = new Object();
								query.user_name = user_name;
								query.user_pwd = password;
								$.ajax({
									url : ajaxurl,
									dataType : "json",
									data : query,
									type : "POST",
									success : function(ajaxobj) {
										if (ajaxobj.status == 1) {
											window.location.href = "index.watt";
										} else {
											wx.alert(ajaxobj.info);
										}
									},
									error : function(ajaxobj) {
										wx.alert("登录失败，请重试");
									}
								});
								return false;
							});
				})();
			</script>
		</div>
	</div>
	<div class="footer-login">
		<p>©2014 上海趋峰管理咨询有限公司 360jianding.com 版权所有</p>
	</div>
	<!--footer end-->
</body>
</html>