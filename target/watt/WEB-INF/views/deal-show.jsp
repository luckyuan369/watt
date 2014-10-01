<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- IE兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="keywords" content="瓦特,鉴定,质量">
<meta name="description" content="<c:out value='${project.name}'/>">
<title>瓦特鉴定-将最真实的产品质量呈现在您面前</title>
<!-- watt自定义的CSS文件 -->
<link rel="stylesheet" href="css/watt.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="lib/jquery/jquery-1.11.1.min.js"></script>
<script src="lib/jquery/plug-in/jquery-migrate-1.1.1.js"></script>
<!-- watt自定义的JS文件 -->
<script src="js/watt.js"></script>   
</head>
<body>
	<!--header static-->
	<jsp:include page="header.jsp" />
	<!--header-end-->
	<link rel="stylesheet" type="text/css" href="css/deal-show.css">
	<script type="text/javascript" src="js/deal-show.js"></script>
	
	<!--main static-->
	<div class="main deal_bg">
		<div class="wrap clearfix">
			<!--content static-->
			<div class="content fl">
				<!--detail start-->
				<div class="detail-box">
					<div class="radius-hd">
						<div class="radius-hl common-sprite"></div>
						<div class="radius-hc w620"></div>
						<div class="radius-hr common-sprite"></div>
					</div>
					<div class="radius-bd detail-con w628">
						<div class="hd">
							<h1 class="word-break">
								<c:out value="${project.name}"/>
							</h1>
							<div class="author">
								<span class="author-lay common-sprite inline-block">发起人</span>
								<span><a href="#"><c:out value="${user.user_name}" /></a></span>
								<span class="gray"><c:out value="${user.province}" />&nbsp;<c:out value="${user.city}" /></span>
							</div>
							<div class="tit-bar clearfix" id="JS-deal-fixedTit" style="width: 628px; background-color: rgb(255, 255, 255);">
								<div class="title-nav fl">
									<ul class="clearfix">
										<li class="select">
											<a class="btn-base btn-nav common-sprite" href="#">
												<span class="common-sprite">项目主页</span>
											</a>
										</li>
										<!-- <li>
											<a class="btn-base btn-nav common-sprite" href="#">
												<span class="common-sprite">话题(7)</span>
											</a>
										</li> -->
										<li>
											<a class="btn-base btn-nav common-sprite" href="deal-supporter.watt?id=<c:out value="${project.id}"/>">
												<span class="common-sprite">支持者(<c:out value="${suppoter}" />)</span>
											</a>
										</li>
									</ul>
								</div>
								<input type="hidden" id="">
								<div class="share">
									<!-- JiaThis Button BEGIN -->
									<div class="jiathis_style">
										<span class="jiathis_txt">分享到：</span><a class="jiathis_button_tsina"></a>
										<a class="jiathis_button_tqq"></a>
										<a class="jiathis_button_weixin"></a>
										<a class="jiathis_button_renren"></a>
										<a class="jiathis_button_douban"></a>
										<a class="jiathis_button_xiaoyou"></a>
										<a class="jiathis_button_cqq"></a> <a
											href="http://www.jiathis.com/share"
											class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis"
											target="_blank"></a> <a class="jiathis_counter_style"></a>
									</div>
									<script type="text/javascript">
										$(document).ready(function(){
											var jiathis_config={
													url: window.location.href,
													summary:"<c:out value="${project.name}"/>",
													title:"#瓦特网# 我在瓦特网  关注了项目  #<c:out value='${project.name}'/># ",
													hideMore:false
												};
										});
									</script>
									<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
									<!-- JiaThis Button END -->
								</div>
							</div>
						</div>
						<div class="bd">
							<div class="article">
								<c:out value="${project.description}" escapeXml="false" />
							</div>
						</div>
						<div class="comment com-pro">
							<div class="flbq">
								<div class="flei">
									分类： <a href="/browse/id-12"><span class="red">科技</span></a>
								</div>
								<div class="fr">
									<div class="jiathis_style">
										<span class="jiathis_txt">分享到：</span>
										<a class="jiathis_button_tsina"></a>
										<a class="jiathis_button_tqq"></a>
										<a class="jiathis_button_weixin"></a>
										<a class="jiathis_button_renren"></a>
										<a class="jiathis_button_douban"></a>
										<a class="jiathis_button_xiaoyou"></a>
										<a class="jiathis_button_cqq"></a> <a
											href="http://www.jiathis.com/share"
											class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis"
											target="_blank"></a> <a class="jiathis_counter_style"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="radius-ft">
						<div class="radius-fl common-sprite"></div>
						<div class="radius-fc w620"></div>
						<div class="radius-fr common-sprite"></div>
					</div>
				</div>
			</div>
			<!--content end-->
			<!--side static-->
			<div class="sidebar fr">
				<!--btn-inte  static-->
				<div class="block-list">
					<div class="radius-hd">
						<div class="radius-hl common-sprite"></div>
						<div class="radius-hc w300"></div>
						<div class="radius-hr common-sprite"></div>
					</div>
					<div class="radius-bd btn-inte w308">
						<a class="btn-base btn-red-h48 common-sprite"
							href="cart-pay.watt?id= <c:out value='${project.id }'/>"> <span
							class="common-sprite"><i
								class="common-sprite icon-sup ie6fixpic"></i>购买</span>
						</a> <a href="javascript:void(0);"
							class="btn-base btn-blue-h48 common-sprite"> <c:if
								test="${project.isFocus == 'N' }">
								<span rel="<c:out value='${project.attention}'/>"
									onclick="like_deal_v2(<c:out value='${project.id}'/>, this)"
									class="common-sprite Js-changelike"> <i
									class="common-sprite icon-like  ie6fixpic"></i>喜欢
								</span>
							</c:if> <c:if test="${project.isFocus == 'Y' }">
								<span rel="<c:out value='${project.id}'/>"
									class="common-sprite Js-changelike"> <i
									class="common-sprite icon-like ie6fixpic"></i>已喜欢
								</span>
							</c:if>
						</a>

					</div>
					<div class="radius-ft">
						<div class="radius-fl common-sprite"></div>
						<div class="radius-fc w300"></div>
						<div class="radius-fr common-sprite"></div>
					</div>
				</div>
				<!--btn-end  static-->
				<!--item detail  static-->
				<div class="block-list">
					<div class="radius-hd">
						<div class="radius-hl common-sprite"></div>
						<div class="radius-hc w300"></div>
						<div class="radius-hr common-sprite"></div>
					</div>
					<div class="radius-bd item-detail w308">
						<div class="tag bg-red">
							<c:out value="${project.status }" />
							<span class="triangle"></span>
						</div>
						<h2>目前累计份额</h2>
						<p class="item-sum">
							<c:out value="${supporterCopies}" />
							<em> 份</em>
						</p>
						<p class="item-tips word-break">
							每份<span class="red"><i class="font-yen"><c:out
										value="${project.limit_price}" />元</i></span>，此项目必须在 <span class="red"><fmt:formatDate
									value="${project.expirationDate}" pattern="yyyy年MM月dd日" /></span> 前得到
							<span class="red"><c:out value="${project.copies}" /> <i
								class="font-yen">份</i></span>的支持才可成功！
						</p>
						<div class="ratio-box">

							<div class="ratio-bar common-sprite">
								<span class="ratio-red common-sprite"
									style="width: <c:out value='${project.css_percent}'/>%"></span> <i
									class="common-sprite ie6fixpic"></i>
							</div>
							<span class="ratio-val ie6fixpic"><c:out
									value="${project.percent}" />% </span>
						</div>
						<div class="detail-rate">
							<ul class="clearfix">
								<li><strong><c:out value="${project.remain_days }" />
										天 </strong> <span>剩余时间</span></li>
								<li><strong><c:out value="${suppoter}" /></strong><span>支持者</span></li>
								<li><strong id="strong_like_count"><c:out
											value="${project.attention }" /></strong><span>喜欢</span></li>
							</ul>
						</div>
					</div>
					<div class="radius-ft">
						<div class="radius-fl common-sprite"></div>
						<div class="radius-fc w300"></div>
						<div class="radius-fr common-sprite"></div>
					</div>
				</div>
				<!--btn-end  static-->
			</div>
			<!--side end-->
		</div>
	</div>
	<!--main end-->
	<!--footer static-->
	<jsp:include page="footer.jsp" />
</html>