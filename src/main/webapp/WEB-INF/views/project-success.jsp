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
<script src="lib/jquery/ajaxPager.js"></script>
<link rel="stylesheet" href="lib/jquery/ajaxPager.css">

<!-- watt自定义的JS文件 -->
<script src="js/watt.js"></script>
</head>
<body>
	<!--header static-->
	<div class="header">
		<div class="wrap" pbid="header">
			<div class="img-logo">
				<h1>
					<a alt="众筹网" class="ie6fixpic" title="众筹网" href="/index">众筹网</a>
				</h1>
			</div>
			<!--menu start-->
			<div class="menu">
				<ul class="clearfix">
					<li><a href="/index">首页 </a></li>
					<li><a href="/browse">浏览项目 </a></li>
					<li><a href="/open">开放平台 </a></li>
					<li><a href="/partake">新手帮助 </a></li>
					<li class="select"><a href="/project">发起项目 </a></li>
					<!--<li><a href="/help-about/id-1">关于众筹 </a></li>-->
					<!-- <li><a href="/browse-showstock">股权众筹 </a></li> -->
				</ul>
			</div>
			<!--menu end-->
			<!--search start-->
			<div class="search common-sprite ie6fixpic sw">
				<form action="/deals" method="post" id="header_new_search_form"
					wx-validator="" autocomplete="off">
					<input type="text" name="k" wx-validator-placeholder="搜索"
						wx-validator-rule="required" class="search-key gray"
						wx-validator-notip="" placeholder="搜索"> <input
						id="Js-search-submit" type="submit" class="btn-search ie6fixpic">
				</form>
			</div>
			<!--search end-->

			<!-- user menu start-->
			<div class="user-menu" id="jsddm">
				<div class="menu-hd tx">
					<a href="/home/id-222338" class="tit"> <span class="avatar-box">
							<img id="headeravatar"
							src="http://zrstatic.wangxingroup.com/avatar/000/22/23/38virtual_avatar_small.jpg?v=1401643633">
					</span> <span class="user-name word-break ie6fixpic">Lucky…</span>
					</a>
				</div>
				<div class="menu-bd JS-myinfo">
					<ul class="clearfix">
						<ul>
							<li class="sup"><a class="ie6fixpic" href="/home/id-222338">支持的项目</a></li>
							<li class="spo"><a class="ie6fixpic"
								href="/home-build_deal/id-222338">发起的项目</a></li>
							<li class="att"><a class="ie6fixpic"
								href="/home-focus/id-222338">喜欢的项目</a></li>
							<li class="msg"><a class="ie6fixpic" href="/message">消息中心</a></li>
							<li class="set"><a class="ie6fixpic" href="/settings">个人设置</a></li>
							<li class="exit bn"><a class="ie6fixpic"
								href="/user-loginout">退出</a></li>
						</ul>
					</ul>
				</div>
			</div>
			<!-- user menu end-->

		</div>
	</div>
	<!--header-end-->
	<link rel="stylesheet" type="text/css" href="css/project_add.css">
	<!--main static-->
	<div class="main clearfix">
		<div class="wrap clearfix">
			<!--flow step static-->
			<!--flow step end-->
			<div class="radius-hd">
				<div class="radius-hl common-sprite"></div>
				<div class="radius-hc w950"></div>
				<div class="radius-hr common-sprite"></div>
			</div>
			<div class="radius-bd project-con w958">
				<div class="tit-wrap">
					<h3>完成</h3>
				</div>
				<div class="operating-tips clearfix">
					<!--<div class="icon-error"></div>-->
					<div class="icon-success"></div>
					<h3>恭喜您，您申请的项目已成功提交，我们将对项目进行审核，请耐心等待。</h3>
					<p>
						<br>现在可以进入：<a class="red" href="home-build_deal.watt?id=222338">个人中心</a>&nbsp;
						<!-- <span class="gray">(<em>3</em>秒后自动跳转)</span> -->
					</p>
				</div>
			</div>
			<div class="radius-ft">
				<div class="radius-fl common-sprite"></div>
				<div class="radius-fc w950"></div>
				<div class="radius-fr common-sprite"></div>
			</div>
		</div>
	</div>
	<!--main end-->
	<!--footer static-->
	<jsp:include page="footer.jsp"/>
</body>
</html>