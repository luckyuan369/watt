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
						<a href="home-verify_deal.watt">
							审核项目
							<span class="btn-base btn-red-h20 common-sprite">
								<span class="common-sprite"><c:out value="${countProject}"/></span>
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
		function cancel_focus(obj){
			wx.confirm("确定取消喜欢？",function(){
				var ajaxurl = "home-cancel_like.watt";
				$.ajax({
					url:ajaxurl,
					type:"POST",
					datatype:"json",
					data:"id="+obj.id,
					success:function(obj){	
						location.reload();
					}
				});
			});
			
		}
	</script>
	<!--products static-->
	<div class="products">
		<div class="wrap">
			<c:if test="${projectSize == 'Y' }">
				<!-- <div class="urtag">
					<a href="/home-build_deal/id-222338" class="btn-base btn-red-h20 common-sprite">
						<span class="common-sprite">所有</span>
					</a>
					<a href="/home-build_deal/id-222338-r-di" class="btn-base btn-gray-h20 common-sprite">
						<span class="common-sprite">众筹中</span>
					</a>
					<a href="/home-build_deal/id-222338-r-ds" class="btn-base btn-gray-h20 common-sprite">
						<span class="common-sprite">已成功</span>
					</a>
					<a href="/home-build_deal/id-222338-r-df" class="btn-base btn-gray-h20 common-sprite">
						<span class="common-sprite">已失败</span>
					</a>
				</div> -->
				<div class="products-list">
					<table>
						<colgroup>
							<col width="155">
							<col width="315">
							<col width="115">
							<col width="125">
							<col width="120">
							<col width="100">
						</colgroup>
						<thead>
							<tr>
								<th>申请人</th>
								<th>项目名称</th>
								<th>筹集份数</th>
								<th>每份金额</th>
								<th>筹资天数</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listProject}" var="project">
								<tr>
									<th><c:out value='${project.userName}'/></th>
									<th>
										<div class="project-img"><img src="<c:out value='${project.image}'/>"></div>
										<div class="project-tit"><c:out value='${project.name}'/></div>
									</th>
									<th><c:out value='${project.copies}'/>份</th>
									<th><c:out value='${project.limit_price}'/></th>
									<th><c:out value='${project.deal_days}'/>天</th>
									<td>
										<span class="red">
											<c:if test="${project.status == '审核中' }">
												<a href="project-verify.watt?id=<c:out value='${project.id}'/>">审核</a>
											</c:if>
										</span>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="page tr"></div>
				</div>
			</c:if>
			<c:if test="${projectSize != 'Y' }">
				<div class="products-item">
					<div class="operating-tips clearfix">
						<div class="icon-message"></div>
						<h3>很抱歉......这儿是个荒地：（</h3>
						<p>Ta还没有发起任何项目</p>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<!--products end-->
	<!--footer static-->
	<jsp:include page="footer.jsp"/>
</body>
</html>