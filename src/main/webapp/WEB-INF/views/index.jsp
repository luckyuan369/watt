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
<script src="lib/jquery/ajaxPager.js"></script>
<link rel="stylesheet" href="lib/jquery/ajaxPager.css">

<!-- watt自定义的JS文件 -->
<script src="js/watt.js"></script>

</head>
<body>
	<jsp:include page="header.jsp"/>
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<div class="banner" pbid="banner">
		<div class="wrap">
			<style>
				#JS-banner_ul {
					position: relative;
				}
				
				#JS-banner_ul li {
					float: left
				}
			</style>
			<div class="wrap" style="overflow: hidden;">
				<ul id="JS-banner_ul" class="clearfix" style="height: 392px; width: 6720px; margin-left: 0px;">
					<c:forEach var="carousel" items="${listCarousel}">
						<li>
							<a target="_blank" href="<c:out value='${carousel.url}'/>">
								<img class="lz" data-src="<c:out value='${carousel.image}'/>" width="960" height="392" src="<c:out value='${carousel.image}'/>"	data-init="ok" data-load="ok">
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="focus-btn">
				<a id="JS-banner_pre" class="prev common-sprite ie6fixpic"
					href="javascript:void(0);">上一张</a> <a id="JS-banner_next"
					class="next common-sprite ie6fixpic" href="javascript:void(0);">下一张</a>
			</div>
		</div>
	</div>
	<script src="js/unslider.js"></script>
	<div class="site-focus" pbid="瓦特鉴定">
		<div class="wrap">
			<div class="mod-title clearfix">
				<h2>瓦特鉴定</h2>
			</div>
			
			<div class="hot-project" id="wtlist">
			</div>
			<div class="page tr">
				&nbsp;<a class="select common-sprite">1</a>
				&nbsp;<a class="common-sprite" href="/browse/p-2">&nbsp;2&nbsp;</a>
				&nbsp;<a class="common-sprite" href="/browse/p-3">&nbsp;3&nbsp;</a>
				&nbsp;<a class="common-sprite" href="/browse/p-4">&nbsp;4&nbsp;</a>
				&nbsp;<a class="common-sprite" href="/browse/p-5">&nbsp;5&nbsp;</a>  
				<a class="common-sprite" href="/browse/p-6">. . .</a> 
				<a class="common-sprite" href="/browse/p-30">30</a> 
				<a class="next" href="/browse/p-2">下一页</a> 
			</div>
			<div class="page tr">
				<div id="pagecount" class="pager clearfix"></div>
				<div id="loading"></div><br/>
			</div>
		</div>
	</div>
	
	<script>
		(function($, window) {
			$.fn.lately = function(options) {
				options = $.extend({}, {
					container : window,
					gapX : 0,
					gapY : 0
				}, options);
				var $win = $(options.container), self = this;
				this.one("lately", function() {
					var src = this.getAttribute("data-src");
					this.setAttribute("src", src);
					this.removeAttribute("data-src")
				});
				function lately() {
					var inview = self
							.filter(function() {
								var el = $(this), elW = el.outerWidth()
										+ options.gapX, elH = el.outerHeight()
										+ options.gapY, scroll = {
									y : $win.scrollTop(),
									x : $win.scrollLeft()
								}, viewport = {
									x : $win.width() + options.gapX,
									y : $win.height() + options.gapY
								};
								return (el.offset().top < (scroll.y + viewport.y)
										&& el.offset().left < (scroll.x + viewport.x)
										&& (el.offset().top + elH) > scroll.y && (el
										.offset().left + elW) > scroll.x)
							});
					var loaded = inview.trigger("lately");
					self = self.not(loaded)
				}
				;
				$win.on('resize scroll', lately);
				lately();
				return this;
			}
		}(jQuery, window));

		$(function() {
			$("img.lzload").show().lately({
				"gapX" : 400
			});
		});
	</script>
	<jsp:include page="footer.jsp"/>
</body>
</html>