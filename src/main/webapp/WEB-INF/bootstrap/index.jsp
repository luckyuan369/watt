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
<script type="text/javascript" src="assets/js/watt.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<!-- Carousel ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>鉴定项目1.</h1>
              <p>鉴定项目详情1</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">了解更多1</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="data:image/gif;base64,R0lGODlhAQABAIAAAGZmZgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>鉴定项目2.</h1>
              <p>鉴定项目详情2</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">了解更多2</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="data:image/gif;base64,R0lGODlhAQABAIAAAFVVVQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>鉴定项目3.</h1>
              <p>鉴定项目详情3</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">了解更多3</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
	<!-- /.carousel -->
	
	<div class="container projects">
		<div class="projects-header"></div>
		<div class="row">
			<c:forEach var="project" items="${listProject}">
				<div class="col-sm-6 col-md-4 ">
					<div class="thumbnail list-item">
						<a href="deal-show.watt?id=<c:out value='${project.id }'></c:out>" target="_blank" class="item-figure">
							<img src="<c:out value='${project.image }'></c:out>" data-src="<c:out value='${project.image }'></c:out>"
							alt="<c:out value='${project.brief }'></c:out>" title="<c:out value='${project.brief }'></c:out>">
						</a>
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
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- /.container -->
	<!-- FOOTER -->
	<jsp:include page="footer.jsp"/>
</body>
</html>