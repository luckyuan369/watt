<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.watt.framework.home.domain.User" %>
<%@ page isELIgnored="false"%>
<link rel="stylesheet" href="lib/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="lib/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<% 
				Object object = request.getSession().getAttribute("user");
				if(object !=  null){ 
				User user = (User)object;
			%>
				<div class="btn-group">
					<a class="navbar-brand hidden-sm dropdown-toggle" data-toggle="dropdown" href="#">
					<%=user.getUser_name()%><span class="caret"></span>
					</a>
				  <ul class="dropdown-menu" role="menu" style="font-size: 18px;">
				    <li><a href="#">我发起的鉴定</a></li>
				    <li><a href="#">我支持的鉴定</a></li>
				    <li><a href="#">我喜欢的鉴定</a></li>
				    <li><a href="settings.watt">我的个人设置</a></li>
				    <li class="divider"></li>
				    <li><a href="user-loginout.watt">退 出</a></li>
				  </ul>
				</div>
			<%}else{%>
				<a class="navbar-brand hidden-sm" href="user-login.watt">登录</a>
				<em class="navbar-brand hidden-sm">|</em>
				<a class="navbar-brand hidden-sm" href="user-register.watt">注册</a>
			<%}%>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav" style="font-size: 18px;">
				<li><a href="index.watt">首页</a></li>
				<li><a href="project-add.watt">发起鉴定</a></li>
				<li><a href="#">关于瓦特</a></li>
			</ul>
		</div>
	</div>
</div>