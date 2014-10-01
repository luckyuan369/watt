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
								<input name="name" type="text" class="inp-w310" value="<c:out value='${project.name}'/>" maxlength="40" placeholder="名称不可超过40个字">
							</div>
							<div class="form-item clearfix">
								<label>筹集份数：</label>
								<input name="copies" type="text" value="<c:out value='${project.copies}'/>" placeholder="不少于1份">
							</div>
							<div class="form-item clearfix">
								<label>每份金额：</label>
								<input name="limit_price" type="text" value="<c:out value='${project.limit_price}'/>" placeholder="不少于1元">
							</div>
							<div class="form-item clearfix">
								<label>筹集天数：</label>
								<input name="deal_days" type="text" value="<c:out value='${project.deal_days}'/>" placeholder="10~90天">
							</div>
							<div class="form-item clearfix">
								<label>产品类别：</label>
								<div id="Js-select-cate" class="option-sort">
									<span data-id="12">饮料</span> <span data-id="22">奶粉</span> <span data-id="13">牛奶</span></div>
								<input id="Js-cate" class="hidden" name="cate_id" value="<c:out value='${project.cate_id}'/>">
							</div>
							<div class="form-item clearfix">
								<label>项目地点：</label>
								<div class="option-box">上海 &nbsp;<span class="gray">目前只做上海区域</span></div>
							</div>
							<div class="form-item clearfix">
								<label>项目封面：</label>
								<div class="up-btn">
									<div class="ipt-file">
										<input onclick="javascript:upd_file(this,'image_file');" type="file" id="image_file" name="image_file" value="">
										<a class="btn-base common-sprite btn-red-h30">
											<span class="common-sprite">上传封面</span>
										</a>
									</div>
									<span class="gray">支持jpg、jpeg、png、gif格式，大小不超过5M。建议尺寸：223 x 168px</span>
								</div>
							</div>
							<div class="form-item clearfix">
								<label>项目简介：</label>
								<textarea style="width:60%;height:30px" name="brief" maxlength="75" placeholder="不超过75个字"><c:out value='${project.brief}'/></textarea>
							</div>
							<div class="form-item clearfix">
								<label>项目详情：</label>
								<textarea id="Js-description" name="description"><c:out value='${project.description}'/></textarea>
							</div>
							<input type="hidden" name="image" value="<c:out value='${project.image}'/>">
							<input type="hidden" name="flag" id="flag" value="">
							<input type="hidden" name="id" value="<c:out value='${project.id}'/>">
							
							<div class="action tr">
								<a type="submit" href="javascript:void(0);" id="Js-edit" class="btn-base btn-red-h48 common-sprite">
									<span class="common-sprite">保存草稿</span>
								</a>
								<a type="submit" href="javascript:void(0);" id="Js-send" class="btn-base btn-red-h48 common-sprite">
									<span class="common-sprite">提交申请</span>
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
	$("input[name='name']").blur(function(){
		$("#Js-name").text($(this).val());
	});
	$("input[name='copies']").blur(function(){
		$("#Js-copies").text("筹集份数: "+$(this).val()+"份");
	});
	$("input[name='limit_price']").blur(function(){
		$("#Js-price").text("每份 ￥"+$(this).val());
	});
	$("input[name='deal_days']").blur(function(){
		$("#Js-days").text($(this).val()+"天");
	});
	
	$("#Js-select-cate").delegate('span', 'click', function(event) {
		$(this).addClass('select').siblings().removeClass('select');
		$("#Js-cate").val($(this).attr("data-id"));
	});
	
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
	var editor = KindEditor.create("#Js-description",kindeditorOption)
	window['HwForm_before'] = function() {
		$("#Js-description").val(editor.html());
		return true;
	};
</script>
<script type="text/javascript">
$(document).ready(function(){
	var is_submiting = false;
	var jsCate = $("#Js-cate").val();
	$(".option-sort").find("span").each(function(){
		if(jsCate === $(this).attr("data-id")){
			$(this).addClass("select");
		}else{
			$(this).removeClass("select");
		}
	});
	
	function jmzgetLength(str) {
		var realLength = 0, len = str.length, charCode = -1;
		for (var i = 0; i < len; i++) {
		charCode = str.charCodeAt(i);
		if (charCode >= 0 && charCode <= 128) realLength += 1;
			else realLength += 2;
		}
		return realLength;
	}
	
	function checkForm(action){
		if(is_submiting) return false;
		var id = $.trim($("#JS-project_add_form").find("input[name='id']").val());
		var name = $.trim($("#JS-project_add_form").find("input[name='name']").val());
		var copies = $.trim($("#JS-project_add_form").find("input[name='copies']").val());
		var limit_price = $.trim($("#JS-project_add_form").find("input[name='limit_price']").val());
		var deal_days = $.trim($("#JS-project_add_form").find("input[name='deal_days']").val());
		var cate_id = $.trim($("#JS-project_add_form").find("input[name='cate_id']").val());
		var image = $.trim($("#JS-project_add_form").find("input[name='image']").val());
		var brief = $.trim($("#JS-project_add_form").find("textarea[name='brief']").val());
		var description = editor.html();
		
		if(!wx.validator.rule.required(name)) {
			wx.alert("请输入项目名称");
			return false;
		}
		if(!wx.validator.rule.maxLength(name,40)) {
			wx.alert("项目名称不可超过40个字");
			return false;
		}
		if(!wx.validator.rule.required(copies)) {
			wx.alert("请输入筹集份数");
			return false;
		}
		if(!wx.validator.rule.digits(copies)) {
			wx.alert("筹集份数需填写数字");
			return false;
		}
		if(!wx.validator.rule.min(copies,1)) {
			wx.alert("筹集份数最少为1份");
			return false;
		}
		
		if(!wx.validator.rule.required(limit_price)) {
			wx.alert("请输入每份金额");
			return false;
		}
		if(!wx.validator.rule.digits(limit_price)) {
			wx.alert("每份金额需填写数字");
			return false;
		}
		if(!wx.validator.rule.min(limit_price,1)) {
			wx.alert("每份金额最少为1元");
			return false;
		}
		
		if(!wx.validator.rule.required(deal_days)) {
			wx.alert("请输入筹集天数");
			return false;
		}
		if(!wx.validator.rule.digits(deal_days)) {
			wx.alert("筹集天数需填写数字");
			return false;
		}
		if(!wx.validator.rule.range(deal_days,"10-90")) {
			wx.alert("筹集天数10~90天");
			return false;
		}
		
		if(!wx.validator.rule.required(cate_id)) {
			wx.alert("请选择产品类别");
			return false;
		}
		
		if(!wx.validator.rule.required(brief)) {
			wx.alert("请输入项目简介");
			return false;
		}
		if(!wx.validator.rule.maxLength(brief,75)) {
			wx.alert("项目简介不可超过40个字");
			return false;
		}
		is_submiting = true;
		var ajaxurl = action;
		var query = new Object();
		query.id = id;
		query.name = name;
		query.copies = copies;
		query.limit_price = limit_price;
		query.deal_days = deal_days;
		query.cate_id = cate_id;
		query.image = image;
		query.brief = brief;
		query.description = description;
		$.ajax({
			url: ajaxurl,
			dataType: "json",
			data:query,
			type: "POST",
			success: function(ajaxobj){
				is_submiting = false;
				if(ajaxobj.status==1)
				{
					wx.alert(ajaxobj.info, function() {
						window.location.href = ajaxobj.url;
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
	
	$("#Js-edit").click(function(){
		checkForm("project-update.watt");
	});
	$("#Js-send").click(function(){
		checkForm("project-send.watt");
	});
});
</script>
<!--main end-->
<!--footer static-->
<jsp:include page="footer.jsp"/>
</body>
</html>