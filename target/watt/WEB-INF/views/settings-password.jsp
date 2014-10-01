<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="lib/jquery/ajaxPager.js"></script>
<script src="lib/jquery/plug-in/ajaxfileupload.js"></script>
<link rel="stylesheet" href="lib/jquery/ajaxPager.css">
<!-- watt自定义的JS文件 -->
<script src="js/watt.js"></script>
</head>
<body>
	<!--header static-->
	<jsp:include page="header.jsp" />
	<!--header-end-->
	<link rel="stylesheet" type="text/css" href="css/settings-password.css">
	<!--main static-->
	<div class="main clearfix">
		<div class="setting wrap">
			<div class="setting-title clearfix">
				<h3>个人设置</h3>
				<a href="home-support.watt">返回个人中心</a>
			</div>
			<div class="setting-content clearfix">
				<div class="setting-menu">
					<ul class="clearfix">
						<li class=""><a class="icons info ie6fixpic" href="settings.watt">资料修改</a></li>
						<li class="select"><a class="icons password ie6fixpic" href="settings-password.watt">密码修改</a></li>
						<li><a class="icons portrait ie6fixpic" href="settings-avatar.watt">头像修改</a></li>
					</ul>
				</div>
				<div class="setting-detail">
					<!--setting-form static-->
					<form name="passModify" class="setting-form" action="settings-ajax_save_password.watt" wx-validator=""
						wx-validator-error-class="error-text" wx-validator-ajax=""
						autocomplete="off">
						<div class="form-item clearfix">
							<label>原始密码：</label> <input type="password" value="" name="old_pwd" wx-validator-rule="required|rangelength" wx-validator-param="|1-16">
						</div>
						<div class="form-item clearfix">
							<label>新密码：</label> <input type="password" value="" name="user_pwd" wx-validator-rule="required|rangelength" wx-validator-param="|6-16">
							<!-- <span class="error-text">*密码格式错误</span> -->
						</div>
						<div class="form-item clearfix">
							<label>确认密码：</label> <input type="password" value=""
								name="confirm_user_pwd" wx-validator-rule="required|equalTo"
								wx-validator-param="|user_pwd"> <span
								id="wx-validator-confirm_user_pwd-equalTo"
								class="error-text hidden">两次密码不一致</span>
						</div>
						<div class="setting-submit">
							<a type="submit" class="btn-base btn-red-h30 common-sprite"
								href="javascript:;"><span class="common-sprite">保存</span></a>
						</div>
					</form>
					<!--setting-form end-->
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function passModify(data) {
			if (data.status == 1) {
				wx.alert("保存成功", function() {
					location.reload();
				});
			} else {
				wx.alert(data.info);
			}
		}
	</script>
	<!--main end-->
	<!--footer static-->
	<jsp:include page="footer.jsp"/>
</body>
</html>