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
	<link rel="stylesheet" type="text/css" href="css/thumb-project.css">
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
			    			<li class="class-item"><a href="project-list.jsp?project_class=keji">科技</a></li>
			    			<li class="class-item"><a href="project-list.jsp?project_class=gongyi">公益</a></li>
			    			<li class="class-item"><a href="project-list.jsp?project_class=chuban">出版</a></li>
			    			<li class="class-item"><a href="project-list.jsp?project_class=yule">娱乐</a></li>
			    			<li class="class-item"><a href="project-list.jsp?project_class=yishu">艺术</a></li>
			    			<li class="class-item"><a href="project-list.jsp?project_class=nongye">农业</a></li>
			    			<li class="class-item"><a href="project-list.jsp?project_class=shangpu">商铺</a></li>
			    		</ul>
			    	</div>
			    </div>
			   
			   
			   
		
		
		
		
				 <div class="block top-project">
			   		<div class="b-title">
			   			<span class="b-title-word">热门项目</span>
			   			<a class="see-all" href="project-list.jsp">浏览全部</a>
			   		</div>
			   		
			   		<div class="project-list-warp">
			   			<ul class="project-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block keji-project">
			   		<div class="b-title">
			   			<span class="b-title-word">科技</span>
			   			<a class="see-all" href="project-list.jsp?project_class=keji">浏览全部</a>
			   		</div>
			   		
			   		<div class="project-list-warp">
			   			<ul class="project-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block gongyi-project">
			   		<div class="b-title">
			   			<span class="b-title-word">公益</span>
			   			<a class="see-all" href="project-list.jsp?project_class=gongyi">浏览全部</a>
			   		</div>
			   		
			   		<div class="project-list-warp">
			   			<ul class="project-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block yule-project">
			   		<div class="b-title">
			   			<span class="b-title-word">娱乐</span>
			   			<a class="see-all" href="project-list.jsp?project_class=yule">浏览全部</a>
			   		</div>
			   		
			   		<div class="project-list-warp">
			   			<ul class="project-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block yishu-project">
			   		<div class="b-title">
			   			<span class="b-title-word">艺术</span>
			   			<a class="see-all" href="project-list.jsp?project_class=yishu">浏览全部</a>
			   		</div>
			   		
			   		<div class="project-list-warp">
			   			<ul class="project-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			   <div class="block chuban-project">
			   		<div class="b-title">
			   			<span class="b-title-word">出版</span>
			   			<a class="see-all" href="chuban">浏览全部</a>
			   		</div>
			   		
			   		<div class="project-list-warp">
			   			<ul class="project-list">
			   				<!-- ajax添加 -->
			   			</ul>
			   		</div>
			   </div>
			   
			    <div class="block nongye-project">
			   		<div class="b-title">
			   			<span class="b-title-word">农业</span>
			   			<a class="see-all" href="nongye">浏览全部</a>
			   		</div>
			   		
			   		<div class="project-list-warp">
			   			<ul class="project-list">
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
 		    $.getJSON("GetTopProjectServlet", function(data) {
			      
 		    	$block = $(".top-project");
 		    	$projectlist = data.projectlist;
 		    	gmc($projectlist,$block);
 		    	
		 	}); 
		  
		  
 		 //获取类别
 		    $.getJSON("GetIndexProjectByClassServlet", function(data) {
			      
 		    	 var $block;
 		    	 var $projectlist;
 		    	 
 		    	$block = $(".keji-project");
 		    	$projectlist = data.keji.projectlist;
 		    	gmc($projectlist,$block);
 		    	
 		    	$block = $(".gongyi-project");
 		    	$projectlist = data.gongyi.projectlist;
 		    	gmc($projectlist,$block);
 		    	
 		    	$block = $(".yishu-project");
 		    	$projectlist = data.yishu.projectlist;
 		    	gmc($projectlist,$block);
 		    	
 		    	$block = $(".nongye-project");
 		    	$projectlist = data.nongye.projectlist;
 		    	gmc($projectlist,$block);
 		    	
 		    	$block = $(".chuban-project");
 		    	$projectlist = data.chuban.projectlist;
 		    	gmc($projectlist,$block);
 		    	
 		    	$block = $(".yule-project");
 		    	$projectlist = data.yule.projectlist;
 		    	gmc($projectlist,$block);
 		    	 
 		    	
		       
		 
		 	}); 
		  
 		 //json 解析方法
		  function gmc($projectlist,$block){
			  $.each($projectlist, function(i, item) {
				  $block.find(".project-list").append(
		            		
		            		"<li class='project-item'>"+
			   					"<div class='thumb-project-warp'>"+
			   						"<a href='GetProjectByIdServlet?project_id="+ item.project_id +"'><img class='thumb-project-head' src='" + item.project_head +"'/></a>" +
			   						"<span class='thumb-line thumb-project-title'><a href='GetProjectByIdServlet?project_id="+ item.project_id +"'>"+ item.project_title +"</a></span>"+
			   						"<div class='thumb-line thumb-project-money-recive'>已筹资<span class='money-span'>￥"+ item.project_money_recive +"</span></div>"+
			   						"<div class='thumb-line thumb-project-process-line'>"+
			   							"<div class='progress'>"+
										  "<div class='progress-bar' role='progressbar' aria-valuemin='0' aria-valuemax='100' style='width: "+ item.project_process +"%'></div>"+
										"</div>"+
			   						"</div>"+
			   						"<div class='thumb-line thumb-project-process-no'>"+ item.project_process +"%</div>"+
			   						"<div class='thumb-line thumb-project-day-left'>剩余"+ item.project_day_left +"天</div>"+
			   					"</div>"+
			   				"</li>"
		            		
		            );
		            
		        });
		  }
		  
	
		  
		  
    	});
    </script>
  </body>
</html>
