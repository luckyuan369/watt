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
	<script type="text/javascript" src="js/settings-avatar.js"></script>
	<link rel="stylesheet" type="text/css" href="css/settings-avatar.css">
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
						<li class=""><a class="icons password ie6fixpic" href="settings-password.watt">密码修改</a></li>
						<li class="select"><a class="icons portrait ie6fixpic" href="settings-avatar.watt">头像修改</a></li>
					</ul>
				</div>
				<div class="setting-detail">
					<!--setting-portrait static-->
					<div class="setting-portrait">
						<!--portrait set box 显示头像  static-->
						<div class="portrait-setbox clearfix">
							<div class="area-val fl">
								<img src="<c:out value='${user.image}'/>" id="avatar">
							</div>
							<div class="area-fun fl">
								<h3 class="red">从电脑中选择你喜欢的照片</h3>
								<p>你可以上传JPG、JPEG、GIF、或PNG文件。</p>
								<div class="btn-save">
									<div class="ipt-file" onclick="upd_file(this,'avatar_file',<c:out value="${user.id}"/>);">
										<input id="avatar_file" class="testfile" type="file" name="avatar_file"> <a
											class="btn-base common-sprite btn-red-h30"><span
											class="common-sprite">选择上传</span></a>
									</div>
								</div>
							</div>
						</div>
						<!--portrait set box end-->
						<!--
					头像修改 隐藏在下方  	
					<div class="portrait-setbox clearfix" style="display: none;">
					-->
						<!--portrait set box 头像裁切 static-->
						<div class="portrait-setbox clearfix" style="display: none;">
							<div class="area-select fl">
								<img src="static/images/upload/portrait.jpg">
							</div>
							<div class="area-fun fl">
								<h3 class="red">裁切并保存</h3>
								<p>随意拖拽或缩放大图中的虚线方格</p>
								<div class="btn-save">
									<a class="btn-base btn-red-h30 common-sprite"
										href="javascript:;"> <span class="common-sprite">保存头像</span>
									</a> <a class="btn-base btn-red-h30 common-sprite"
										href="javascript:;"> <span class="common-sprite">重新选择</span>
									</a>
								</div>
							</div>
						</div>
						<div class="portrait-tipsbox">保存成功后如果头像不更新，您可以多刷新几次浏览器。</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--main end-->
	<!--footer static-->
	<jsp:include page="footer.jsp"/>
</body>
</html>