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
					<li><a href="home-support.watt"> 支持的项目 <span
							class="btn-base btn-gray-h20 common-sprite"> <span
								class="common-sprite"><c:out value="${countSupporter}"/></span>
						</span>
					</a></li>
					<li><a href="home-build_deal.watt"> 发起的项目 <span
							class="btn-base btn-gray-h20 common-sprite"> <span
								class="common-sprite"><c:out value="${countProject}"/></span>
						</span>
					</a></li>
					<li class="select"><a href="home-focus.watt"> 喜欢的项目
							<span class="btn-base btn-red-h20 common-sprite"> <span
								class="common-sprite"><c:out value="${countFocus}"/></span>
						</span>
					</a></li>
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
			<div class="products-list">
				<table>
					<colgroup>
						<col width="465">
						<col width="360">
						<col width="135">
					</colgroup>
					<thead>
						<tr>
							<th>项目名称</th>
							<td>日期</td>
							<td>操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listProjectFocus}" var="pf">
							<tr class="<c:out value='${pf.project.id}'/>">
								<th>
									<div class="project-img">
										<a href="deal-show.watt?id=<c:out value='${pf.project.id}'/>"><img src="<c:out value='${pf.project.image}'/>"></a>
									</div>
									<div class="project-tit">
										<a href="deal-show.watt?id=<c:out value='${pf.project.id}'/>"><c:out value='${pf.project.name}'/></a>
									</div>
								</th>
								<td><c:out value='${pf.create_date}'/></td>
								<td><a class="red " id="<c:out value='${pf.id}'/>" onclick="cancel_focus(this)">取消喜欢</a></td>
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