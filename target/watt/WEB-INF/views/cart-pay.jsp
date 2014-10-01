<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="css/cart-pay.css">
	<script type="text/javascript" src="js/cart-pay.js"></script>

	<style>
		.alipay input {}
		.alipay span {
			vertical-align: middle;
			display: block;
			background:
				url(http://zcstatic.wangxingroup.com/zhongchou/images//alipay.gif?v=1)
				no-repeat;
			width: 160px;
			height: 40px;
			text-align: left;
			display: inline-block;
			border: 1px solid #ccc;
		}
	</style>
	<!--main static-->
	<div class="main clearfix">
		<div class="wrap clearfix">
			<!--order static-->
			<div class="radius-hd">
				<div class="radius-hl common-sprite"></div>
				<div class="radius-hc w950"></div>
				<div class="radius-hr common-sprite"></div>
			</div>
			<div class="radius-bd content-order w958">
				<!--order shield static-->
				<div class="order-shield">
					<div class="order-tit">
						<h1>订单提交成功：VOW智能耳机</h1>
					</div>
					<div class="order-detail">
						<table>
							<colgroup>
								<col width="220">
								<col width="100">
								<col width="257">
								<col width="100">
								<col width="100">
							</colgroup>
							<thead>
								<tr>
									<th>项目名</th>
									<td>发起人</td>
									<td>单价</td>
									<td>数量</td>
									<td>支持金额</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th><c:out value="${project.name}"/></th>
									<td><c:out value="${user.user_name}"/></td>
									<td><c:out value="${supporter.limit_price}"/></td>
									<td><c:out value="${supporter.copies}"/></td>
									<td>￥<c:out value="${supporter.total_price}"/></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th colspan="6">总计金额：<span class="red">¥<em><c:out value="${supporter.total_price}"/></em></span></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
				<!--order shield end-->
				<!--pay method static-->
				<form name="gopay" method="post" target="_blank"
					action="/cart-go_pay">
					<div class="pay-method">
						<div class="pay-tit">
							<h3>支持交易</h3>
						</div>
						<div class="pay-con" id="Js-select">
							<!--第三方支付  static-->
							<!--支付宝-->
							<div class="pay-row">
								<div class="cashier-cach">
									<ul>
										<li class="alipay on select"
											onclick="set_bank(&quot;alipay&quot;)"><input
											type="radio" value="alipay" name="payment"> <span
											class="" onclick="set_bank('alipay')"></span></li>
									</ul>
								</div>
							</div>
							<script type="text/javascript">
								function set_bank(bank_id){$("input[name='bank_id']").val(bank_id);}
							</script>
							<input type="hidden" name="bank_id" value="alipay">
							<!--第三方支付  end-->
							<!--网银支付  static-->
							<!--网银支付  end-->
							<!--pay-submit static-->
							<input type="hidden" name="order" value="142520">
							<div class="pay-submit">
								<a class="btn-base btn-red-h48 common-sprite sbt"
									data-id="142520" href="javascript:void(0);"><span
									class="common-sprite">在线支付</span></a>

							</div>
						</div>
					</div>
				</form>
				<!--pay method end-->
			</div>
			<div class="radius-ft">
				<div class="radius-fl common-sprite"></div>
				<div class="radius-fc w950"></div>
				<div class="radius-fr common-sprite"></div>
			</div>
			<!--order end-->
		</div>
	</div>
	<!--main end-->
	<script type="text/javascript">
		var supportMoney = parseInt(parseFloat(20)*100);
		$("form[name='gopay']").find(".sbt").bind("click",function(){
			_gaTrack('cart','goPay','money',supportMoney);
				var order_id = $(this).attr("data-id");
				wx.alert("请您在新打开的网银或第三方支付页面上完成付款",function(){
					//location.href = "/cart-check_order_status/id-142520";
					wx.sendData("/cart-check_order_status","id="+order_id,function(data){
						if(data.status == 1){
							_gaTrack('cart','paySuccess');
						}
						wx.alert(data.info,function(){
							if(data.jump){
								location.href = data.jump;
							}
						});
						
					});
				});
		});
		
		</script>
	<!--footer static-->
	<jsp:include page="footer.jsp" />
</body>
</html>