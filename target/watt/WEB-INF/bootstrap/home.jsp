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
<style type="text/css">
.wtheader {
	background-color: #4F81BD;
	text-align: center;
	color: white;
	font-size: 18px;
	margin-bottom: 4px;
}

.wtheadersub {
	text-align: center;
	font-size: 18px;
	margin-bottom: 4px;
}

.wtheaderright {
	border-right: 2px solid white;
}
.wtsub{
	clear: both;
border: 2px solid #EBEBEB;
margin-left: 15px;
margin-right: 15px;
padding-bottom: 10px;
padding-top: 5px;
margin-bottom: 15px;
}
.wtheaderleft {
	border-left: 2px solid white;
}

.fl {
	float: left;
}

.hsp img {
	width: 130px;
}

.wtrow {
	border: 2px solid #375C8A;
	margin-top: -2px;
}

.wtrowsub {
	border-bottom: 1px solid #EBEBEB;
	margin-top: -1px;
}

.wtrowc {
	text-align: center;
	padding-top: 35px;
}

.wtrowsubc {
	padding-top: 10px;
	text-align: center;
}

.wtrowsub {
	margin-left: 18px;
	margin-right: 51px;
}

.hsplogo {
	display: block;
	width: 68px;
	height: 30px;
	margin: 5px auto;
	text-align: center;
	position: relative;
}

.jdb button{
	margin-top: 50px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("button").click(function(){
		var txt = $(this).text();
		if(txt === "展开 "){
			$(this).html("收起 <span class=' glyphicon glyphicon-hand-up'></span>");
		}else{
			$(this).html("展开 <span class=' glyphicon glyphicon-hand-down'></span>");
		}
		var sub = $(this).attr("attr");
		$("#" + sub).slideToggle();
	});

		$(".wtsub").hide();
	});
</script>
</head>
<body>
	<!-- position:relative;display:inline-block;vertical-align:middle -->
	<jsp:include page="header.jsp" />

	<div class="projects-header"></div>
	<div class="container projects">
		<div class="row wtheader">
			<div class="col-md-2 wtheaderright">商品</div>
			<div class="col-md-2 wtheaderright">规格</div>
			<div class="col-md-1 wtheaderright">单价</div>
			<div class="col-md-1 wtheaderright">评价数</div>
			<div class="col-md-1 wtheaderright">好评率</div>
			
			<div class="col-md-1 wtheaderright">有害物质</div>
			<div class="col-md-2 wtheaderright">三聚氢胺</div>
			<div class="col-md-2 wtheaderright">细菌含量数量</div>
		</div>
		<div class="row wtrow">
			<div class="col-md-2 hsp">
				<img alt="" src="assets/home/gm.jpg"> 
				<button type="button" id="btn_1" class="btn btn-default" attr="sub1">展开 <span class=" glyphicon glyphicon-hand-down"></span></button>
			</div>
			<div class="col-md-2 wtrowc">光明 优+纯牛奶礼盒装250ml*12</div>
			<div class="col-md-1 wtrowc">
				最低单价<br>¥48
			</div>
			<div class="col-md-1 wtrowc">
				评论数<br>1303条
			</div>
			<div class="col-md-1 wtrowc">
				好评率<br>96%
			</div>
			<div class="col-md-4" style="margin-top: 10px;">
				<table class="table table-bordered">
					<thead>
				        <tr class="success">
				          <th>项目</th>
				          <th>实测值</th>
				          <th>国标值</th>
				          <th>欧洲标准</th>
				        </tr>
				     </thead>
			        <tbody>
				        <tr class="success">
				          <td>三聚氢胺</td>
				          <td>40PPM</td>
				          <td>100PPM</td>
				          <td>20PPM</td>
				        </tr>
				        <tr class="success">
				          <td>有害物质</td>
				          <td>0.12mg</td>
				          <td>0.2mg</td>
				          <td>0.01mg</td>
				        </tr>
				        <tr class="success">
				          <td>细菌含量</td>
				          <td>20000/ml</td>
				          <td>10000/ml</td>
				          <td>10000/ml</td>
				        </tr>
				      </tbody>
				</table>
			</div>
			<div class="col-md-1 jdb" style="margin-top: 10px;">
				<button type="button" class="btn btn-success">已购 <br>报告</button>
			</div>
			<div class="wtsub" id="sub1">
				<div class="row wtheadersub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 wtheaderright"></div>
					<div class="col-md-2 wtheaderright">价格</div>
					<div class="col-md-2 wtheaderright">点评数</div>
					<div class="col-md-2 wtheaderright">好评率</div>
					<div class="col-md-3 wtheaderright"></div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/jingdong.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥48</div>
					<div class="col-md-2 wtrowsubc">310条</div>
					<div class="col-md-2 wtrowsubc">96%</div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/suning.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥49</div>
					<div class="col-md-2 wtrowsubc">340条</div>
					<div class="col-md-2 wtrowsubc">96%</div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/yihaodian.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥50</div>
					<div class="col-md-2 wtrowsubc">320条</div>
					<div class="col-md-2 wtrowsubc">96%</div>
				</div>
				<div class="row"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/yixun.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥51</div>
					<div class="col-md-2 wtrowsubc">333条</div>
					<div class="col-md-2 wtrowsubc">96%</div>
				</div>
			</div>
		</div>
		<div class="row wtrow">
			<div class="col-md-2 hsp">
				<img alt="" src="assets/home/msla.jpg"> 
				<button type="button" class="btn btn-default" id="btn2" attr="sub2">展开 <span class=" glyphicon glyphicon-hand-down"></span></button>
			</div>
			<div class="col-md-2 wtrowc">光明莫斯利安 巴氏杀菌酸牛奶200g*12盒钻石装</div>
			<div class="col-md-1 wtrowc">
				最低单价<br>¥59
			</div>
			<div class="col-md-1 wtrowc">
				评论数<br>2110条
			</div>
			<div class="col-md-1 wtrowc">
				好评率<br>93.25%
			</div>
			<div class="col-md-4" style="margin-top: 10px;">
				<table class="table table-bordered">
					<thead>
				        <tr class="info">
				          <th>项目</th>
				          <th>实测值</th>
				          <th>国标值</th>
				          <th>欧洲标准</th>
				        </tr>
				     </thead>
			        <tbody>
				        <tr class="info">
				          <td>三聚氢胺</td>
				          <td>40PPM</td>
				          <td>100PPM</td>
				          <td>20PPM</td>
				        </tr>
				        <tr class="info">
				          <td>有害物质</td>
				          <td>0.12mg</td>
				          <td>0.2mg</td>
				          <td>0.01mg</td>
				        </tr>
				        <tr class="info">
				          <td>细菌含量</td>
				          <td>20000/ml</td>
				          <td>10000/ml</td>
				          <td>10000/ml</td>
				        </tr>
				      </tbody>
				</table>
			</div>
			<div class="col-md-1 jdb" style="margin-top: 10px;">
				<button type="button" class="btn btn-info">购买<br/>报告</button>
			</div>
			<div class="wtsub" id="sub2">
				<div class="row wtheadersub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 wtheaderright"></div>
					<div class="col-md-2 wtheaderright">价格</div>
					<div class="col-md-2 wtheaderright">点评数</div>
					<div class="col-md-2 wtheaderright">好评率</div>
					<div class="col-md-3 wtheaderright"></div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/jingdong.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥59</div>
					<div class="col-md-2 wtrowsubc">564条</div>
					<div class="col-md-2 wtrowsubc">92%</div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/suning.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥60</div>
					<div class="col-md-2 wtrowsubc">430条</div>
					<div class="col-md-2 wtrowsubc">94%</div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/yihaodian.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥61</div>
					<div class="col-md-2 wtrowsubc">980条</div>
					<div class="col-md-2 wtrowsubc">91%</div>
				</div>
				<div class="row"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/yixun.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥62</div>
					<div class="col-md-2 wtrowsubc">350条</div>
					<div class="col-md-2 wtrowsubc">96%</div>
				</div>
			</div>
		</div>
		<div class="row wtrow">
			<div class="col-md-2 hsp">
				<img alt="" src="assets/home/chuzhen.jpg"> 
				<button type="button" class="btn btn-default" id="btn3" attr="sub3">展开 <span class=" glyphicon glyphicon-hand-down"></span></button>
			</div>
			<div class="col-md-2 wtrowc">光明优＋纯牛奶250ml/盒 1提12盒</div>
			<div class="col-md-1 wtrowc">
				最低单价<br>¥42
			</div>
			<div class="col-md-1 wtrowc">
				评论数<br>820条
			</div>
			<div class="col-md-1 wtrowc">
				好评率<br>93.75%
			</div>
			<div class="col-md-4" style="margin-top: 10px;">
				<table class="table table-bordered">
					<thead>
				        <tr class="info">
				          <th>项目</th>
				          <th>实测值</th>
				          <th>国标值</th>
				          <th>欧洲标准</th>
				        </tr>
				     </thead>
			        <tbody>
				        <tr class="info">
				          <td>三聚氢胺</td>
				          <td>40PPM</td>
				          <td>100PPM</td>
				          <td>20PPM</td>
				        </tr>
				        <tr class="info">
				          <td>有害物质</td>
				          <td>0.12mg</td>
				          <td>0.2mg</td>
				          <td>0.01mg</td>
				        </tr>
				        <tr class="info">
				          <td>细菌含量</td>
				          <td>20000/ml</td>
				          <td>10000/ml</td>
				          <td>10000/ml</td>
				        </tr>
				      </tbody>
				</table>
			</div>
			<div class="col-md-1 jdb" style="margin-top: 10px;">
				<button type="button" class="btn btn-info">购买<br/>报告</button>
			</div>
			<div class="wtsub" id="sub3">
				<div class="row wtheadersub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 wtheaderright"></div>
					<div class="col-md-2 wtheaderright">价格</div>
					<div class="col-md-2 wtheaderright">点评数</div>
					<div class="col-md-2 wtheaderright">好评率</div>
					<div class="col-md-3 wtheaderright"></div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/jingdong.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥45.9</div>
					<div class="col-md-2 wtrowsubc">100条</div>
					<div class="col-md-2 wtrowsubc">96%</div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/suning.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥46</div>
					<div class="col-md-2 wtrowsubc">320条</div>
					<div class="col-md-2 wtrowsubc">92%</div>
				</div>
				<div class="row wtrowsub"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/yihaodian.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥47</div>
					<div class="col-md-2 wtrowsubc">150条</div>
					<div class="col-md-2 wtrowsubc">93%</div>
				</div>
				<div class="row"
					style="margin-left: 19px; margin-right: 52px;">
					<div class="col-md-3 hsplogo">
						<img alt="" src="assets/home/yixun.gif">
					</div>
					<div class="col-md-2 wtrowsubc">¥42</div>
					<div class="col-md-2 wtrowsubc">250条</div>
					<div class="col-md-2 wtrowsubc">94%</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="footer.jsp" />
	<script src="lib/jquery/plug-in/ajaxfileupload.js"></script>
	<link rel="stylesheet"
		href="lib/kindeditor-4.1.10/themes/default/default.css">
	<script src="lib/kindeditor-4.1.10/kindeditor-min.js"></script>
	<script src="lib/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script type="text/javascript" src="assets/js/project-add.js"></script>
</body>
</html>