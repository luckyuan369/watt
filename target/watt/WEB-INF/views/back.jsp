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
<script src="lib/jquery/ajaxPager.js"></script>
<link rel="stylesheet" href="lib/jquery/ajaxPager.css">

<!-- watt自定义的JS文件 -->
<script src="js/watt.js"></script>

</head>
<body>
	<!--header static-->
	<div class="header">
		<div class="wrap" pbid="header">
			<div class="img-logo">
				<h1>
					<a alt="瓦特网" class="ie6fixpic" title="瓦特网" href="/index">瓦特网</a>
				</h1>
			</div>
			<!--menu start-->
			<div class="menu">
				<ul class="clearfix">
					<li><a href="/index">首页 </a></li>
					<li><a href="/browse">浏览项目 </a></li>
					<li><a href="/open">开放平台 </a></li>
					<li><a href="/partake">新手帮助 </a></li>
					<li class="select"><a href="/project">发起项目 </a></li>
					<!--<li><a href="/help-about/id-1">关于众筹 </a></li>-->
					<!-- <li><a href="/browse-showstock">股权众筹 </a></li> -->
				</ul>
			</div>
			<!--menu end-->
			<!--search start-->
			<div class="search common-sprite ie6fixpic sw">
				<form action="/deals" method="post" id="header_new_search_form"
					wx-validator="" autocomplete="off">
					<input type="text" name="k" wx-validator-placeholder="搜索"
						wx-validator-rule="required" class="search-key gray"
						wx-validator-notip="" placeholder="搜索"> <input
						id="Js-search-submit" type="submit" class="btn-search ie6fixpic">
				</form>
			</div>
			<!--search end-->

			<!-- user menu start-->
			<div class="user-menu" id="jsddm">
				<div class="menu-hd tx">
					<a href="/home/id-222338" class="tit"> <span class="avatar-box">
							<img id="headeravatar"
							src="http://zrstatic.wangxingroup.com/avatar/000/22/23/38virtual_avatar_small.jpg?v=1399746299">
					</span> <span class="user-name word-break ie6fixpic">Lucky…</span>
					</a>
				</div>
				<div class="menu-bd JS-myinfo">
					<ul class="clearfix">
						<ul>
							<li class="sup"><a class="ie6fixpic" href="/home/id-222338">支持的项目</a></li>
							<li class="spo"><a class="ie6fixpic"
								href="/home-build_deal/id-222338">发起的项目</a></li>
							<li class="att"><a class="ie6fixpic"
								href="/home-focus/id-222338">喜欢的项目</a></li>
							<li class="msg"><a class="ie6fixpic" href="/message">消息中心</a></li>
							<li class="set"><a class="ie6fixpic" href="/settings">个人设置</a></li>
							<li class="exit bn"><a class="ie6fixpic"
								href="/user-loginout">退出</a></li>
						</ul>
					</ul>
				</div>
			</div>
			<!-- user menu end-->

		</div>
	</div>
	<!--header-end-->
	<link rel="stylesheet" type="text/css" href="css/project_add.css">
	<script type="text/javascript" src="js/watt_add.js"></script>
	<!--main static-->
	<div class="main clearfix">
		<div class="wrap clearfix">
			<!--flow step static-->
			<div class="project-edit-nav">
				<h3 class="steps-2">回报设置</h3>
			</div>
			<!--flow step end-->
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
						<div class="tit-wrap">
							<h3>回报设置</h3>
						</div>
						<div class="project-set">
							<!--project-info static-->
							<div class="project-info">
								<table>
									<colgroup>
										<col width="40">
										<col width="80">
										<col width="60">
										<col width="290">
										<col width="80">
										<col width="60">
										<col width="60">
									</colgroup>
									<thead>
										<tr>
											<th>回报</th>
											<td>支持金额</td>
											<td>名额</td>
											<td>回报内容</td>
											<td>回报时间</td>
											<td>运费</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listProjectBack}" var="pback">
											<tr>
												<th><c:out value="${pback.sequence}"/></th>
												<td class="strong">¥<c:out value="${pback.price}"/></td>
												<td><c:out value="${pback.limit_num}"/>位</td>
												<td class="tl"><c:out value="${pback.description}"/></td>
												<td>项目结束后<br><c:out value="${pback.repaid_day}"/>天	</td>
												<td><c:out value="${pback.delivery_fee}"/></td>
												<td><a data-id="<c:out value='${pback.id}'/>" class="red Js-del-item">删除</a><br>
												<a class="red Js-edit" data-id="<c:out value='${pback.id}'/>" data-num="<c:out value='${pback.sequence}'/>"
													href="javascript:;">编辑</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!--project-info end-->
							<!--project-set-form static-->
							<div class="project-set-form" style="display: none"
								id="add_item_form">
								<div class="tit-hsbg">
									<h3 class="red" id="Js-edit-num">支持回报选项<c:out value="${addNewNum}"/></h3>
								</div>
								
								<form name="item_form" id="item_form"
									action="project-save_deal_item.watt" method="post" wx-validator=""
									wx-validator-ajax="" autocomplete="off">

									<div class="form-item clearfix">
										<label>支持金额：</label> <input name="price" type="text"
											wx-validator-rule="required|digits"> <span
											class="input-notes">元</span> <span
											id="wx-validator-price-required" class="error-text hidden">不能为空</span>
										<span id="wx-validator-price-digits" class="error-text hidden">请填写正确金额</span>
									</div>

									<div class="form-item clearfix">
										<label>回报内容：</label>
										<textarea name="description" wx-validator-rule="required"
											wx-validator-placeholder="请填写关于回报或任何你希望项目发起人知道的信息,不多于500字"
											maxlength="500" placeholder="请填写关于回报或任何你希望项目发起人知道的信息,不多于500字"></textarea>
										<span id="wx-validator-description-required"
											class="error-text" style="margin-left: 100px; display: none;">不能为空</span>
									</div>
									<div class="form-item clearfix">
										<label>限定名额：</label> <input name="limit_num" class="inp-w68"
											type="text" value="0" wx-validator-rule="required|digits">
										<span class="input-notes">个</span> <span
											class="input-tips gray">“0”为不限名额</span> <span
											id="wx-validator-limit_num-digits" class="error-text hidden">请填写名额</span>
									</div>

									<div class="form-item clearfix">
										<label>运费：</label> <input class="inp-w68" name="delivery_fee"
											type="text" value="0" wx-validator-rule="required|digits">
										<span class="input-notes">元</span> <span
											class="input-tips gray">“0”为不收运费</span> <span
											id="wx-validator-limit_num-digits" class="error-text hidden">请填写正确的运费金额</span>
									</div>

									<div class="form-item clearfix">
										<label>回报时间：</label> <span class="input-notes">项目结束后</span> <input
											class="inp-w68" name="repaid_day" type="text" value=""
											wx-validator-rule="required|digits"> <span
											class="input-notes">天</span><span
											id="wx-validator-repaid_day-required"
											class="error-text hidden">不能为空</span> <span
											id="wx-validator-repaid_day-digits" class="error-text hidden">请填写正确的回报时间</span>
									</div>

									<div class="form-submit" name="finish">
										<a type="submit" class="btn-base btn-red-h30 common-sprite"
											href="javascript:void(0);"><span class="common-sprite">保存</span></a>
										<a class="btn-base btn-red-h30 common-sprite"
											href="javascript:void(0);"><span class="common-sprite"
											id="cancel_item">取消保存</span></a>
									</div>
									<input type="hidden" name="project_id" value="<c:out value='${projectId}'/>">
									<input type="hidden" name="id" value="">
								</form>

							</div>
							<div class="project-set-form" id="project-add-item">
								<a class="btn-base btn-red-h30 common-sprite"
									id="add_item_button" href="javascript:void(0);"><span
									class="common-sprite">+添加回报</span></a>
							</div>
							<!--project-set-form static-->
							<div class="action tr">
								<a href="project-edit.watt?id=<c:out value='${projectId}'/>" class="btn-base btn-red-h48 common-sprite">
									<span class="common-sprite">上一步</span>
								</a> 
								<a href="projectauth.watt?id=<c:out value='${projectId}'/>" class="btn-base btn-red-h48 common-sprite">
									<span class="common-sprite">下一步</span>
								</a>
							</div>
						</div>
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
				<!--side-list static-->
				<div class="block-list">
					<div class="radius-hd">
						<div class="radius-hl common-sprite"></div>
						<div class="radius-hc w215"></div>
						<div class="radius-hr common-sprite"></div>
					</div>
					<div class="radius-bd side-list w223">
						<div class="sidetit">
							<h3>温馨提示</h3>
						</div>
						<div class="side-container">
							<dl>
								<dt>3个以上的回报</dt>
								<dd>多些选择能提高项目的支持率。</dd>
							</dl>
							<dl>
								<dt>几十、几百、上千元的支持</dt>
								<dd>3个不同档次的回报，能让你的项目 更快成功。</dd>
							</dl>
							<dl>
								<dt>回报最好是项目的衍生品</dt>
								<dd>与项目内容有关的回报更能吸引到大家的支持。</dd>
							</dl>
						</div>
					</div>
					<div class="radius-ft">
						<div class="radius-fl common-sprite"></div>
						<div class="radius-fc w215"></div>
						<div class="radius-fr common-sprite"></div>
					</div>
				</div>
				<!--side-list end-->
			</div>
			<!--side end-->
		</div>
	</div>
	<!--main end-->
	<script>
	function item_form(data){
		wx.alert(data.info,function(){
			location.href="project-add_item.watt?id="+$("[name =project_id").val();
		});
	}

	$("#add_item_button").click(function(){
		$("#add_item_form").show("slow");
		$("#project-add-item").hide();
	});
	
	$("#cancel_item").click(function(){
		location.reload();
	});
	
	$(".Js-edit").click(function() {
		$("#Js-edit-num").html("支持回报选项"+$(this).attr("data-num"));
		var id = $(this).attr("data-id");
		wx.sendData("project-edit_item.watt","id="+id,function(data){
			if(data.status==0){
				wx.alert(data.info);
				return;
			}
			$("#add_item_button").trigger('click');
			$("input[name='price']").val(parseInt(data.price));
			$("textarea[name='description']").val(data.description);
			$("input[name='limit_num']").val(data.limit_num);
			$("input[name='repaid_day']").val(data.repaid_day);
			$("input[name='delivery_fee']").val(parseInt(data.delivery_fee));
			$("input[name='id']").val(parseInt(data.id));
		});
	});

	$(".Js-del-item").click(function(){
		var id = $(this).attr("data-id");
		wx.confirm("确认删除吗?",function(){
			wx.sendData("project-del_item.watt","id="+id,function(data){
				location.reload();
			});
		});
	});
</script>
	<!--footer static-->
	<jsp:include page="footer.jsp"/>
</body>
</html>