(function(window,document,$,undefined){
  "use strict";

  var _winWidth  = $(window).width(),
      _winHeight = $(window).height();
      
	function wx(){}
  window.wx = wx;

  if(typeof console == "undefined"){
    window.console = {log:function(){}};
  }
  wx.VERSION = "1.2.3";
  wx.MODULE  = "";
  wx.ACTION  = "";
  wx.REQUEST = {};
  wx.BACK    = 0;
  wx.RELOAD  = 1;

  _pageInit();
  _protoExtend();
  $(function(){
    wx.validator();
    _checkPlugin();
    if($.isFunction(window["wxInit"]))
      window["wxInit"]();
  });



  wx.config = {
    flashPath : "/static/zhongchou/flash/",
    jsPath    : "/static/zhongchou/js/"
  };

  wx.template = function(id,data){
    if(!window.template)
      return "";
    else
      return wx.trim(window.template(id, (data||{})));
  };
	wx.throttle = function(fn, timeout){       
    var timer;
    return function(){
        var self = this, args = arguments;
        clearTimeout(timer);
        timer = setTimeout(function(){
            fn.apply(self, args);
        }, timeout);
    };
  };
  wx.random = function(min, max) {
    if (max == null) {
      max = min;
      min = 0;
    }
    return min + Math.floor(Math.random() * (max - min + 1));
  };
  wx.countDown = function(time,index,showCallback,doneCallback){
    var initTime = new Date().getTime();
    var timeback = time;
    function start(){
      var sTime = new Date().getTime();
      var timeId = setInterval(function(){
          var offsetTime = new Date().getTime()-sTime;
          sTime = new Date().getTime();
          time -= offsetTime;
          var fTime = getFormatTime(time,0);
          if(offsetTime>1200 || offsetTime<900){
            time =  timeback - (new Date().getTime()-initTime);
          }
          if(time<=0){
              clearInterval(timeId);
              if(typeof doneCallback !="undefined")
                  doneCallback(index);
          } else {
              showCallback && showCallback(fTime[0],fTime[1],fTime[2],fTime[3]);
          }
      },1000);
    }
    function getFormatTime(t,isShow){
      t=t/1000;
      var day    = Math.floor(t/(60*60*24));
      var hour   = Math.floor((t-day*24*60*60)/3600);
      var minute = Math.floor((t-day*24*60*60-hour*3600)/60);
      var second = Math.floor(t-day*24*60*60-hour*3600-minute*60);
      hour   = hour<10?"0"+hour:hour;
      minute = minute<10?"0"+minute:minute;
      second = second<10?"0"+second:second;
      isShow && showCallback && showCallback(day,hour,minute,second);
      return [day,hour,minute,second];
    }
    getFormatTime(time,1);
    start();
  };
  wx.imgLoad = function (url,callback) {
    var image = new Image();
    image.src = url;
    if (image.readyState) {
      image.onreadystatechange = function() {
        if (image.readyState == "loaded" || image.readyState == "complete"){
          image.onreadystatechange = null;
          callback(image.width,image.height);
        }
      };
    } else {
      image.onload = function() {
        if (image.complete)
          callback(image.width,image.height);
      };
    };
  };
  wx.isEmptyObject = function(O){
    for (var x in O){
     	return false;
    }
   	return true;
  };
  wx.jsonToString = function(json,isEncode){
    var strTemp = "";
    for (var key in json) {
    	strTemp += key + '=' + (isEncode?encodeURIComponent(json[key]):json[key]) + '&';
    }
    return strTemp.slice(0, -1);
  };
  wx.stringToJson = function(string){
    var tempURL = string.split('&'), json="";
    for(var i=0;i<tempURL.length;i++){
      var t= tempURL[i].split('=');
      json+="'"+t[0]+"':'"+t[1]+"',";
    }
    return eval("({"+json.slice(0,-1)+"})");
  };
  wx.trim = function(str, is_global) {
    if(!str) return "";
    var result = str.replace(/(^\s+)|(\s+$)/g, "");
    if (is_global) result = result.replace(/\s/g, "");
    return result;
  };
  wx.getScrollTop = function(){
    if($.browser.msie && parseInt($.browser.version)==6)
      return document.body.scrollTop;
    else if($.browser.safari)
      return window.pageYOffset;
    else
      return document.documentElement.scrollTop;
  };
  wx.deferred = function(){
    function Promise(){
      this.methods = [];
      this.isFirst = true;
    }
    Promise.prototype = {
      then : function(fn,context){
        this.methods.push({callback:fn,context:this});
        if(this.isFirst){
          this.next();
          this.isFirst = false;
        }
        return this;
      },
      next : function(){
        var _this = this,
            _next = this.methods.shift(),
             args = Array.prototype.slice.call(arguments);
        args.unshift(function(){
          if(_next)
            _this.next.apply(_this,arguments);
        });
        if(_next){
          _next.callback.apply(_next.context,args);
        }
      }
    };
    return new Promise;
  };
  wx.getMoveAction = function(moveBar,moveBody){
    var isMove = false,
        lastX = -1,lastY = -1,
        offsetX = -1,offsetY = -1,
        $winBody = $("body"),
        $moveBar = $(moveBar),$moveBody = $(moveBody),
        isAbsoluate = $moveBody.css("position")=="absolute"?true:false;
    if($moveBar.length==0 || $moveBody.length==0) return;
    $moveBar.css("cursor","move").unbind("mousedown").
      bind("mousedown",function(event){
        event.preventDefault();
        var body  = $moveBody,
            tempX = body.offset().left,
            tempY = body.offset().top - (isAbsoluate?0:$(document).scrollTop());
        isMove  = true;
        lastX   = event.clientX;
        lastY   = event.clientY;
        offsetX = event.clientX - tempX;
        offsetY = event.clientY - tempY;
        $winBody.unbind("mousemove").bind("mousemove",function(event){
            if(!isMove)
                return false;
            event.preventDefault();
            event.stopPropagation();
            lastX = event.clientX - lastX;
            lastY = event.clientY - lastY;
            body.css({"left" : event.clientX-lastX-offsetX,"top" : event.clientY-lastY-offsetY});
            lastX = event.clientX;
            lastY = event.clientY;
        });
    }).unbind("mouseup").bind("mouseup",function(event){
        isMove = false;
        $winBody.unbind("mousemove");
    });
    $winBody.unbind("mouseup").bind("mouseup",function(){
        isMove = false;
    });
    $moveBar.blur(function(){
        isMove = false;
        $winBody.unbind("mousemove");
    });
  };

  var _lastSendDataUrl,_lastUrlTimeout = wx.throttle(function(){_lastSendDataUrl="";},3000);
  wx.sendData=function(url,options,callback){
    var ajaxObj     = null,
    	  _this       = this,
        timeoutId   = -1,
        loadingPop  = null,
        timerLoadId = -1,
        currentUrl  = url+(options.param||options),
        urlParam    = options.param || ($.type(options)=="string"?options:'');

    if(!options.dontCheck && currentUrl == _lastSendDataUrl){
      _lastUrlTimeout();
      return;
    }
    _lastSendDataUrl = currentUrl;
    if($.isFunction(options)){
      callback = options;
      options  = {};
    }
    if(options.showLoad){
       timerLoadId = window.setTimeout(function(){
          loadingPop = wx.loading();
       },options.loadDelay||10);
    }
    if(options.sendTimeout){
      timeoutId = window.setTimeout(function(){ajaxObj.abort();if(callback) callback.call(_this,{status:"timeout"});wx.alert("请求超时，请稍后再试！");},options.timeout||20000);
    }
    ajaxObj = $.ajax({
      type: options.type || "post",
      url: url,
      async:options.async===false?false:true,
      context:options.context||this,
      data: urlParam,
      dataType: options.dataType||"json",
      success:function(backData,textStatus){
        if(options.showLoad)
          loadingPop.close();
        window.clearTimeout(timerLoadId);
        if(options.sendTimeout)
          window.clearTimeout(timeoutId);
        if(backData.status == "5" && (typeof options.alertPrompt!="undefined"?options.alertPrompt:true)){
          wx.alert(backData.message || backData.info,function(){if(callback) callback.call(options.context||_this, backData, options.extData);});
        } else {
          if(callback)
            callback.call(options.context||_this, backData, options.extData);
        }
      },error:function(xhr, textStatus, errorThrown){
        window.clearTimeout(timerLoadId);
        window.clearTimeout(timeoutId);
        if(callback)
          callback.call(_this,{status:"error",message:textStatus});
      }
    });
  };
  wx.getShadeLayer = function(layerClass){
    var window_height = $('body').outerHeight()>_winHeight?$('body').outerHeight():_winHeight;
    return '<div id="Js-shadeLayer" class="'+layerClass+' pop-bg ie6fixpic" style="width:'+_winWidth+'px;height:'+window_height+'px;"></div>';
  };
  wx.setEleToCenter = function(eleId,opts){
    opts = opts||{};
    var $ele   = $(eleId),
        width  = $ele.width(),
        height = $ele.height(),
        y      = opts.offsetY || 0;
    if($.browser.msie && ($.browser.version=="6.0" || $.browser.version=="7.0") || opts.scrollFollow){
      y += $(document).scrollTop()+_winHeight/2-height/2;
      $ele.css("position","absolute");
    } else {
      y += _winHeight/2-height/2;
      $ele.css("position","fixed");
    }
    $ele.css({"top" : opts.y || (y<0 ? 10 : y),
              "left": opts.x || (_winWidth/2-width/2+(opts.offsetX||0)) });
  };

  wx.loading = function(callback,opts){
    var temp = '<div class="pop-box pop-loading" style="width:300px;">\
      <div class="pop-body">\
          <p>&nbsp;&nbsp;&nbsp;加载中...</p>\
      </div>\
    </div>';
    return _pop(temp,callback,opts);
  };
  wx.alert = function(content,callback,opts){
    if(!content) return;
    if(!$.isFunction(callback) && $.type(callback)=="object")
      opts = callback;
    opts = opts || {};
    var temp = '<div class="pop alert">\
      <div class="pop-box">\
        <div class="title">\
            <h3 >'+(opts.title||"提示")+'</h3>\
            '+(opts.noBtn?'':'<a href="javascript:;" class="btn-close common-sprite ie6fixpic Js-pop-close">×</a>')+'\
        </div>\
        <div class="pop-body">\
            <div class="pop-info">\
                <h3>'+content+'</h3>\
            </div>\
            '+(opts.noBtn?'':'\
            <div class="btn">\
                <a class="btn-base btn-red-h30 common-sprite">\
                    <span class="common-sprite Js-pop-close">'+(opts.okText||"知道了")+'</span>\
                </a>\
            </div>')+'\
        </div>\
      </div>\
    </div>';
    return _pop(temp,callback,opts);
  };
  
  wx.confirm = function(content,callback,opts){
    if(!content) return;
    if(!$.isFunction(callback) && $.type(callback)=="object")
      opts = callback;
    opts = opts || {};
    var confirmPop,temp = '<div class="pop confirm">\
      <div class="pop-box">\
      <div class="title">\
        <h3 class="">'+(opts.title||"提示")+'</h3>\
        <a href="javascript:;" class="btn-close common-sprite ie6fixpic Js-pop-close">×</a>\
      </div> \
      <div class="pop-body">\
        <div class="pop-info">\
          <h3>'+content+'</h3>\
          '+(opts.subhead ? '<p>'+opts.subhead+'</p>' : '')+'\
        </div>\
        <div class="btn">\
          <a id="Js-confirm-ok" class="btn-base btn-red-h30 common-sprite">\
            <span class="common-sprite">'+(opts.okText ? opts.okText : '确认')+'</span>\
          </a>\
          <a class="btn-base btn-gray-h30 common-sprite Js-pop-close">\
            <span class="common-sprite">取消</span>\
          </a>\
        </div>\
      </div>\
      </div>\
    </div>';
    opts.shown = function(){
      $("#Js-confirm-ok").click(function(){
        if($.isFunction(callback))
          callback();
        confirmPop.close();
      });
    };
    confirmPop = _pop(temp,opts);
  };
  wx.popClose = function(){
    if(!$(".Js-pop").length) return;
    $("body").css("overflow","auto").unbind("keydown");
    $(".Js-pop-close").unbind("click");
    _closeAni("#Js-pop-body",function(){
       $(".Js-pop").hide().remove();
    });
  };
  wx.pop = function(content,callback,opts){
    if(!content) return;
    if(!$.isFunction(callback) && $.type(callback)=="object")
      opts = callback;
    opts = opts || {};
    var temp;
    if(/^#/.test(content)){
      if(!$(content).length) return;
      temp = '<div class="pop form" '+(opts.width ? 'style="width:'+opts.width+'"': '')+'>'+$(content).html()+'</div>';
      if(opts.removeAfterShow)
       $(content).remove();
    } else{
      temp = '<div class="pop form" '+(opts.width ? 'style="width:'+opts.width+'"': '')+'>'+content+'</div>';
    }
    return _pop(temp,callback,opts);
  };

	function _pop(content,callback,opts){
	 	if(!$.isFunction(callback) && $.type(callback)=="object")
	 	  opts = callback;
	 	opts = opts||{};
	  
    if(callback == wx.RELOAD){
      callback = function(){
        location.reload();
      };
    } else if(callback == wx.BACK){
      callback = function(){
        history.back(-1);
      };
    } else if(callback && $.type(callback) == "string"){
      var jumpUrl = callback;
      callback = function(){
        location.href = jumpUrl;
      };
    }
	 	$(".Js-pop").stop().remove();
	 	var htmlText=content;
	 	var temp = wx.getShadeLayer("Js-pop")+
	 	            "<div id='Js-pop-body' class='Js-pop' style='position: absolute; z-index:21'>"+
	 	              htmlText+
	 	            "</div>";
	 	$("body").append(temp).keydown(function(event){
      if(event.keyCode == 27)
        _close();
    });

	 	$("#Js-pop-body").children().show();
    opts.offsetY=-60;
	 	wx.setEleToCenter("#Js-pop-body",opts);
    wx.getMoveAction(".title","#Js-pop-body");
	
	 	function _close(){
	 	  if(opts.attachBg) $("body").css("overflow","auto");
      $("body").unbind("keydown");
      $(".Js-pop-close").unbind("click");
	 	  _closeAni("#Js-pop-body",function(){
	 	     $(".Js-pop").hide().remove();
	 	  },opts);
	 	}

	 	if(opts.layerClick){
	 	  $("#Js-shadeLayer").unbind("click").click(function(){
	 	    _close();
	 	  });
	 	}
	 	if(opts.attachBg){
	 	 $("body").css("overflow","hidden");
	 	}
	 	_popAni("#Js-pop-body",function(){
      if($.isFunction(opts.shown)){
        opts.shown();
      }
      if($.browser.msie && $.browser.version=="6.0"){
        if(typeof DD_belatedPNG != "undefined") DD_belatedPNG.fix('.ie6fixpic');
      }
      wx.validator();
      $(".Js-pop-close").click(function(){
       _close();
       if($.isFunction(callback))
          callback();
       else if($.isFunction(opts.close))
          opts.close();
      });
      if(opts.autoClose){
        window.setTimeout(function(){
          _close();
        },opts.autoCloseTime || 3000);
      }
   },opts);
	 	return {
	 	  close : _close,
	 	  open  : function(){
	 	   wx.pop(htmlText,callback,opts);
	 	  }
	  };
	}
	function _popAni(id,callback,opts){      
    if(!$.isFunction(callback) && $.type(callback)=="object")
      opts = callback;
    opts = opts||{};
    var o  = $(id);
    if(opts.notAni){
      o.show();
      if($.isFunction(callback))
        callback();
    } else {
      var top = parseInt(o.css("top").slice(0,-2));
      o.css("opacity",0);
      o.stop().animate({"opacity":1,"top":top+30},400,$.isFunction(callback)?callback:undefined);
    }
  };
  function _closeAni(id,callback,opts){
    if(!$.isFunction(callback) && $.type(callback)=="object")
      opts = callback;
    opts = opts||{};
    var o = $(id);
    if(opts.notAni){
      $("#Js-shadeLayer").css("opacity",0);
      o.css("opacity",0);
      if(callback)
        callback();
    } else {
      var top = parseInt(o.css("top").slice(0,-2));
      $("#Js-shadeLayer").animate({"opacity":0},200);
      o.stop().animate({"opacity":0,"top":top-30},300,callback);
    }
  }
  function _pageInit(){
    try{
      var path = location.pathname.substring(1).split("/");
      if(path[1]){
        for (var i = 0,list = path[1].split("-"),len = list.length; i < len; i+=2) {
          wx.REQUEST[list[i]] = list[i+1];
        }
      }
      wx.MODULE = path[0].split("-")[0];
      wx.ACTION = path[0].split("-")[1] || "index";
    }
    catch(e){}
  }

  wx.cookie = function(name, value, options){
    if (typeof value != 'undefined') {
      options = options || {};
      if (value === null) {
        value = '';
        options = $.extend({}, options);
        options.expires = -1;
      }
      var expires = '';
      if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
        var date;
        if (typeof options.expires == 'number') {
          date = new Date();
          date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
        } else {
          date = options.expires;
        }
        expires = '; expires=' + date.toUTCString();
      }
      var path = options.path ? '; path=' + (options.path) : ';path=/';
      var domain = options.domain ? '; domain=' + (options.domain) : '';
      var secure = options.secure ? '; secure' : '';
      document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else {
      var cookieValue = null;
      if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
          var cookie = wx.trim(cookies[i]);
          if (cookie.substring(0, name.length + 1) == (name + '=')) {
            cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
            break;
          }
        }
      }
      return cookieValue;
    }
  };

  wx.removeCookie = function(key){
    wx.cookie(key,'',{expires:-1});
  };

  function _createSwfObject(src, attributes, parameters) {
    var i, html, div, obj, attr = attributes || {}, param = parameters || {};
    $.extend(param, {wmode:"transparent",allowScriptAccess:"always",quality:"high",menu:"false",scale:"noScale",bgcolor:"#E0F8E2"});
    
    attr.type = 'application/x-shockwave-flash';
    if (window.ActiveXObject) {
      attr.classid = 'clsid:d27cdb6e-ae6d-11cf-96b8-444553540000';
      param.movie = src;
    } else {
      attr.data = src;
    }
    html = '<object';
    for (i in attr) {
      html += ' ' + i + '="' + attr[i] + '"';
    }
    html += '>';
    for (i in param) {
      html += '<param name="' + i + '" value="' + param[i] + '" />';
    }
    html += '</object>';
    div = document.createElement('div');
    div.innerHTML = html;
    obj = div.firstChild;
    div.removeChild(obj);
    return obj;
  }
  wx.loadFlash = function(flashName,id,width,height,callback){
    callback = callback || function(){};
    if($("#"+id).length){
        callback(window[id]);
        return "";
    } else{
      window.wxFlashLoaded = function(){
        callback(window[id]);
      };
      return _createSwfObject(wx.config.flashPath+flashName+'.swf?t='+new Date().getTime(), {id: id, width: width, height: height});
    }
  };

  wx.data = function(key,value,callback){
    var storage = window.localStorage;
    if(storage){
        if($.isFunction(value)){
          value(storage.getItem(key));
        } else {
          if(!callback){
            callback = function(isSucc){
              if(!isSucc && typeof isSucc != "undefined") throw new Error("wx.data localStorage error");
            };
          }
          if(value == -1)
            callback(storage.removeItem(key));
          else
            callback(storage.setItem(key,value));
        }
    } else {
      var flash = wx.loadFlash("wx","wx-flashObject",1,1,function(flashObj){
        if($.isFunction(value)){
          value(flashObj.loadData(key));
        } else {
          if(!callback){
            callback = function(isSucc){
              if(!isSucc) throw new Error("wx.data flash error");
            };
          }
          if(value == -1)
            callback(flashObj.deleteData(key));
          else
            callback(flashObj.saveData(key,value));
        }
      });
      $("body").append(flash);
    }
  };

  wx.validator = function(){
    var prefix = wx.validator.config["validatorPrefix"],$form  = $("form["+prefix+"]");
    $form.each(initElement);

    function initElement(){
      var $thisForm = $(this),
          formInfo  = getFormInnerElement($thisForm);
      if($thisForm.data("hasValidator"))
        return;
      $thisForm.attr("autocomplete","off");
      $("a[type='submit']",$thisForm).click($.proxy(checkAll,this));
      $thisForm.submit($.proxy(checkAll,this));
      formInfo.$input.filter(":visible :last").keydown(function(event) {
        if(event.keyCode == 13) $thisForm.submit();
      });
      formInfo.$select.each(function(){
        var $thisSelect = $(this),
            thisAttr    = {"va" : $thisSelect.attr(prefix+"-error-value"),
                           "me" : prefix+"-"+$thisSelect.attr("name")+"-error",
                           "st" : $thisSelect.attr(prefix+"-show-type") || "normal",
                           "su" : $("#"+prefix+"-"+$thisSelect.attr("name")+"-success",$thisForm),
                           "nt" : typeof $thisSelect.attr(prefix+"-notip") != "undefined"};

        $thisSelect.blur(function(){
          var $this = $(this);
          $("#"+thisAttr["me"]).hide();
          thisAttr["su"].hide();
          if(wx.trim($this.val()) == wx.trim(thisAttr["va"])){
            setFirstErrorMessage($thisForm,$this.attr(thisAttr["me"]));
            if(!thisAttr["nt"]){
              if($("#"+thisAttr["me"]).length){
                $("#"+thisAttr["me"]).show();
              } else if($this.attr(thisAttr["me"])){
                if(thisAttr["st"] == "pop")
                  wx.alert($this.attr(thisAttr["me"]));
                else
                  $this.after('<'+formInfo.errTag+' id="'+thisAttr["me"]+'" class="'+formInfo.errClass+'">'+$this.attr(thisAttr["me"])+'</'+formInfo.errTag+'>');
              }
            }
            $thisForm.data("valid",false);
          } else if(thisAttr["su"].length){
            thisAttr["su"].show();
          }
        });
      });
      formInfo.$checkbox.each(function(){
        var $thisCheckbox = $(this),
            thisAttr      = {"nc" : prefix+"-"+$thisCheckbox.attr("name")+"-nocheck",
                             "st" : $thisCheckbox.attr(prefix+"-show-type") || "normal",
                             "su" : $("#"+prefix+"-"+$thisCheckbox.attr("name")+"-success",$thisForm),
                             "nt" : typeof $thisCheckbox.attr(prefix+"-notip") != "undefined"};
        thisAttr["me"] = $thisCheckbox.attr(thisAttr["nc"]);
        $thisCheckbox.blur(function(){
          $("#"+thisAttr["nc"]).hide();
          thisAttr["su"].hide();
          if(!$thisCheckbox.is(":checked") && thisAttr["me"]){
            setFirstErrorMessage($thisForm,thisAttr["me"]);
            if(!thisAttr["nt"]){
              if($("#"+thisAttr["nc"]).length){
                $("#"+thisAttr["nc"]).show();
              } else {
                if(thisAttr["st"] == "pop")
                  wx.alert(thisAttr["me"]);
                else
                  $thisCheckbox.after('<'+formInfo.errTag+' id="'+thisAttr["nc"]+'" class="'+formInfo.errClass+'">'+thisAttr["me"]+'</'+formInfo.errTag+'>');
              }
            }
            $thisForm.data("valid",false);
          } else if(thisAttr["su"].length){
            thisAttr["su"].show();
          }
        });
      });
      formInfo.$input.each(function(){
        var $thisInput = $(this),
            thisAttr   = {"ph" : $thisInput.attr(prefix+"-placeholder"),
                          "et" : ($thisInput.attr(prefix+"-event-type") || "blur"),
                          "ru" : $thisInput.attr(prefix+"-rule"),
                          "pa" : $thisInput.attr(prefix+"-param"),
                          "ls" : $thisInput.attr(prefix+"-left-show"),
                          "lm" : $thisInput.attr(prefix+"-left-mode")|| "normal",
                          "st" : $thisInput.attr(prefix+"-show-type") || "normal",
                          "na" : prefix+"-"+$thisInput.attr("name")+"-",
                          "nt" : typeof $thisInput.attr(prefix+"-notip") != "undefined",
                          "nb" : $thisInput.attr(prefix+"-noBasicRule")};
        if(formInfo.autocomp == "off"){
          $thisInput.val("");
        }
        if(thisAttr["ph"]){
          if('placeholder' in this){
            $thisInput.attr("placeholder",thisAttr["ph"]);
            $thisForm.data("placeholder",true);
          } else {
            $thisForm.data("placeholder",false);
            $thisInput.css("color","gray");
            if(!$thisInput.val())
			        $thisInput.val(thisAttr["ph"]);
            $thisInput.bind("click focus",function(){
              if($thisInput.val()==thisAttr["ph"])
                $thisInput.val("");
            });
            $thisInput.blur(function(){
              if($thisInput.val().length==0){
                $thisInput.css("color","gray");
                $thisInput.val(thisAttr["ph"]);
              }
            });
            $thisInput.bind("propertychange",function(){
              if($thisInput.val() == thisAttr["ph"])
                $thisInput.css("color","gray");
              else
                $thisInput.css("color","black");
            });
          }
        }
        $thisInput.bind(thisAttr["et"],function(){
            if(!thisAttr["ru"])
              return;
            var inputValue = $thisInput.val() == thisAttr["ph"] ? "" : wx.trim($thisInput.val(),"g"),
                inputParam = thisAttr["pa"] ? thisAttr["pa"].split("|") : "",
                $inputSucc = $("#"+thisAttr["na"]+"success",$thisForm),
                $inputErro = $("#"+thisAttr["na"]+"error",$thisForm),
                inputValid = true;

            $("[id^='"+thisAttr["na"]+"']",$thisForm).not("#"+thisAttr["na"]+"left").hide();
            $inputSucc.hide();

            $.each(thisAttr["ru"].split("|"),function(i,n){
              if(wx.validator.rule[n] && !wx.validator.rule[n](inputValue,inputParam[i] || "")){
                var errorFlag = thisAttr["na"]+n,
                    errorText = $thisInput.attr(errorFlag) || wx.validator.config[n].replace("@",inputParam[i]||"");
                inputValid = false;
                setFirstErrorMessage($thisForm,errorText);
                if(!thisAttr["nt"]){
                  if($inputErro.length){
                    $inputErro.show();
                  } else if($("#"+errorFlag,$thisForm).length){
                    $("#"+errorFlag,$thisForm).show();
                  } else {
                    if(thisAttr["st"] == "pop")
                      wx.alert(errorText);
                    else
                      $thisInput.after('<'+formInfo.errTag+' id="'+errorFlag+'" class="'+formInfo.errClass+'">'+errorText+'</'+formInfo.errTag+'>');
                  }
                }
                $thisForm.data("valid",false);
                return false;
              }
          });
          if(inputValid && $inputSucc.length)
            $inputSucc.show();
        });
        if(thisAttr["ls"]){
          var $leftShowTo = $("#"+thisAttr["na"]+"left",$thisForm),
              mode        = (thisAttr["lm"] == "byte" ? 1 : 0),
              maxLength   = parseInt(thisAttr["ls"]),
              inputColor  = $leftShowTo.css("color");
          if(!$leftShowTo.length) return;
          $thisInput.bind("keyup",function(){
            var allCount = mode ? $(this).val().getBytes() : $(this).val().length,
               leftCount = maxLength - allCount;
            if(leftCount>=0){
                $leftShowTo.css("color",inputColor);
            }
            else{
                $leftShowTo.css("color","red");
            }
            $leftShowTo.text(leftCount);
          });
        }
      });
      $thisForm.data("hasValidator",true);
    }
    function checkAll(event,isNoConfirm){
      var $thisForm  = $(this),
          isAjax     = typeof $thisForm.attr(prefix+"-ajax") != "undefined" ? "&ajax=1" : "",
          handleAjax = $thisForm.attr(prefix+"-ajax") || $thisForm.attr(prefix+"-ajax-action"),
          action     = $thisForm.attr("action"),
          callback   = $thisForm.attr("name"),
          formInfo   = getFormInnerElement($thisForm);
      $thisForm.data("valid",true);
      setFirstErrorMessage($thisForm,0,1);
      formInfo.$input.each(function(){
        var $thisInput = $(this);
        $thisInput.trigger($thisInput.attr(prefix+"-event-type")||"blur");
        if(!$thisForm.data("placeholder") && $thisInput.val() == $thisInput.attr(prefix+"-placeholder"))
          $thisInput.val("");
      });
      formInfo.$select.trigger("blur");
      formInfo.$checkbox.trigger("blur");
      var $submitErr = $("#"+prefix+"-submit-error");
      $submitErr.hide();

      if(!$thisForm.data("valid")){
        if(window.returnValue) window.returnValue = false;
        event.preventDefault();
        var message = $submitErr.length || formInfo.$submitBn.attr(prefix+"-submit-error");
        if(message){
          if($.type(message) == "number")
            $submitErr.show();
          else
             wx.alert(message);
        } else if(typeof formInfo.$submitBn.attr(prefix+"-get-error") !="undefined"){
          wx.alert(getFirstErrorMessage($thisForm));
        }
      } else {
        var confirmText = formInfo.$submitBn.attr(prefix+"-submit-confirm");

        if(confirmText && !isNoConfirm){
          wx.confirm(confirmText,function(){
            $thisForm.trigger("submit",true);
          });
          return false;
        }
        if(window[callback+"_before"] && !window[callback+"_before"]($thisForm,$(event.target))){
            return false;
        }
        if(isAjax){
          if(window.returnValue) window.returnValue = false;
          event.preventDefault();
          if(handleAjax){
            wx.sendData(action,$thisForm.serialize()+isAjax,function(ajData){
              if(ajData.status == 1)
                wx.alert(ajData.info||ajData.message,handleAjax.toUpperCase() == "JUMP" ? ajData.jump : wx[handleAjax.toUpperCase()]);
              else
                wx.alert(ajData.info||ajData.message);
            });
          } else{
            wx.sendData(action,$thisForm.serialize()+isAjax,$.isFunction(window[callback]) ? window[callback] : undefined);
          }
        }
      }
      if(!$thisForm.data("placeholder")) {
        formInfo.$input.each(function(){
          var $thisInput  = $(this),
              placeholder = $thisInput.attr(prefix+"-placeholder");
          if($thisInput.val().length==0 && placeholder)
            $thisInput.val(placeholder);
        });
      }
    }
    function getFormInnerElement($form){
      return{ 
        $checkbox : $("input[type=checkbox]",$form),
        $select   : $("select",$form),
        $input    : $("input,textarea",$form).not("[type=submit]").not("[type=radio]").not("[type=checkbox]"),
        $submitBn : $("a[type='submit']",$form).length ? $("a[type='submit']",$form) : $("input[type='submit']",$form),
        errClass  : $form.attr(prefix+"-error-class")||"error-text",
        errTag    : $form.attr(prefix+"-error-tag")||"span",
        autocomp  : $form.attr(prefix+"-autocomplete")||"on"
      };
    }
    function setFirstErrorMessage($form,message,reset){
      if(!$form.data("firstError") || reset)
        $form.data("firstError",message);
    }
    function getFirstErrorMessage($form){
      return $form.data("firstError");
    }
  };
  wx.validator.config = {
    "validatorPrefix" : "wx-validator",
    "required"        : "不能为空",
    "email"           : "请填写正确的电子邮箱",
    "mobile"          : "请填写正确的手机号码",
    "telphone"        : "请填写正确的固定电话",
    "range"           : "请输入区间在@的数字或字母",
    "min"             : "请输入不小于@的数字或字母",
    "max"             : "请输入不大于@的数字或字母",
    "rangeEqual"      : "请输入@位的数字或字母",
    "rangelength"     : "请输入@位的数字或字母",
    "minLength"       : "请输入不小于@位的数字或字母",
    "maxLength"       : "请输入不大于@位的数字或字母",
    "byteRangeEqual"  : "请输入@位的数字或字母",
    "byteRangeLength" : "请输入@位的数字或字母",
    "byteMinLength"   : "请输入不小于@位的数字或字母",
    "byteMaxLength"   : "请输入不大于@位的数字或字母",
    "equalTo"         : "请保持所填写的内容一致",
    "digits"          : "请填写数字",
    "post"            : "请填写正确的邮编号码",
    "noSymbol"        : "不能有符号",
    "url"             : "请使用正确格式，如http://www.zhongchou.cn"
  };
  wx.validator.addNewRule = function(ruleName,errorMessage,fn){
    if(!ruleName || !errorMessage || !fn) return;
    wx.validator.rule[ruleName]   = fn;
    wx.validator.config[ruleName] = errorMessage;
  };
  wx.validator.rule = {
      required: function(value){
        return value.length>0;
      },
      email: function(value) {
        return value.length==0 || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(value);
      },
      mobile: function(value){
        return value.length==0 || /^1[3|4|5|8][0-9]\d{8}$/.test(value);
      },
      telphone: function(value){
        return value.length==0 || /^(\d{3}-\d{8}|\d{4,5}-\d{7,8})$/.test(value);
      },
      range: function(value, param) {
        param = param.split("-");
        return value.length==0 || (value >= parseFloat(param[0]) && value <= parseFloat(param[1]));
      },
      min: function(value, param ) {
        return value.length==0 || (value >= parseFloat(param));
      },
      max: function( value, param ) {
        return value.length==0 || value <= parseFloat(param);
      },
      rangeEqual: function(value, param) {
        return  value.length==0 ||  value.length == param.length;
      },
      rangelength: function(value, param) {
        param = param.split("-");
        return  value.length==0 || ( value.length >= parseInt(param[0]) && value.length <= parseInt(param[1]) );
      },
      minLength:function(value, param){
        return value.length==0 || value.length >= parseInt(param);
      },
      maxLength:function(value, param){
        return value.length==0 || value.length <= parseInt(param);
      },
      byteRangeLength: function(value, param) {
        param = param.split("-");
        return  value.length==0 || ( value.getBytes() >= parseInt(param[0]) && value.getBytes() <= parseInt(param[1]) );
      },
      byteMinLength: function(value,param){
        return value.length==0 || value.getBytes() >= parseInt(param);
      },
      byteMaxLength:function(value, param){
        return value.length==0 || value.getBytes() <= parseInt(param);
      },
      byteRangeEqual: function(value, param) {
        return  value.length==0 ||  value.getBytes() == param.length;
      },
      equalTo: function(value, equalToElement) {
        return value.length==0 || value.length>0 && value == $("input[name='"+equalToElement+"']").val();
      },
      digits: function(value) {
        return value.length==0 || /^\d+$/.test(value);
      },
      post: function(value) {
        return value.length==0 || /^[0-9]{6}$/.test(value);
      },
      passport: function(value) {
        return value.length==0 || /^1[45][0-9]{7}$|^G[0-9]{8}$|^P[0-9]{7}$|^S[0-9]{7,8}$|^D[0-9]+$/.test(value);
      },
      noSymbol: function(value) {
        return value.length==0 || /^[\w|\u4e00-\u9fa5]*$/.test(value);
      },
      url: function(value){
        return value.length==0 || /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(value);
      },
      basic:function(value){
        return !/select|update|delete|truncate|join|union|exec|insert|drop|count|'|"|;|>|<|%/i.test(value);
      }
    };

  function _protoExtend(){
    var arrayProto = Array.prototype,stringProto = String.prototype;
    if(typeof stringProto.getBytes == "undefined"){
    	stringProto.getBytes = function() {
	    　　	var cArr = this.match(/[^x00-xff]/ig);
	    　　	return this.length + (cArr == null ? 0 : cArr.length);
  　　	}
    }
    if(typeof arrayProto.remove == "undefined"){
      arrayProto.remove = function(index){
        return index > this.length ? this : this.splice(index,1) && this;
      }
    }
    if(typeof arrayProto.indexOf == "undefined"){
      arrayProto.indexOf = function(value){
        for (var i = 0,len = this.length; i < len; i++) {
          if(this[i] == value)
            return i;
        }
        return -1;
      }
    }
  };
  
  function _checkPlugin(){
    var $body = $("body");
    var $wxUpload = $body.find("*[wx-upload='']");
    if($wxUpload.length){
      $.getScript(wx.config.jsPath+"wx.upload.js",function(){
        $wxUpload.each(function(){
          wx.upload($(this));
        })
      });
    }
  }
})(window,document,jQuery);if(typeof wx != "undefined"){
  wx.config = {
    flashPath : "/static/zhongchou/flash/",
    jsPath    : "/static/zhongchou/js/"
  };
}/*@copy haibao.com 2013.05.27 by tiansuwen*/
/*************************顶部"我的众筹"菜单及主导航展开*************************/
var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;
var backitem        = 0;
var hoveritem       = 0;
var whiteitem       = 0;


function jsddm_open()
{	
	jsddm_canceltimer();
	jsddm_close();
	ddmenuitem =$('#jsddm').find('.myinfo').show();
	ddmenuitem =$('#jsddm').find('.JS-myinfo').show();
	backitem = $('#jsddm').find('a.tit').addClass("active");
	hoveritem = $('#jsddm').find('a span.xm').css('color', '#190302');	
	whiteitem =$('.flinfo .white').css('visibility', 'hidden');
	}

function jsddm_close()
{	if(ddmenuitem) ddmenuitem.hide();
	if(backitem) backitem.removeClass("active");
	if(hoveritem) hoveritem.css('color', '#190302');
	if(whiteitem) whiteitem.css('visibility', 'hidden');
}

function jsddm_timer()
{	closetimer = window.setTimeout(jsddm_close, timeout);}

function jsddm_canceltimer()
{	if(closetimer)
	{	window.clearTimeout(closetimer);
		closetimer = null;}}

$(document).ready(function()
{	
	$('#jsddm ').bind('mouseover', jsddm_open);
	$('#jsddm ').bind('mouseout',  jsddm_timer);	
	});
	
document.onclick = jsddm_close;


/*********判断字符长度,汉字为2个字符************/
var jmz = {};
jmz.GetLength = function(str) {		    
    var realLength = 0, len = str.length, charCode = -1;
    for (var i = 0; i < len; i++) {
        charCode = str.charCodeAt(i);
        if (charCode >= 0 && charCode <= 128) realLength += 1;
        else realLength += 2;
    }
    return realLength;
};

/**
 * 喜欢操作
 */
var inlikedealrequest = 0;
function like_deal_v2(id, el) {
	if (inlikedealrequest) return;
	inlikedealrequest = 1;
	var dataType = typeof type=="undefined"?"&type=0":type;
	  $.ajax({
	    url: "addAttention.watt?id="+id,
	    dataType: "json",
	    success: function(ajaxobj) {
	    	inlikedealrequest = false;
	    	if (ajaxobj.status>0) {
		        var nums = parseInt($(el).attr('rel'))+1;
		        $(el).html(nums+"");
		        $("#strong_like_count").html(nums);
		        $(el).removeClass("like"); 
		        $(el).addClass("liked");
		        $(".Js-changelike").html('<i class="common-sprite icon-like  ie6fixpic"></i>已喜欢');
		        el.onclick = function() {};
	    	} else {
	    		alert(ajaxobj.info);
	    	};
	    },
	    error:function(ajaxobj){inlikedealrequest = false;}
	  });
	}
/*
 * 适用于预热项目的喜欢操作
 */
function like_deal_v3(id, el) {
	  if (inlikedealrequest) return;
	  inlikedealrequest = 1;
	  var dataType = typeof type=="undefined"?"&type=0":type;
	  var ajaxurl = APP_ROOT+"/index.php?ctl=deal&act=like&id="+id+dataType;
	  $.ajax({ 
	    url: ajaxurl,
	    dataType: "json",
	    success: function(ajaxobj) {
	      inlikedealrequest = false;
	      if (ajaxobj.status>0) {
	        var nums = parseInt($(el).attr('rel'))+1;
	        $(el).html("已喜欢");
	        //$(el).removeClass("like");
	        //$(el).addClass("liked");
	        $("#show_like_count").html(nums);
	        $("#activity_show_like").html("已喜欢 ("+nums+")");
	        $("#activity_show_like_top").html(nums);
	        el.onclick = function() {};
	      } else {
	        $.showErr(ajaxobj.info);
	      }
	    },
	    error:function(ajaxobj)
	    {
	      inlikedealrequest = false;
	    }
	  });
	}

var _gaList=[];
function _gaTrack(){
	if(_gaq && _gaq._getAsyncTracker){
		try{
			var g = _gaq._getAsyncTracker();
			g._trackEvent.apply(g,arguments);
		}
		catch(e){console.log(e);}
	}
	else{
		_gaList.push(arguments);
	}
}