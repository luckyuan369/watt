$(document).ready(function(){
	bind_pay_form();
	bind_other();
	$("input[name='payment']").eq(0).trigger('click');

	$("#Js-select").find("li").click(function(){
		$(".select").removeClass("select");
		$(this).addClass("select").find("input").prop("checked",true);

	}).first().addClass("select");
});

function bind_other(){
	$("input[name='payment']").bind('click',function(){
		$("div[name='payfor'] li").removeClass('on');
		$(this).parent().addClass('on');
	});
	$("div[name='order'] span").bind("click",function(){
		var h=$(this).parent().find('p').height();
		if(h==22){
			$(this).parent().animate({height:"150px"});
			$(this).parent().find('p').animate({height:"150px"});
		}else{
			$(this).parent().find('p').animate({height:"22px"});
			$(this).parent().animate({height:"22px"});
		}
	});
	
	$("span[name='yue']").bind('click',function(){
		var url = $(this).attr('url');
		if(!url){
			return false;	
		}
		$.showConfirm("确定使用余额支付",function(){
			window.location.href=url;
		});
		
		
	});
}

function bind_pay_form()
{
	$("form[name='gopay']").find(".sbt").bind("click",function(){
		$("form[name='gopay']").submit();
	});
	$("form[name='gopay']").bind("submit",function(){		
		
		var order = $("form[name='gopay']").find("input[name='order']").val();
		if(!isNaN(order) || !order)
		{			
			if($(this).find("input[name='payment']:checked").length==0)
			{
				wx.alert("请选择支付方式");
				return false;
			}
		}
		
		show_pay_tip();
		return true;

	});
}
function show_weibo(){
	
	var url=$('.ntit h2').attr("rel");
	var id=parseInt($('.ntit h2').html());
	
	if(url){
		var dealname=$('.ntit h1').html();
		
		var html='<div class="ui-popup-invite">'+
	        '<ul>'+
	    '<li class="ui-popup-invite-i">'+
	      '<div>我在众筹网支持了项目“'+dealname+'”，有点意思（http://'+domain+url+'）</div>'+ 
	    '</li>'+       
	 ' </ul>'+
	    ' <div class="pubbtn">'+
	     '<div class="green_hover dialog-ok"><a href="javascript:;" style="color:#FFF"> <span> 分享 </span> </a></div>'+
			'<div class="green_hover dialog-cancel"><a href="javascript:;" class="close dialog-close" style="color:#FFF"> <span> 取消 </span> </a></div>'+
	'</div>'+

	'<div class="clr"></div>'+
	'</div>';

		$.weeboxs.open(html, {boxid:'focus',contentType:'text',showButton:false, showCancel:true, showOk:true,title:'分享微博',width:500,type:'wee',onok:function(){
			syn_weibo(id,function(){
				$.weeboxs.close();
				window.location.reload();
			});
		},onclose:function(){
			window.location.reload();
		}});
	}else{
		window.location.reload();
	}
	
}

function syn_weibo(id,opt_callback){
	var ajaxurl = '/index.php?ctl=deal&act=syn_weibo&id='+id;
	$.ajax({ 
		url: ajaxurl,
		type: "POST",
		dataType: "json",
		success: function(ajaxobj){
			 if (typeof opt_callback == 'function') opt_callback.call(null);
		},
		error:function(ajaxobj)
		{
//			if(ajaxobj.responseText!='')
//			alert(ajaxobj.responseText);
		}
	});
}

function show_pay_tip()
{
	var html =  '<div class="pay_tip_box"><div class="empty_tip" style="font-size:14px;">请您在新打开的网银或第三方支付页面上完成付款</div><div class="blank"></div>'+
				/*'<div class="choose">付款后请选择</div>'+
				'<div class="ui-button green" id="check_payment" rel="green">'+
				'<div>'+
				'	<span>支付成功</span>'+
				'</div>'+
				'</div>	'+*/
				'<div class="dialog-button" id="choose_payment" rel="blue">'+
				'<div class="dialog-ok">'+
				'	<span>完成</span>'+
				'</div>'+
				'</div> </div><div class="clr"></div>	';
	/*$.weeboxs.open(html, {boxid:'pay_tip',contentType:'text',showButton:false, showCancel:false, showOk:true,title:'提示',width:450,type:'wee',onok:function(){
		$.weeboxs.close();show_weibo();
	}});*/

	$("#choose_payment").bind("click",function(){
		close_pop();
	});
	$("#check_payment").bind("click",function(){
		var id = $("[name='id']").val();
		var ajaxurl = $("#back_url").val();
		$.ajax({ 
			url: ajaxurl+'-payforcheck/id-'+id,
			type: "POST",
			dataType: "json",
			success: function(ajaxobj){
				if(ajaxobj){
					location.href = $("#back_url").val();
				}else{
					$("#choose_payment").trigger('click');
					alert('支付失败，请重新支付');
				}
			},
			error:function(ajaxobj)
			{
//				if(ajaxobj.responseText!='')
//				alert(ajaxobj.responseText);
			}
		});
		return false;
		
	});
}