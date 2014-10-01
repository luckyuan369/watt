<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.watt.framework.home.domain.User"%>
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
<link rel="stylesheet"
	href="lib/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<link href="assets/css/site.min.css" rel="stylesheet">
<link href="assets/css/watt.css" rel="stylesheet">
<script src="lib/jquery/1.11.1/jquery.min.js"></script>
<script src="lib/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="lib/jquery/plug-in/jquery-migrate-1.1.1.js"></script>
<script type="text/javascript" src="assets/js/watt.js"></script>
<script type="text/javascript" src="assets/js/settings-avatar.js"></script>
</head>
<body>
	<!-- position:relative;display:inline-block;vertical-align:middle -->
	<jsp:include page="header.jsp" />
	<div class="projects-header"></div>
	<div class="container">
		<div class="row" style="padding-left: 32px; padding-right: 32px;">
			<div class="col-sm-12 col-md-12 setting-content"
				style="padding-left: 0px; padding-right: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px;">
				<div class="setting-title clearfix">
					<h3>个人设置</h3>
				</div>
				<div class="setting-content clearfix">
					<div class="setting-menu col-sm-2" style="padding: 0px">
						<ul class="clearfix">
							<li><a class="glyphicon glyphicon-user" href="settings.watt">&nbsp;资料修改</a></li>
							<li><a class="glyphicon glyphicon-wrench"
								href="settings-password.watt">&nbsp;密码修改</a></li>
							<li class="select"><a class="glyphicon glyphicon-picture"
								href="settings-avatar.watt">&nbsp;头像修改</a></li>
						</ul>
					</div>
					<div class="col-sm-10 setting-detail"
						style="padding: 40px 25px 20px; min-height: 465px;">
						<div class="setting-portrait">
							<input type="hidden" name="image" value="">
							<!--portrait set box 显示头像  static-->
							<div class="portrait-setbox clearfix">
								<div class="area-val fl">
									<img src="<c:out value='${user.image}'/>" id="avatar">
								</div>
								<div class="area-fun fl">
									<h3 class="red">从电脑中选择你喜欢的照片</h3>
									<p>你可以上传JPG、JPEG、GIF、或PNG文件。</p>
									<div class="btn-save">
										<div class="ipt-file" onclick="upd_file1(this,'avatar_file',<c:out value="${user.id}"/>);">
										<input id="avatar_file" class="testfile" type="file" name="avatar_file">
									</div>
									</div>
								</div>
							</div>
							<!--portrait set box end-->
							<div class="portrait-tipsbox">保存成功后如果头像不更新，您可以多刷新几次浏览器。</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="footer.jsp" />
	<script src="lib/jquery/plug-in/ajaxfileupload.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var h_sex = $("#h_sex").val();
					if (h_sex !== "") {
						$("input[name=sex][value='" + h_sex + "']").attr(
								"checked", true);
					} else {
						$("input[name=sex][value='-1']").attr("checked", true);
					}

					$("#btnSubmit").click(
							function() {
								var id = $.trim($("#form").find(
										"input[name='id']").val());
								var user_name = $.trim($("#form").find(
										"input[name='user_name']").val());
								var sex = $.trim($("#form").find(
										"input:radio[name='sex']:checked")
										.val());
								var intro = $.trim($("#form").find(
										"textarea[name='intro']").val());
								if (!wx.validator.required(user_name)) {
									$("#messageAlert span").html("请输入用户昵称");
									$("#messageAlert").css("display", "block");
									return false;
								}
								if (!wx.validator.maxLength(user_name, 20)) {
									$("#messageAlert span")
											.html("用户昵称不可超过20个字");
									$("#messageAlert").css("display", "block");
									return false;
								}

								if (!wx.validator.required(sex)) {
									$("#messageAlert span").html("请选择性别");
									$("#messageAlert").css("display", "block");
									return false;
								}

								if (!wx.validator.maxLength(intro, 200)) {
									$("#messageAlert span")
											.html("用户昵称不可超过20个字");
									$("#messageAlert").css("display", "block");
									return false;
								}

								is_submiting = true;
								var ajaxurl = "settings-save_index.watt";
								var query = new Object();
								query.id = id;
								query.user_name = user_name;
								query.sex = sex;
								query.intro = intro;
								$.ajax({
									url : ajaxurl,
									dataType : "json",
									data : query,
									type : "POST",
									success : function(ajaxobj) {
										is_submiting = false;
										if (ajaxobj.status == 1) {
											location.reload();
										} else {
											if (ajaxobj.errorMes != "") {
												$("#messageAlert span").html(
														ajaxobj.errorMes);
												$("#messageAlert").css(
														"display", "block");
												return;
											}
										}
										;
									},
									error : function(ajaxobj) {
										is_submiting = false;
										$("#messageAlert span").html("网络错误");
										$("#messageAlert").css("display",
												"block");
									}
								});
								return false;
							});
				});
	</script>
</body>
</html>