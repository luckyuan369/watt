$(document).ready(function(){
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create("#Js-description", {
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
		});
	});
	
	//同步映射右侧缩略图信息
	$("input[name='name']").blur(function(){
		$("#Js-name").text($(this).val());
	});
	$("input[name='copies']").blur(function(){
		$("#Js-copies").text($(this).val());
	});
	$("input[name='limit_price']").blur(function(){
		$("#Js-price").text($(this).val());
	});
	$("input[name='deal_days']").blur(function(){
		$("#Js-days").text($(this).val());
	});
	
	$("#formMessage span").html("");
	$("#formMessage").css("display","none");
	
	//保存提交操作
	var is_submiting = false;
	$("#Js-save").click(function(){
		checkForm("project-save.watt");
	});
	$("#Js-send").click(function(){
		checkForm("project-send.watt");
	});
	
	function checkForm(action){
		if(is_submiting) return false;
		$("#formMessage span").html("");
		$("#formMessage").css("display","none");
		var name = $.trim($("#projectAddForm").find("input[name='name']").val());
		var copies = $.trim($("#projectAddForm").find("input[name='copies']").val());
		var limit_price = $.trim($("#projectAddForm").find("input[name='limit_price']").val());
		var deal_days = $.trim($("#projectAddForm").find("input[name='deal_days']").val());
		var cate_id = $.trim($("#projectAddForm").find("input:radio[name='cate_id']:checked").val());
		var image = $.trim($("#projectAddForm").find("input[name='image']").val());
		var brief = $.trim($("#projectAddForm").find("textarea[name='brief']").val());
		var description = editor.html();
		
		if(!wx.validator.required(name)) {
			$("#formMessage span").html("请输入项目名称");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.maxLength(name,40)) {
			$("#formMessage span").html("项目名称不可超过40个字");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.required(copies)) {
			$("#formMessage span").html("请输入筹集份数");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.digits(copies)) {
			$("#formMessage span").html("筹集份数需填写数字");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.min(copies,1)) {
			$("#formMessage span").html("筹集份数不少于1份");
			$("#formMessage").css("display","block");
			return false;
		}
		
		if(!wx.validator.required(limit_price)) {
			$("#formMessage span").html("请输入每份金额");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.digits(limit_price)) {
			$("#formMessage span").html("每份金额需填写数字");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.min(limit_price,1)) {
			$("#formMessage span").html("每份金额最少为1元");
			$("#formMessage").css("display","block");
			return false;
		}
		
		if(!wx.validator.required(deal_days)) {
			$("#formMessage span").html("请输入筹集天数");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.digits(deal_days)) {
			$("#formMessage span").html("筹集天数需填写数字");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.range(deal_days,"10-90")) {
			$("#formMessage span").html("筹集天数10~90天");
			$("#formMessage").css("display","block");
			return false;
		}
		
		if(!wx.validator.required(cate_id)) {
			$("#formMessage span").html("请选择产品类别");
			$("#formMessage").css("display","block");
			return false;
		}
		
		if(!wx.validator.required(brief)) {
			$("#formMessage span").html("请输入项目简介");
			$("#formMessage").css("display","block");
			return false;
		}
		if(!wx.validator.maxLength(brief,75)) {
			$("#formMessage span").html("项目简介不可超过75个字");
			$("#formMessage").css("display","block");
			return false;
		}
		is_submiting = true;
		var ajaxurl = action;
		var query = new Object();
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
						$("#formMessage span").html(ajaxobj.errorMes);
						$("#formMessage").css("display","block");
						return;
					}
				};
			},
			error:function(ajaxobj)
			{
				is_submiting = false;
				$("#formMessage span").html("网络错误");
				$("#formMessage").css("display","block");
			}
		});
		return false;
	}
});