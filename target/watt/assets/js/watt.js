(function(window, document, $, undefined) {
	"use strict";

	function wx() {
	}
	window.wx = wx;
	$(function() {
		if ($.isFunction(window["wxInit"]))
			window["wxInit"]();
	});
	wx.jsonToString = function(json, isEncode) {
		var strTemp = "";
		for ( var key in json) {
			strTemp += key + '='
					+ (isEncode ? encodeURIComponent(json[key]) : json[key])
					+ '&';
		}
		return strTemp.slice(0, -1);
	};
	wx.stringToJson = function(string) {
		var tempURL = string.split('&'), json = "";
		for (var i = 0; i < tempURL.length; i++) {
			var t = tempURL[i].split('=');
			json += "'" + t[0] + "':'" + t[1] + "',";
		}
		return eval("({" + json.slice(0, -1) + "})");
	};
	wx.trim = function(str, is_global) {
		if (!str)
			return "";
		var result = str.replace(/(^\s+)|(\s+$)/g, "");
		if (is_global)
			result = result.replace(/\s/g, "");
		return result;
	};

	wx.cookie = function(name, value, options) {
		if (typeof value != 'undefined') {
			options = options || {};
			if (value === null) {
				value = '';
				options = $.extend({}, options);
				options.expires = -1;
			}
			var expires = '';
			if (options.expires
					&& (typeof options.expires == 'number' || options.expires.toUTCString)) {
				var date;
				if (typeof options.expires == 'number') {
					date = new Date();
					date.setTime(date.getTime()
							+ (options.expires * 24 * 60 * 60 * 1000));
				} else {
					date = options.expires;
				}
				expires = '; expires=' + date.toUTCString();
			}
			var path = options.path ? '; path=' + (options.path) : ';path=/';
			var domain = options.domain ? '; domain=' + (options.domain) : '';
			var secure = options.secure ? '; secure' : '';
			document.cookie = [ name, '=', encodeURIComponent(value), expires,
					path, domain, secure ].join('');
		} else {
			var cookieValue = null;
			if (document.cookie && document.cookie != '') {
				var cookies = document.cookie.split(';');
				for (var i = 0; i < cookies.length; i++) {
					var cookie = wx.trim(cookies[i]);
					if (cookie.substring(0, name.length + 1) == (name + '=')) {
						cookieValue = decodeURIComponent(cookie
								.substring(name.length + 1));
						break;
					}
				}
			}
			return cookieValue;
		}
	};

	wx.removeCookie = function(key) {
		wx.cookie(key, '', {
			expires : -1
		});
	};
	
	wx.validator = {
		required : function(value) {
			return value.length > 0;
		},
		email : function(value) {
			return value.length == 0
					|| /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i
							.test(value);
		},
		mobile : function(value) {
			return value.length == 0 || /^1[3|4|5|8][0-9]\d{8}$/.test(value);
		},
		telphone : function(value) {
			return value.length == 0
					|| /^(\d{3}-\d{8}|\d{4,5}-\d{7,8})$/.test(value);
		},
		range : function(value, param) {
			param = param.split("-");
			return value.length == 0
					|| (value >= parseFloat(param[0]) && value <= parseFloat(param[1]));
		},
		min : function(value, param) {
			return value.length == 0 || (value >= parseFloat(param));
		},
		max : function(value, param) {
			return value.length == 0 || value <= parseFloat(param);
		},
		rangeEqual : function(value, param) {
			return value.length == 0 || value.length == param.length;
		},
		rangelength : function(value, param) {
			param = param.split("-");
			return value.length == 0
					|| (value.length >= parseInt(param[0]) && value.length <= parseInt(param[1]));
		},
		minLength : function(value, param) {
			return value.length == 0 || value.length >= parseInt(param);
		},
		maxLength : function(value, param) {
			return value.length == 0 || value.length <= parseInt(param);
		},
		byteRangeLength : function(value, param) {
			param = param.split("-");
			return value.length == 0
					|| (value.getBytes() >= parseInt(param[0]) && value
							.getBytes() <= parseInt(param[1]));
		},
		byteMinLength : function(value, param) {
			return value.length == 0 || value.getBytes() >= parseInt(param);
		},
		byteMaxLength : function(value, param) {
			return value.length == 0 || value.getBytes() <= parseInt(param);
		},
		byteRangeEqual : function(value, param) {
			return value.length == 0 || value.getBytes() == param.length;
		},
		equalTo : function(value, equalToElement) {
			return value.length == 0 || value.length > 0
					&& value == $("input[name='" + equalToElement + "']").val();
		},
		digits : function(value) {
			return value.length == 0 || /^\d+$/.test(value);
		},
		post : function(value) {
			return value.length == 0 || /^[0-9]{6}$/.test(value);
		},
		passport : function(value) {
			return value.length == 0
					|| /^1[45][0-9]{7}$|^G[0-9]{8}$|^P[0-9]{7}$|^S[0-9]{7,8}$|^D[0-9]+$/
							.test(value);
		},
		noSymbol : function(value) {
			return value.length == 0 || /^[\w|\u4e00-\u9fa5]*$/.test(value);
		},
		url : function(value) {
			return value.length == 0
					|| /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i
							.test(value);
		},
		basic : function(value) {
			return !/select|update|delete|truncate|join|union|exec|insert|drop|count|'|"|;|>|<|%/i
					.test(value);
		}
	};
})(window, document, jQuery);
/** *******判断字符长度,汉字为2个字符*********** */
var jmz = {};
jmz.GetLength = function(str) {
	var realLength = 0, len = str.length, charCode = -1;
	for (var i = 0; i < len; i++) {
		charCode = str.charCodeAt(i);
		if (charCode >= 0 && charCode <= 128)
			realLength += 1;
		else
			realLength += 2;
	}
	return realLength;
};

/**
 * 喜欢操作
 */
var inlikedealrequest = 0;
function like_deal_v2(id, el) {
	if (inlikedealrequest)
		return;
	inlikedealrequest = 1;
	var dataType = typeof type == "undefined" ? "&type=0" : type;
	$.ajax({
		url : "addAttention.watt?id=" + id,
		dataType : "json",
		success : function(ajaxobj) {
			inlikedealrequest = false;
			if (ajaxobj.status > 0) {
				var nums = parseInt($(el).attr('rel')) + 1;
				$(el).html(nums + "");
				$("#strong_like_count").html(nums);
				$(el).removeClass("like");
				$(el).addClass("liked");
				$(".Js-changelike")
						.html(
								'<i class="common-sprite icon-like  ie6fixpic"></i>已喜欢');
				el.onclick = function() {
				};
			} else {
				alert(ajaxobj.info);
			}
			;
		},
		error : function(ajaxobj) {
			inlikedealrequest = false;
		}
	});
};

/**
 * 发起鉴定:上传封面
 * @param obj
 * @param file_id
 * @param callback
 */
function upd_file(obj,file_id,callback){	

	$("input[name='"+file_id+"']").bind("change",function(){		
		  $.ajaxFileUpload
		   (
			   {
				    url:'fileUpload.watt',
				    secureuri:false,
				    fileElementId:file_id,
				    dataType: 'json',
				    success: function (data, status)
				    {
				   		$(obj).show();
				   		$(obj).parent().find(".fileuploading").removeClass("hide");
						$(obj).parent().find(".fileuploading").removeClass("show");
						$(obj).parent().find(".fileuploading").addClass("hide");
				   		if(data.status==1)
				   		{
				   			$("#image").attr("src",data.thumb_url+"?r="+Math.random());
				   			$("input[name='image']").val(data.url);
				   			if(callback)
				   				window[callback](data);
				   		}
				   		else
				   		{
				   			console.log(data.msg);
				   		}
				   		
				    },
				    error: function (data, status, e)
				    {
				    	console.log(data.responseText);
				    	$(obj).show();
				    	$(obj).parent().find(".fileuploading").removeClass("hide");
						$(obj).parent().find(".fileuploading").removeClass("show");
						$(obj).parent().find(".fileuploading").addClass("hide");
				    }
			   }
		   );
		  $("input[name='"+file_id+"']").unbind("change");
	});	
}