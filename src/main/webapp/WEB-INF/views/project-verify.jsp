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
<script src="lib/jquery/plug-in/ajaxfileupload.js"></script>
<!-- watt自定义的JS文件 -->
<script src="js/watt.js"></script>
<style type="text/css">
	.content{
		font-size: 14px;
		line-height: 28px;
		
	}
</style>
</head>
<body>
<!--header static-->
<jsp:include page="header.jsp"/>
<!--header-end-->
<link rel="stylesheet" type="text/css" href="css/project_add.css">
<script type="text/javascript" src="js/watt_add.js"></script>
<!--main static-->
<div class="main clearfix">
	<div class="wrap clearfix">
		<!--content static-->
		<div class="content fl">
			<!--project start-->
			<div class="project-box">
				<div class="radius-hd">
					<div class="radius-hl common-sprite"></div>
					<div class="radius-hc w705"></div>
					<div class="radius-hr common-sprite"></div>
				</div>
				<div class="radius-bd project-con w713">
					<form method="post" id="JS-project_add_form">
						<div class="tit-wrap">
							<h3>项目信息</h3>
						</div>
						<div class="project-edit">
							<div class="form-item clearfix">
								<label>项目名称：</label>
								<span style="content"><c:out value='${project.name}'/></span>
							</div>
							<div class="form-item clearfix">
								<label>筹集份数：</label>
								<span style="content"><c:out value='${project.copies}'/>份</span>
							</div>
							<div class="form-item clearfix">
								<label>每份金额：</label>
								<span style="content"><c:out value='${project.limit_price}'/>元</span>
							</div>
							<div class="form-item clearfix">
								<label>筹集天数：</label>
								<span style="content"><c:out value='${project.deal_days}'/>天</span>
							</div>
							<div class="form-item clearfix">
								<label>产品类别：</label>
								<c:if test="${project.cate_id == '12' }">
									<span style="content">饮料</span>
								</c:if>
								<c:if test="${project.cate_id == '22' }">
									<span style="content">奶粉</span>
								</c:if>
								<c:if test="${project.cate_id == '13' }">
									<span style="content">牛奶</span>
								</c:if>
							</div>
							<div class="form-item clearfix">
								<label>项目地点：</label>
								<span style="content">上海</span>
							</div>
							<div class="form-item clearfix">
								<label>项目封面：</label>
								<span style="content"><c:out value='${project.image}'/></span>
							</div>
							<div class="form-item clearfix">
								<label>项目简介：</label>
								<span style="content"><c:out value='${project.brief}'/></span>
							</div>
							<div class="form-item clearfix">
								<label>项目详情：</label>
								<textarea id="Js-description" name="description"><c:out value='${project.description}'/></textarea>
							</div>
							<input type="hidden" name="status" value="<c:out value='${project.status}'/>">
							<input type="hidden" name="id" value="<c:out value='${project.id}'/>">
							
							<div class="action tr">
								<a type="submit" href="javascript:void(0);" id="Js-pass" class="btn-base btn-red-h48 common-sprite">
									<span class="common-sprite">审核通过</span>
								</a>
								<a type="submit" href="javascript:void(0);" id="Js-reject" class="btn-base btn-red-h48 common-sprite">
									<span class="common-sprite">驳回申请</span>
								</a>
							</div>
						</div>
					</form>
				</div>
				<div class="radius-ft">
					<div class="radius-fl common-sprite"></div>
					<div class="radius-fc w705"></div>
					<div class="radius-fr common-sprite"></div>
				</div>
			</div>
			<!--project end-->
		</div>
		<!--content end-->
		<!--side static-->
		<div class="sidebar fr">
			<!--list item static-->
			<div class="block-list">
				<div class="list-item">
					<a class="image item-figure" href="javascript:void(0);" title=""><img id="image" width="225" height="216" src="<c:out value='${project.image}'/>" alt=""> </a>
					<h3><a id="Js-name" href="javascript:;"><c:out value='${project.name}'/></a></h3>
					<div class="item-caption">
						<span class="caption-title">目标：<span id="Js-days"><c:out value='${project.deal_days}'/>天</span>&nbsp;&nbsp;&nbsp;<span id="Js-price">每份￥<c:out value='${project.limit_price}'/></span>
							<br>
							<span id="Js-copies">筹集份数：<c:out value='${project.copies}'/>份</span>
						</span>
					</div>
				</div>
			</div>
		</div>
		<!--side end-->
	</div>
</div>
<script>
	var kindeditorOption = {
		basePath:"lib/kindeditor-4.1.10/",
		resizeType : 1,
		allowPreviewEmoticons : false,

		allowMediaUpload:false,
		allowFileUpload:false,
		allowFlashUpload:false,

		allowFileManager:false,
		allowImageRemote:false,
		filePostName:"image_file",
		minWidth : "567",
		minHeight: "500",
		uploadJson :"/upload.php",
		items : ['formatblock', '|', 'image', 'link', 'removeformat']
	};
	var editor = KindEditor.create("#Js-description",kindeditorOption);
	editor.readonly();
	window['HwForm_before'] = function() {
		$("#Js-description").val(editor.html());
		return true;
	};
</script>
<script type="text/javascript">
$(document).ready(function(){
	var is_submiting = false;
	function checkForm(action){
		if(is_submiting) return false;
		var id = $.trim($("#JS-project_add_form").find("input[name='id']").val());
		var status = $.trim($("#JS-project_add_form").find("input[name='status']").val());
		
		if(status !== '审核中') {
			wx.alert("项目不处于审核状态!");
			return false;
		}
		
		is_submiting = true;
		var ajaxurl = action;
		var query = new Object();
		query.id = id;
		query.status = status;
		$.ajax({
			url: ajaxurl,
			dataType: "json",
			data:query,
			type: "POST",
			success: function(ajaxobj){
				is_submiting = false;
				if(ajaxobj.status==1)
				{
					wx.alert(ajaxobj.info , function() {
						window.location.href = "home-verify_deal.watt";
					});
				} else {
					if (ajaxobj.errorMes != "") {
						wx.alert(ajaxobj.errorMes);
						return;
					}
					wx.alert("操作错误");
				};
			},
			error:function(ajaxobj)
			{
				is_submiting = false;
				wx.alert('网络错误');
			}
		});
		return false;
	}
	
	$("#Js-pass").click(function(){
		checkForm("project-pass.watt");
	});
	$("#Js-reject").click(function(){
		checkForm("project-reject.watt");
	});
});
</script>
<!--main end-->
<!--footer static-->
<jsp:include page="footer.jsp"/>
</body>
</html>