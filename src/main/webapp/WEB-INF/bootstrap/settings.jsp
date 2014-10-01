<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<jsp:include page="header.jsp" />
	<div class="projects-header"></div>
	<div class="container">
		<div class="row" style="padding-left: 32px; padding-right: 32px;">
			<div class="col-sm-12 col-md-12 setting-content"
				style="padding-left: 0px; padding-right: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px;">
				<div class="setting-title clearfix">
					<h3>个人设置</h3>
				</div>
				<div class="setting-content clearfix">
					<div class="setting-menu col-sm-2" style="padding: 0px">
						<ul class="clearfix">
							<li class="select"><a class="glyphicon glyphicon-user" href="settings.watt">&nbsp;资料修改</a></li>
							<li><a class="glyphicon glyphicon-wrench" href="settings-password.watt">&nbsp;密码修改</a></li>
							<li><a class="glyphicon glyphicon-picture" href="settings-avatar.watt">&nbsp;头像修改</a></li>
						</ul>
					</div>
					<div class="col-sm-10 setting-detail" style="padding: 40px 25px 20px; min-height: 465px;">
						<form class="form-horizontal" id="form" style="padding: 20px 40px;">
							<input type="hidden" name="id" value="<c:out value="${user.id}"/>">
							<input type="hidden" id="h_sex" value="<c:out value="${user.sex}"/>">
							
							<div id="messageAlert" class="alert alert-danger alert-dismissible fade in" style="display:none;">
								<strong>警告: </strong><span></span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">注册邮箱<font color="red">*</font></label>
								<div class="col-sm-6" style="padding-top: 6px;">
									<span>${user.email }</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">用户昵称<font color="red">*</font></label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="user_name" placeholder="请输入用户昵称" maxlength="20" value="${user.user_name }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">性别<font color="red">&nbsp;</font></label>
								<div class="col-sm-6">
									<label class="radio-inline">
									  <input type="radio" name="sex" id="inlineRadio1" value="1"> 男
									</label>
									<label class="radio-inline">
									  <input type="radio" name="sex" id="inlineRadio2" value="0"> 女
									</label>
									<label class="radio-inline">
									  <input type="radio" name="sex" id="inlineRadio3" value="-1"> 保密
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">个人说明<font color="red">&nbsp;</font></label>
								<div class="col-sm-6">
									<textarea class="form-control" rows="3" name="intro" maxlength="200" placeholder="您的介绍可更有效的帮助支持者了解您和了解项目的背景 | 不超过200个字"><c:out value="${user.intro}"/></textarea>
								</div>
							</div>
							<div class="form-group" style="margin-left: 112px;">
								<button type="button" class="btn btn-primary" id="btnSubmit" style="width: 275px;">保存</button>
							</div>
				  		</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function(){
			var h_sex = $("#h_sex").val();
			if (h_sex !== "") {
				$("input[name=sex][value='" + h_sex + "']").attr("checked", true);
			} else {
				$("input[name=sex][value='-1']").attr("checked", true);
			}
			
			$("#btnSubmit").click(function(){
				var id = $.trim($("#form").find("input[name='id']").val());
				var user_name = $.trim($("#form").find("input[name='user_name']").val());
				var sex = $.trim($("#form").find("input:radio[name='sex']:checked").val());
				var intro = $.trim($("#form").find("textarea[name='intro']").val());
				if(!wx.validator.required(user_name)) {
					$("#messageAlert span").html("请输入用户昵称");
					$("#messageAlert").css("display","block");
					return false;
				}
				if(!wx.validator.maxLength(user_name,20)) {
					$("#messageAlert span").html("用户昵称不可超过20个字");
					$("#messageAlert").css("display","block");
					return false;
				}
				
				if(!wx.validator.required(sex)) {
					$("#messageAlert span").html("请选择性别");
					$("#messageAlert").css("display","block");
					return false;
				}
				
				if(!wx.validator.maxLength(intro,200)) {
					$("#messageAlert span").html("用户昵称不可超过20个字");
					$("#messageAlert").css("display","block");
					return false;
				}
				
				is_submiting = true;
				var ajaxurl = "settings-save_index.watt";
				var query = new Object();
				query.id = id;
				query.user_name = user_name;
				query.sex = sex;
				query.intro = intro;
				$.ajax({
					url: ajaxurl,
					dataType: "json",
					data:query,
					type: "POST",
					success: function(ajaxobj){
						is_submiting = false;
						if(ajaxobj.status==1)
						{
							location.reload();
						} else {
							if (ajaxobj.errorMes != "") {
								$("#messageAlert span").html(ajaxobj.errorMes);
								$("#messageAlert").css("display","block");
								return;
							}
						};
					},
					error:function(ajaxobj)
					{
						is_submiting = false;
						$("#messageAlert span").html("网络错误");
						$("#messageAlert").css("display","block");
					}
				});
				return false;
			});
		});
	</script>
</body>
</html>