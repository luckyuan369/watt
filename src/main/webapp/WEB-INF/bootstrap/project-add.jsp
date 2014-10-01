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
				<form class="form-horizontal" id="projectAddForm">
					<div id="formMessage" class="alert alert-danger alert-dismissible fade in">
						<strong>警告: </strong><span></span>
					</div>
					<fieldset>
			      	<div id="legend" class="">
			        	<legend class="">项目信息</legend>
			      	</div>
				    <input type="hidden" name="image" value="">
					<input type="hidden" name="flag" id="flag" value="">
					<input type="hidden" name="id" value="">
				    <div class="form-group">
				    	<label for="name" class="col-sm-3 control-label">项目名称：<font color="red">*</font></label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="name" placeholder="必填项 | 不超过40个字" maxlength="40">
						</div>
				    </div>
					<div class="form-group">
				    	<label for="copies" class="col-sm-3 control-label">筹集份数：<font color="red">*</font></label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="copies" placeholder="必填项 | 数字 | 不少于1份">
						</div>
				    </div>
				    <div class="form-group">
				    	<label for="limit_price" class="col-sm-3 control-label">每份金额：<font color="red">*</font></label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="limit_price" placeholder="必填项 | 数字 | 不少于1元">
						</div>
				    </div>
				    <div class="form-group">
				    	<label for="deal_days" class="col-sm-3 control-label">筹集天数：<font color="red">*</font></label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="deal_days" placeholder="必填项 | 数字 | 10~90天">
						</div>
				    </div>
					<div class="form-group">
				    	<label for="cate_id" class="col-sm-3 control-label">产品类别：<font color="red">*</font></label>
						<div class="col-sm-8">
							<label class="radio-inline">
							  <input type="radio" name="cate_id" id="inlineRadio1" value="饮料"> 饮料
							</label>
							<label class="radio-inline">
							  <input type="radio" name="cate_id" id="inlineRadio2" value="奶粉"> 奶粉
							</label>
							<label class="radio-inline">
							  <input type="radio" name="cate_id" id="inlineRadio3" value="牛奶"> 牛奶
							</label>
						</div>
				    </div>
					<div class="form-group">
				    	<label for="deal_days" class="col-sm-3 control-label">项目地点：<font color="red">&nbsp;</font></label>
						<div class="col-sm-8">
							<label style="padding-top:7px;font-weight:normal;color:grey;">目前只做上海区域</label>
						</div>
				    </div>
				   	<div class="form-group">
				    	<label for="deal_days" class="col-sm-3 control-label">项目封面：<font color="red">&nbsp;</font></label>
						<div class="col-sm-8">
							<input onclick="javascript:upd_file(this,'image_file');" type="file" id="image_file" name="image_file" value="">
							<p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过5M。建议尺寸：223 x 168px</p>
						</div>
				    </div>
					<div class="form-group">
				    	<label for="deal_days" class="col-sm-3 control-label">项目简介：<font color="red">&nbsp;</font></label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="3" name="brief" maxlength="75" placeholder="不超过75个字"></textarea>
						</div>
				    </div>
				   <div class="form-group">
				    	<label for="deal_days" class="col-sm-3 control-label">项目详情：<font color="red">&nbsp;</font></label>
						<div class="col-sm-8">
							<textarea id="Js-description" name="description" style="width:600px;height:700px;visibility:hidden;">																
								&lt;h2&gt;关于我（也可使用个性化小标题）&lt;/h2&gt;
								&lt;p&gt;向支持者介绍你自己或你的团队，并详细说明你与所发起的项目之间的背景，让支持者能够在最短时间内了解你，以拉近彼此之间的距离。&lt;/p&gt;
								&lt;h2&gt;我想要做什么（也可使用个性化小标题）&lt;/h2&gt;
								&lt;p&gt;这是项目介绍中最关键的部分，建议上传5张以上高清图片（宽700、高不限），配合文字来简洁生动地说明你的项目，让支持者对你要做的事情一目了然并充满兴趣。&lt;/p&gt;
								&lt;h2&gt;为什么我需要你的支持及资金用途（也可使用个性化小标题）&lt;/h2&gt;
								&lt;p&gt;请在这一部分说明你的项目不同寻常的特色，为什么需要大家的支持以及详细的资金用途，这会增加你项目的可信度并由此提高筹资的成功率。&lt;/p&gt;
								&lt;h2&gt;我的承诺与回报（也可使用个性化小标题）&lt;/h2&gt;
								&lt;p&gt;请在此处展示你为支持者准备的回报，回报方式将是左右项目能否筹资成功的关键因素，建议设定两个以上的回报方式，保证有趣且可行，并明确实现回报的时间。&lt;/p&gt;
								&lt;h2&gt;可能存在的风险（也可使用个性化小标题）&lt;/h2&gt;
								&lt;p&gt;请在此标注你的项目在实施过程中可能存在的风险，让支持者对你的项目有全面而清晰的认识。&lt;/p&gt;
								&lt;h2&gt;其他备注信息（也可使用个性化小标题）&lt;/h2&gt;
								&lt;p&gt;其他需要支持者了解的信息。&lt;/p&gt;
							</textarea>
						</div>
				    </div>
				    <div class="form-group">
				    	<div class="col-sm-8"></div>
				    	<div class="col-sm-4">
							<button type="button" class="btn btn-success" id="Js-save">保存草稿</button>
							<button type="button" class="btn btn-danger" id="Js-send">提交申请</button>
						</div>
				    </div>
				    </fieldset>
				  </form>
			</div>
			<div class="col-sm-6 col-md-4 " style="padding-top: 30px;">
				<div class="thumbnail list-item">
					<a href="javascript:void(0);" class="item-figure">
						<img src="images/empty_thumb.gif" id="image" alt="">
					</a>
					<h3><a id="Js-name" href="javascript:;"></a></h3>
					<div class="item-caption">
						<span class="caption-title">目标：<em id="Js-days">&nbsp;</em> 天&nbsp;&nbsp;筹集<em id="Js-copies">&nbsp;</em> 份  每份<em id="Js-price">&nbsp;</em>¥</span>
					</div>
					<div class="item-rate clearfix"></div>
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