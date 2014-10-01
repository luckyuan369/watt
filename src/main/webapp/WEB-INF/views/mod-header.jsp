<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!--mod head static-->
<div class="mod-head clearfix">
	<div class="info-left">
		<div class="portrait">
			<img src="<c:out value='${user.image}'/>">
			<div class="change-img">
				<a href="settings-avatar.watt">更换头像</a>
			</div>
		</div>
	</div>
	<div class="info-right">
		<div class="user-fun">
			<h2><c:out value='${user.user_name}'/></h2>
			<a href="settings.watt" class="btn-red-h20 btn-base common-sprite">
				<span class="common-sprite"><i class="common-sprite icon-set"></i>个人设置</span>
			</a> <a href="#" class="btn-red-h20 btn-base common-sprite">
				<span class="common-sprite"><i class="common-sprite icon-info"></i>消息中心</span>
			</a>
		</div>
		<div class="user-info">
			<p><c:out value='${user.intro}'/></p>
			<p>-</p>
			<p>加入时间：<c:out value='${user.createDate}'/></p>
			<p>所在地区：<c:out value='${user.province}'/>,<c:out value='${user.city}'/></p>
		</div>
	</div>
</div>
<!--mod head end-->