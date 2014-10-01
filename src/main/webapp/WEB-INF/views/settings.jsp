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
	<jsp:include page="header.jsp" />
	<!--header-end-->
	<script type="text/javascript" src="js/settings.js"></script>
	<link rel="stylesheet" type="text/css" href="css/settings.css">
	<!--main static-->
	<div class="main clearfix">
		<div class="setting wrap">
			<div class="setting-title clearfix">
				<h3>个人设置</h3>
				<a href="home-support.watt">返回个人中心</a>
			</div>
			<div class="setting-content clearfix">
				<div class="setting-menu">
					<ul class="clearfix">
						<li class="select"><a class="icons info ie6fixpic" href="settings.watt">资料修改</a></li>
						<li class=""><a class="icons password ie6fixpic" href="settings-password.watt">密码修改</a></li>
						<li><a class="icons portrait ie6fixpic" href="settings-avatar.watt">头像修改</a></li>
					</ul>
				</div>
				<div class="setting-detail">
					<!--setting-form static-->
					<form class="setting-form" name="modify" action="settings-save_index.watt" wx-validator="" wx-validator-error-class="error-text" wx-validator-ajax=""
						autocomplete="off">
						<input type="hidden" name="id" value="<c:out value="${user.id}"/>">
						<div class="form-item clearfix">
							<label class="red">邮箱：</label>
							<p class="form-msg red"><c:out value="${user.email}"/></p>
						</div>
						
						<div class="form-item clearfix">
							<label class="red">用户名：</label>
							<input type="text" value="<c:out value="${user.user_name}"/>" name="user_name" wx-validator-rule="required|byteRangeLength"
								wx-validator-param="|4-24" wx-validator-user_name-byterangelength="2到12个汉字或4到24个字符"
								title="用户名三十天内只可以修改一次">
							<p class="input-notes2">用户名三十天内只可以修改一次</p>
						</div>

						<div class="form-item clearfix">
							<label>性别：</label>
							<div class="sex-box">
								<input type="radio" name="sex" value="1/"><span>男</span>
								<input type="radio" name="sex" value="0/"><span>女</span>
								<input type="radio" name="sex" value="-1"><span>保密</span>
							</div>
						</div>
						<div class="form-item clearfix">
							<label>所在地：</label>
							<div class="option-box">
								<select name="province" wx-validator-error-value="选择省份">
									<option>选择省份</option>
									<option value="安徽" rel="3">安徽</option>
									<option value="澳门" rel="396">澳门</option>
									<option value="北京" rel="52">北京</option>
									<option value="福建" rel="4">福建</option>
									<option value="甘肃" rel="5">甘肃</option>
									<option value="广东" rel="6">广东</option>
									<option value="广西" rel="7">广西</option>
									<option value="贵州" rel="8">贵州</option>
									<option value="海南" rel="9">海南</option>
									<option value="河北" rel="10">河北</option>
									<option value="黑龙江" rel="12">黑龙江</option>
									<option value="河南" rel="11">河南</option>
									<option value="湖北" rel="13">湖北</option>
									<option value="湖南" rel="14">湖南</option>
									<option value="江苏" rel="16">江苏</option>
									<option value="江西" rel="17">江西</option>
									<option value="吉林" rel="15">吉林</option>
									<option value="辽宁" rel="18">辽宁</option>
									<option value="内蒙古" rel="19">内蒙古</option>
									<option value="宁夏" rel="20">宁夏</option>
									<option value="青海" rel="21">青海</option>
									<option value="山东" rel="22">山东</option>
									<option value="上海" rel="321">上海</option>
									<option value="山西" rel="23">山西</option>
									<option value="陕西" rel="24">陕西</option>
									<option value="四川" rel="26">四川</option>
									<option value="台湾" rel="397">台湾</option>
									<option value="天津" rel="343">天津</option>
									<option value="香港" rel="395">香港</option>
									<option value="西藏" rel="28">西藏</option>
									<option value="新疆" rel="29">新疆</option>
									<option value="云南" rel="30">云南</option>
									<option value="浙江" rel="31">浙江</option>
									<option value="重庆" rel="394">重庆</option>
								</select>
								<select name="city" wx-validator-error-value="请选择城市">
									<option selected="selected">请选择城市</option>
								</select>
								<span id="wx-validator-province-error" class="error-text hidden">请选择省份</span>
								<span id="wx-validator-city-error" class="error-text hidden">请选择城市</span>
								<input type="hidden" id="h_sex" value="<c:out value="${user.sex}"/>">
								<input type="hidden" id="h_province" value="<c:out value="${user.province}"/>">
								<input type="hidden" id="h_city" value="<c:out value="${user.city}"/>">
							</div>
						</div>
						
						<div class="form-item clearfix">
							<label>个人说明：</label>
							<textarea name="intro" id="intro"
								placeholder="您的介绍可更有效的帮助支持者了解您和了解项目的背景"><c:out value="${user.intro}"/></textarea>
						</div>
						
						<div class="setting-submit">
							<a type="submit" class="btn-base btn-red-h30 common-sprite"
								href="javascript:;"><span class="common-sprite">保存</span></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function modify(data) {
			if (data.status == 1) {
				wx.alert("保存成功", function() {
					location.reload();
				});
			}
			if (data.status == 0) {
				wx.alert(data.info);
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var h_province = $("#h_province").val();
			var h_city = $("#h_city").val();
			if(h_province !== ""){
				$("[name=province]").val(h_province);
			}
			load_city();
			if(h_city !== ""){
				$("[name=city]").val(h_city);
			}
			
			var h_sex = $("#h_sex").val();
			console.log("h_sex"+h_sex);
			if(h_sex !== ""){
				$("input[name=sex][value='"+h_sex+"']").attr("checked",true);
			}else{
				$("input[name=sex][value='-1']").attr("checked",true);
			}
		});
	</script>
	<!--main end-->
	<!--footer static-->
	<jsp:include page="footer.jsp"/>
</body>
</html>