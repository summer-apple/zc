
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>index.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <%@ include file="css.jsp"%>
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/thumb-store.css">
  </head>
  
  <body>
  
  <%@ include file="head.jsp" %>
  
  
  
  <!-- 主体开始 -->
  <div class="main"> 
		
			    <div id="slides">
			      <img src="images/common/slide/1.jpg"/>
			      <img src="images/common/slide/2.jpg"/>
			      <img src="images/common/slide/3.jpg"/>
			      <img src="images/common/slide/4.jpg"/>
			      <img src="images/common/slide/2.jpg"/>
			      <img src="images/common/slide/3.jpg"/>
			    </div>
			    
			    <div class="class-nav-warp">
			    	<div class="class-nav">
			    		<ul class="class-list">
			    			<li class="class-item"><a href="store-list.jsp?store_class=keji">科技</a></li>
			    			<li class="class-item"><a href="store-list.jsp?store_class=gongyi">公益</a></li>
			    			<li class="class-item"><a href="store-list.jsp?store_class=chuban">出版</a></li>
			    			<li class="class-item"><a href="store-list.jsp?store_class=yule">娱乐</a></li>
			    			<li class="class-item"><a href="store-list.jsp?store_class=yishu">艺术</a></li>
			    			<li class="class-item"><a href="store-list.jsp?store_class=nongye">农业</a></li>
			    			<li class="class-item"><a href="store-list.jsp?store_class=shangpu">商铺</a></li>
			    		</ul>
			    	</div>
			    </div>
			   
			   
			   
		
		
		
		
				 <div class="block top-store">
			   		<div class="b-title">
			   			<span class="b-title-word">热门项目</span>
			   			<a class="see-all" href="store-list.jsp">浏览全部</a>
			   		</div>
			   		
			   		<div class="store-list-warp">
			   			<ul class="store-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block type1-store">
			   		<div class="b-title">
			   			<span class="b-title-word">科技</span>
			   			<a class="see-all" href="store-list.jsp?store_class=keji">浏览全部</a>
			   		</div>
			   		
			   		<div class="store-list-warp">
			   			<ul class="store-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block type2-store">
			   		<div class="b-title">
			   			<span class="b-title-word">公益</span>
			   			<a class="see-all" href="store-list.jsp?store_class=gongyi">浏览全部</a>
			   		</div>
			   		
			   		<div class="store-list-warp">
			   			<ul class="store-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block type3-store">
			   		<div class="b-title">
			   			<span class="b-title-word">娱乐</span>
			   			<a class="see-all" href="store-list.jsp?store_class=yule">浏览全部</a>
			   		</div>
			   		
			   		<div class="store-list-warp">
			   			<ul class="store-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block type4-store">
			   		<div class="b-title">
			   			<span class="b-title-word">艺术</span>
			   			<a class="see-all" href="store-list.jsp?store_class=yishu">浏览全部</a>
			   		</div>
			   		
			   		<div class="store-list-warp">
			   			<ul class="store-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block type5-store">
			   		<div class="b-title">
			   			<span class="b-title-word">出版</span>
			   			<a class="see-all" href="chuban">浏览全部</a>
			   		</div>
			   		
			   		<div class="store-list-warp">
			   			<ul class="store-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			    <div class="block type5-store">
			   		<div class="b-title">
			   			<span class="b-title-word">农业</span>
			   			<a class="see-all" href="nongye">浏览全部</a>
			   		</div>
			   		
			   		<div class="store-list-warp">
			   			<ul class="store-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
		
		
				
  		
  		
  		

  </div>
  <!-- 主体结束 -->
 
 
  
  <%@ include file="common.jsp" %>
  <%@ include file="script.jsp" %>
  
    <script type="text/javascript" src="js/jquery.slides.min.js"></script>
    

    <script type="text/javascript">
    	$().ready(function(){
    	
    	//轮播图
    		 $('#slides').slidesjs({
		        width: 1200,
		        height: 360,
		        play: {
		          active: true,
		          auto: true,
		          interval: 4000,
		          swap: true
		        }
		      });
		      
		 //插入轮播左右按钮
		  	$('#slides').append("<div class='pre-next-warp'><a class='pre-next pre-btn white' href='javascript:void(0);'><span class='fa fa-angle-left'></span></a><a class='pre-next next-btn white' href='javascript:void(0);'><span class='fa fa-angle-right'></span></a></div>");
		 	
		 	var $winwidth = $(document).width();
		 	if($winwidth>1600){
		 		
		 		var $maginleft = ($winwidth-1600)/2;
		 		$(".pre-next-warp").css("margin-left",$maginleft);
		 	}	
		 		
		 		var $maginleft2 = ($winwidth-136)/2; 
		 		$(".slidesjs-pagination").css("left",$maginleft2);
		 	
		 
		 
		 	$(window).resize(function(){
		 		var $winwidth = $(document).width();
		 		
		 		if($winwidth>1600){
			 		var $maginleft = ($winwidth-1600)/2;
			 		$(".pre-next-warp").css("margin-left",$maginleft);

		 		}
		 		
		 		var $maginleft2 = ($winwidth-136)/2; 
			 	$(".slidesjs-pagination").css("left",$maginleft2);
		 	});
		 	
		 
		 //轮播导航
		 
		 	$(".pre-btn").click(function(){
		 		$(".slidesjs-previous").click();
		 	});     
		    $(".next-btn").click(function(){
		 		$(".slidesjs-next").click();
		 	});  
		      
		    
		  //项目类别导航
		  
		    $(document).scroll(function(){
		
				if($(document).scrollTop()<500){
					$(".class-nav-warp").removeClass("class-nav-warp-fixed");
					$(".class-item a").removeClass("class-item-a-fixed");
				}
		
				if($(document).scrollTop()>500){
					
					$(".class-nav-warp").addClass("class-nav-warp-fixed");
					$(".class-item a").addClass("class-item-a-fixed");
				}
				
				
			});
		    
		  //项目类列表
		  
		  //获取热门
 		    $.getJSON("GetTopStoreServlet", function(data) {
			      
 		    	$block = $(".top-store");
 		    	$storelist = data.storelist;
 		    	gmc($storelist,$block);
 		    	
		 	}); 
		  
		  
 		 //获取类别
 		    $.getJSON("GetIndexStoreByClassServlet", function(data) {
			      
 		    	 var $block;
 		    	 var $storelist;
 		    	 
 		    	$block = $(".type1-store");
 		    	$storelist = data.keji.storelist;
 		    	gmc($storelist,$block);
 		    	
 		    	$block = $(".type2-store");
 		    	$storelist = data.gongyi.storelist;
 		    	gmc($storelist,$block);
 		    	
 		    	$block = $(".type3-store");
 		    	$storelist = data.yishu.storelist;
 		    	gmc($storelist,$block);
 		    	
 		    	$block = $(".type4-store");
 		    	$storelist = data.nongye.storelist;
 		    	gmc($storelist,$block);
 		    	
 		    	$block = $(".type5-store");
 		    	$storelist = data.chuban.storelist;
 		    	gmc($storelist,$block);
 		    	
 		    	$block = $(".type6-store");
 		    	$storelist = data.yule.storelist;
 		    	gmc($storelist,$block);
 		    	 
 		    	
		       
		 
		 	}); 
		  
 		 //json 解析方法
		  function gmc($storelist,$block){
			  $.each($storelist, function(i, item) {
				  $block.find(".store-list").append(
		            		
		            		"<li class='store-item'>"+
			   					"<div class='thumb-store-warp'>"+
			   						"<a href='GetProjectByIdServlet?store_id="+ item.store_id +"'><img class='thumb-store-head' src='" + item.store_head +"'/></a>" +
			   						"<span class='thumb-line thumb-store-title'><a href='GetProjectByIdServlet?store_id="+ item.store_id +"'>"+ item.store_title +"</a></span>"+
			   						"<div class='thumb-line thumb-store-money-recive'>已筹资<span class='money-span'>￥"+ item.store_money_recive +"</span></div>"+
			   						"<div class='thumb-line thumb-store-process-line'>"+
			   							"<div class='progress'>"+
										  "<div class='progress-bar' role='progressbar' aria-valuemin='0' aria-valuemax='100' style='width: "+ item.store_process +"%'></div>"+
										"</div>"+
			   						"</div>"+
			   						"<div class='thumb-line thumb-store-process-no'>"+ item.store_process +"%</div>"+
			   						"<div class='thumb-line thumb-store-day-left'>剩余"+ item.store_day_left +"天</div>"+
			   					"</div>"+
			   				"</li>"
		            		
		            );
		            
		        });
		  }
		  
	
		  
		  
    	});
    </script>
  </body>
</html>
