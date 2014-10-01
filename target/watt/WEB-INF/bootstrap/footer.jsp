<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!-- FOOTER -->
<footer class="footer ">
	<p>
		本网站宗旨:打造国内第三方众筹鉴定，服务百姓.
	</p>
	<p>
		©2014 上海趋峰管理咨询有限公司 360jianding.com 版权所有
	</p>
	<p>
		网站正在备案中......
		<!-- 京ICP备11008151号	| 京公网安备11010802014853 -->
	</p>
</footer>

<script src="lib/jquery/plugins/jquery.unveil.min.js"></script>
<script src="lib/jquery/plugins/jquery.scrollUp.min.js"></script>
<script>
	$(document).ready(function() {
		
		$("img.lazy").unveil();

		$.scrollUp({
			scrollName : 'scrollUp', // Element ID
			topDistance : '300', // Distance from top before showing element (px)
			topSpeed : 300, // Speed back to top (ms)
			animation : 'fade', // Fade, slide, none
			animationInSpeed : 200, // Animation in speed (ms)
			animationOutSpeed : 200, // Animation out speed (ms)
			scrollText : '', // Text for element
			activeOverlay : false
		// Set CSS color to display scrollUp active point, e.g '#00FFFF'
		});
	});
</script>
<a id="scrollUp" href="#top" title="" style="position: fixed; z-index: 2147483647; display: block;"></a>