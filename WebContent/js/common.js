$().ready(function(){
	//用户操作下拉列表
	$(".avatar-warp").mouseover(function(){
		$(".user-operation").show().mouseover(function(){
			$(this).show();
		});
	}).mouseout(function(){
		$(".user-operation").hide().mouseout(function(){
			$(this).hide();
		});
	});
	//搜索框按钮调用
	$(".search-btn-icon").click(function(){
		
		$(".search").submit();
	});
	
	//页面遮罩层
	$(".click-mask").click(function(){
		var $height = $(window).height();
		var $width = $(document).width();
		$("body").css({overflow:"hidden"});   
		$("body").append("<div class='body-mask'></div>");
	});
	
	//取消按钮
	$(".cancel-icon").click(function(){
		$(".log-reg-alert-warp").hide();
		$(".body-mask").remove();
	});
	
	
	//缩放窗口时调整登录注册框位置
	
	$(window).resize(function(){
		if($("#login-box").css("display")=="block"){
			var $height = $(window).height();
			var $width = $(document).width();
			if($width<1200){
				var $top = ($height-400)/2 + "px";
				$("#login-box").css({"left":"600px","top":$top});
			}else{
				var $top = ($height-400)/2 + "px";
				var $left = ($width-375)/2 + "px";
				$("#login-box").css({"left":$left,"top":$top});
			}
		}
	});
	
	//登录注册框弹出并居中
	
	$(".log-btn").click(function(){
		$("#register-box").hide();
		var $height = $(window).height();
		var $width = $(document).width();
		if($width<1200){
			var $top = ($height-400)/2 + "px";
			$("#login-box").css({"left":"600px","top":$top});
		}else{
			var $top = ($height-400)/2 + "px";
			var $left = ($width-375)/2 + "px";
			$("#login-box").css({"left":$left,"top":$top});
		}
		$("#login-box").show();
	});
	
	$(".reg-btn").click(function(){
		$("#login-box").hide();
		var $height = $(window).height();
		var $width = $(document).width();
		if($width<1200){
			var $top = ($height-500)/2 + "px";
			$("#register-box").css({"left":"600px","top":$top});
		}else{
			var $top = ($height-500)/2 + "px";
			var $left = ($width-375)/2 + "px";
			$("#register-box").css({"left":$left,"top":$top});
		}
		$("#register-box").show();
	});
	
	
	//登录提交
	
	$(".login-btn").click(function(){
		
		var $un = $(".user-name").val();
		var $up = $(".user-pass").val();
		$.ajax({
			type:"POST",
			url:"LoginServlet",
			data:{user_name:$un,user_pass:$up}
			
		});
		
	});
	
	
	if($(".login-message").html()=="用户名或密码错误！"){
		$(".log-btn").click();
	}
	
	
	

	
	//消息提醒框居中
	if($(".alert-box").is(":visible")){
		var $height = $(window).height();
		var $width = $(document).width();
		var $top = 	($(window).height()-$(".alert-box").height())/2;
		var $left = ($(window).width()-$(".alert-box").width())/2;

		
		$(".alert-box").css({
			"top":$top,
			"left":$left
		});
	}
	
	
	
	//返回顶部按钮
	  $('.back-top').click(function(event) {//设置返回顶层按钮滚动
	        event.preventDefault();
	        var link = this;
	        $.smoothScroll({
	          scrollTarget: link.hash
	        });
	 });
	
	
	$(document).scroll(function(){
		
		if($(document).scrollTop()<300){
			$(".back-top").hide();
		}

		if($(document).scrollTop()>300){
			
			//alert($(document).scrollTop());
			
			var $height = $(window).height();
			var $width = $(document).width();
			
			//alert($height);
			
			$(".back-top").css({
				"top":$height-70,
				"left":$width-75
			}).show();
		}
		
		
	});
	
	
	
	//登录验证
	
	$(".login-form").validate({
		rules:{	
				user_name:{
					required:true
				},
				user_pass:{
					required:true
				},
				veryCode:{
						required:true,
						remote:{
							        url: "CheckVerifyCodeServlet",
							        type: "post",
							        contentType: "application/x-www-form-urlencoded; charset=utf-8"
						}
					}
					
			},
			
		messages:{
					user_name:"请输入用户名！",
					user_pass:"请输入密码！",
			        veryCode:{
			        	required:"请输入验证码！",
			            remote:"验证码错误！"
			        }
			    }
			
	});
	
	
	//注册验证
	
	$(".register-form").validate({
   		
		rules:{
				user_name:{
						required:true,
						rangelength:[5,10],
						remote:{
							        url: "CheckUserNameServlet",
							        type: "post",
							        contentType: "application/x-www-form-urlencoded; charset=utf-8"
						}
					},
				user_email:{
						required:true,
						email:true,
						remote:{
							        url: "CheckUserEmailServlet",
							        type: "post",
							        contentType: "application/x-www-form-urlencoded; charset=utf-8"
						
								}
					},
				user_pass:{
						required:true,
						rangelength:[5,16],
					},
				pass_conf:{
						required:true,
						equalTo:".user_pass"
				}
					
			}
			
	});//Validate验证
	
	//验证码开始
	
	if($("#veryCode").is(":visible")){
		var $h = $("#login-box").height()+20;
		$("#login-box").css("height",$h);
	}
	
	function changeImg(){    
	    var imgSrc = $("#veryImg");    
	    var src = imgSrc.attr("src");    
	    imgSrc.attr("src",chgUrl(src));    
	}    
	//时间戳    
	//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳    
	function chgUrl(url){    
	    var timestamp = (new Date()).valueOf();    
	    url = url.substring(0,17);    
	    if((url.indexOf("&")>=0)){    
	        url = url + "×tamp=" + timestamp;    
	    }else{    
	        url = url + "?timestamp=" + timestamp;    
	    }    
	    return url;    
	}    
	   
	function isRightCode(){    
	    var code = $("#veryCode").val();

	    code = "c=" + code;    
	    $.ajax({    
	        type:"POST",    
	        url:"CheckVerifyCodeServlet",    
	        data:code,    
	        success:callback    
	    });    
	}    
	   
	function callback(data){    
	    $("#veryInfo").html(data);    
	} 
	//验证码结束
	
	
	
		
	
	
	
	
});
