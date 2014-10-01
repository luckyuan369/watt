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
</head>
<body>
	<!-- position:relative;display:inline-block;vertical-align:middle -->
	<jsp:include page="header.jsp"/>
	
	<div class="projects-header"></div>
	<div class="container projects">
		<div class="row">
			<div class="col-sm-6 col-md-8">
				<h1 class="word-break" style="padding-left: 20px;">
					<c:out value="${project.name}"/>
				</h1>
				<div class="author">
					<span class="author-lay common-sprite inline-block">发起人</span>
					<span><a href="#"><c:out value="${user.user_name}" /></a></span>
					<span class="gray"><c:out value="${user.province}" />&nbsp;<c:out value="${user.city}" /></span>
				</div>
				<br/>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist" style="padding-left: 20px;">
					<li class="active"><a href="#home" role="tab" data-toggle="tab">项目主页</a></li>
				  	<li><a href="#support" role="tab" data-toggle="tab">支持者(<c:out value="${suppoter}" />)</a></li>
				</ul>
				<input type="hidden" id="">
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="home" style="padding: 20px;min-height: 400px;">
					  	<c:out value="${project.description}" escapeXml="false" />
					  	<div class="comment com-pro">
							<div class="flbq">
								<div class="flei">
									分类： <span class="red"><c:out value="${project.cate_id}" /></span>
								</div>
								<div class="fr">
									<div class="share">
										<!-- JiaThis Button BEGIN -->
										<div class="jiathis_style">
											<span class="jiathis_txt">分享到：</span><a class="jiathis_button_tsina"></a>
											<a class="jiathis_button_tqq"></a>
											<a class="jiathis_button_weixin"></a>
											<a class="jiathis_button_renren"></a>
											<a class="jiathis_button_douban"></a>
											<a class="jiathis_button_xiaoyou"></a>
											<a class="jiathis_button_cqq"></a> <a
												href="http://www.jiathis.com/share"
												class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis"
												target="_blank"></a> <a class="jiathis_counter_style"></a>
										</div>
										<script type="text/javascript">
											$(document).ready(function(){
												var jiathis_config={
														url: window.location.href,
														summary:"<c:out value="${project.name}"/>",
														title:"#瓦特网# 我在瓦特网  关注了项目  #<c:out value='${project.name}'/># ",
														hideMore:false
													};
											});
										</script>
										<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
										<!-- JiaThis Button END -->
									</div>
								</div>
							</div>
						</div>
				  	</div>
				  	<div class="tab-pane" id="support" style="padding: 20px;min-height: 400px;">
				  		<!--support box static-->
						<div class="support-box">
							<ul class="clearfix">
								<c:forEach items="${listSuppoter}" var="suppoter">
									<li>
										<div class="sup-face">
											<a href="#">
												<img src="${suppoter.user.image}"></a>
										</div>
										<div class="sup-info">
											<div class="sup-hd clearfix">
												<span class="sup-name"><a href="#">${suppoter.user.user_name}</a></span>
												<!-- <a href="javascript:send_message(275845);" class="btn-base btn-red-h20 common-sprite">
													<span class="common-sprite">发私信</span>
												</a> -->
											</div>
											<p>购买<span class="red"> ${suppoter.copies} </span>份</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!--support box end-->
				  	</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4 " style="margin-top: 30px;">
				<div class="thumbnail list-item">
						<img src="<c:out value='${project.image }'></c:out>" data-src="<c:out value='${project.image }'></c:out>"
							alt="<c:out value='${project.brief }'></c:out>" title="<c:out value='${project.brief }'></c:out>">
						<div class="item-upvote">
							<c:if test="${project.isFocus == 'Y' }">
								<a class="icons liked" href="javascript:void(0);" rel="<c:out value='${project.attention }'></c:out>"><c:out value='${project.attention }'></c:out></a>
							</c:if>
							<c:if test="${project.isFocus != 'Y' }">
								<a class="icons" href="javascript:void(0);" rel="<c:out value='${project.attention }'></c:out>" onclick="like_deal_v2(<c:out value='${project.id }'></c:out>, this)"><c:out value='${project.attention }'></c:out></a>
							</c:if>
						</div>
						<h3>
							<a href="deal-show.watt?id=<c:out value='${project.id }'></c:out>" target="_blank"><c:out value='${project.name }'></c:out></a>
						</h3>
						<div class="item-caption">
							<span class="caption-title">目标：<em><c:out value='${project.deal_days }'></c:out></em> 天 <em><c:out value='${project.copies }'></c:out></em> 份  每份<em><i class="font-yen">¥</i><c:out value='${project.limit_price }'></c:out></em></span>
							<span class="btn-base btn-red-h20 common-sprite">
								<span class="common-sprite">【<c:out value='${project.status }'></c:out>】</span>
							</span>
						</div>
						<div class="progress-bar"><span class="progress bg-red" style="width: <c:out value='${project.css_percent }'></c:out>%;"></span></div>
						<div class="item-rate clearfix"><span class="rate1"> <em><c:out value='${project.percent }'></c:out>%</em><br>已达</span><span class="rate2"> <em><c:out value='${project.supporterCopies }'></c:out>份</em><br>已购份额</span><span class="rate3"> <em><c:out value='${project.remain_days }'></c:out>天</em><br>剩余时间</span></div>
						<div style="padding-bottom: 10px;">
							<button type="button" class="btn btn-danger" style="width:100%">点击购买</button>
						</div>
						
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="footer.jsp"/>
	<script src="lib/jquery/plug-in/ajaxfileupload.js"></script>
	<link rel="stylesheet" href="lib/kindeditor-4.1.10/themes/default/default.css">
	<script src="lib/kindeditor-4.1.10/kindeditor-min.js"></script>
	<script src="lib/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script type="text/javascript" src="assets/js/project-add.js"></script>
</body>
</html>