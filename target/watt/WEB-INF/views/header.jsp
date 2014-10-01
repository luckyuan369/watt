<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.watt.framework.home.domain.User" %>
<!--header static-->
<div class="header">
	<div class="wrap" pbid="header">
		<div class="img-logo">
			<h1>
				<a alt="瓦特鉴定网" class="ie6fixpic" title="瓦特鉴定网" href="index.watt">瓦特鉴定网</a>
			</h1>
		</div>
		<!--menu start-->
		<div class="menu">
			<ul class="clearfix">
				<li><a href="index.watt">首页 </a></li>
				<li><a href="project-add.watt">发起鉴定 </a></li>
				<li><a href="#">新手帮助 </a></li>
				<li><a href="#">关于瓦特 </a></li>
			</ul>
		</div>
		<!--menu end-->
		<!--search start-->
		<div class="search common-sprite ie6fixpic sw">
			<form action="/deals" method="post" id="header_new_search_form" wx-validator="" autocomplete="off">
				<input type="text" name="k" wx-validator-placeholder="搜索" wx-validator-rule="required" class="search-key gray"
					wx-validator-notip="" placeholder="搜索"> 
					<input id="Js-search-submit" type="submit" class="btn-search ie6fixpic">
			</form>
		</div>
		<!--search end-->
		<% 
			Object object = request.getSession().getAttribute("user");
			if(object !=  null){ 
			User user = (User)object;
			%>
				<div class="user-menu" id="jsddm">
			      <div class="menu-hd tx">
			        <a href="#" class="tit">
			          <span class="avatar-box">
			            <img id="headeravatar" src="<c:out value='${user.image}'/>">
			          </span>
			          <span class="user-name word-break ie6fixpic"><%=user.getUser_name()%></span>
			        </a>
			      </div>
			      <div class="menu-bd JS-myinfo" style="display: none;">
			        <ul class="clearfix">
		              <li class="sup"><a class="ie6fixpic" href="home-support.watt">支持的鉴定</a></li>
		              <li class="spo"><a class="ie6fixpic" href="home-build_deal.watt">发起的鉴定</a></li>
		              <li class="att"><a class="ie6fixpic" href="home-focus.watt">喜欢的鉴定</a></li>
		              <c:if test="${user.role == '管理员' }">
		              	<li class="att"><a class="ie6fixpic" href="home-verify_deal.watt">审核鉴定</a></li>
		              </c:if>
		              <li class="msg"><a class="ie6fixpic" href="#">消息中心</a></li>
		              <li class="set"><a class="ie6fixpic" href="settings.watt">个人设置</a></li>
		              <li class="exit bn"><a class="ie6fixpic" href="user-loginout.watt">退出</a></li>
			        </ul>
			      </div>
			    </div>
		<%}else{%>
			 <!--login start-->
			<div class="login-wrap">
				<a href="user-login.watt">登录</a> <em>|</em> <a href="user-register.watt">注册</a>
			</div>
			<!--login end-->
		<%}%>
		
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".menu li:first").addClass("select");
	$(".menu li").click(function(){
		console.log(this);
	});
});
</script>
<!--header-end-->