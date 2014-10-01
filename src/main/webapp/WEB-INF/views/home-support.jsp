<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<link rel="stylesheet" href="lib/jquery/ajaxPager.css">
<!-- watt自定义的JS文件 -->
<script src="js/watt.js"></script>
</head>
<body>
	<!--header static-->
	<jsp:include page="header.jsp"/>
	<!--header-end-->
	<link rel="stylesheet" type="text/css" href="css/home-focus.css">
	<!-- user_info begin-->
	<div class="info-head">
		<div class="wrap">
			<!--mod head static-->
			<jsp:include page="mod-header.jsp"/>
			<!--mod head end-->
			<!--content-tab static-->
			<div class="content-tab">
				<ul class="clearfix">
					<li class="select">
						<a href="home-support.watt">
							支持的项目
							<span class="btn-base btn-red-h20 common-sprite">
								<span class="common-sprite"><c:out value="${countSupporter }"/></span>
							</span>
						</a>
					</li>
					<li>
						<a href="home-build_deal.watt">
							发起的项目
							<span class="btn-base btn-gray-h20 common-sprite">
								<span class="common-sprite"><c:out value="${countProject}"/></span>
							</span>
						</a>
					</li>
					<li>
						<a href="home-focus.watt">
							喜欢的项目
							<span class="btn-base btn-gray-h20 common-sprite">
								<span class="common-sprite"><c:out value="${countFocus}"/></span>
							</span>
						</a>
					</li>
				</ul>
			</div>
			<!--content-tab end-->
		</div>
	</div>
	<!-- user_info end -->
	<script type="text/javascript">
		function release(obj){
			wx.confirm("确定发布吗？",function(){
				var ajaxurl = "project-release.watt";
				$.ajax({
					url:ajaxurl,
					type:"POST",
					datatype:"json",
					data:"id="+obj.id,
					success:function(ajaxobj){
						if(ajaxobj.status==1){
							wx.alert(ajaxobj.info , function() {
								window.location.href = ajaxobj.url;
							});
						}else{
							if (ajaxobj.errorMes != "") {
								wx.alert(ajaxobj.errorMes);
								return;
							}
							wx.alert("操作错误");
						}
					},error:function(ajaxobj)
					{
						wx.alert('网络错误');
					}
				});
			});
		}
	</script>
	<!--products static-->
	<div class="products">
		<div class="wrap">
			<div class="urtag">
				<a href="home-support.watt" class="btn-base <c:out value='${all}'/> common-sprite">
					<span class="common-sprite">所有</span>
				</a>
				<a href="home-support-pay.watt" class="btn-base <c:out value='${pay}'/> common-sprite">
					<span class="common-sprite">已支付</span>
				</a>
				<a href="home-support-unpay.watt" class="btn-base <c:out value='${unpay}'/> common-sprite">
					<span class="common-sprite">未支付</span>
				</a>
			</div>
			<div class="products-list">
				<table>
					<colgroup>
						<col width="380">
						<col width="115">
						<col width="105">
						<col width="105">
						<col width="100">
						<col width="165">
					</colgroup>
					<thead>
						<tr>
							<th>项目名称</th>
							<th>单价</th>
							<th>数量</th>
							<td>支付金额</td>
							<td>支付日期</td>
							<td>状态</td>
						</tr>
					</thead> 
					<tbody>
						<c:forEach items="${listSupporter}" var="supporter">
							<tr>
								<th>
									<div class="project-img"><a href="deal-show.watt?id=<c:out value='${supporter.project.id}'/>"><img src="<c:out value='${supporter.project.image}'/>"></a></div>
									<div class="project-tit"><a href="deal-show.watt?id=<c:out value='${supporter.project.id}'/>"><c:out value='${supporter.project.name}'/></a><br/>订单号：<c:out value='${supporter.id}'/></div>
								</th>
								<td><c:out value="${supporter.limit_price }"/>元</td>
								<td><c:out value="${supporter.copies }"/></td>
								<td><c:out value="${supporter.total_price }"/>元</td>
								<td><fmt:formatDate value="${supporter.buy_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><c:out value="${supporter.status }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="page tr"></div>
			</div>
		</div>
	</div>
	<!--products end-->
	<!--footer static-->
	<jsp:include page="footer.jsp"/>
</body>
</html>