<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title></title>
<%@ include file="meta.jsp"%>
<%@ include file="css.jsp"%>  
<link rel="stylesheet" type="text/css" href="css/thumb-project.css">
<style type="text/css">
.select-option-warp {
  width: 1200px;
  height: 170px;

  margin-left: auto;
  margin-right: auto;
  margin-top: 80px;
}
.select-option {
  width: 100%;
  border: 1px solid #DDD;
  height: 50px;
  margin-bottom: 10px;
}
.select-type {
  float: left;
  line-height: 50px;
  margin-left: 20px;
  font-size: 12px;
}
.select-item {
  float: left;
  display: block;
  width: 100px;
  height: 100%;
  line-height: 50px;
  margin-left: 20px;
  text-align: center;
}
.select-item a {
  color:#999;
  text-align:left;
  text-decoration: none;
  font-size: 12px;
}
.selected a {
  color:#55acef;
    text-decoration: none;
}


.pagination-wrap {
  clear: both;
  width: 1200px;
  height: 50px;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  margin-bottom: 50px;
}
</style>
</head>
<body>
  <%@ include file="head.jsp" %>
  <div class="select-option-warp" style="display: block;">
  
  	<div class="select-option">
  		<span class="select-type">分类筛选</span>
  		<ul class="select-option-items fenlei">
  			<li class="select-item selected"><a href="javascript:void(0);">全部</a></li>
  			<li class="select-item"><a class="keji" href="javascript:void(0);">科技</a></li>
  			<li class="select-item"><a class="gongyi" href="javascript:void(0);">公益</a></li>
  			<li class="select-item"><a class="chuban" href="javascript:void(0);">出版</a></li>
  			<li class="select-item"><a class="yule" href="javascript:void(0);">娱乐</a></li>
  			<li class="select-item"><a class="yishu" href="javascript:void(0);">艺术</a></li>
  			<li class="select-item"><a class="nongye" href="javascript:void(0);">农业</a></li>
  			<li class="select-item"><a class="shangpu" href="javascript:void(0);">商铺</a></li>
  		</ul>
  	</div>
  	
  	<div class="select-option">
  		<span class="select-type">项目状态</span>
  		<ul class="select-option-items jincheng">
  			<li class="select-item selected"><a href="javascript:void(0);">全部</a></li>
  			<li class="select-item"><a href="javascript:void(0);">众筹中</a></li>
  			<li class="select-item"><a href="javascript:void(0);">已完成</a></li>
  			<li class="select-item"><a href="javascript:void(0);">未完成</a></li>
  		</ul>
  	</div>
  	
  	<div class="select-option">
  		<span class="select-type">排序方式</span>
  		<ul class="select-option-items paixu">
  			<li class="select-item selected"><a href="javascript:void(0);">默认排序</a><span class="hidden">默认排序</span></li>
  			<li class="select-item"><a href="javascript:void(0);">最新上线</a><span class="hidden">project_id desc</span></li>
  			<li class="select-item"><a href="javascript:void(0);">项目进度</a><span class="hidden">project_process desc</span></li>
  			<li class="select-item"><a href="javascript:void(0);">剩余时间</a><span class="hidden">project_day_left</span></li>
  			<li class="select-item"><a href="javascript:void(0);">支持金额</a><span class="hidden">project_money_recive desc</span></li>
  		</ul>
  	</div>
  	
  </div>
	<div class="main">
		<div class="block">
			   		<div class="project-list-warp">
			   			<ul class="project-list">
			   				
			   			</ul>
			   		</div>
		</div>
	</div>

<div class="pagination-wrap"><div class="pagination"></div></div>

<div class="json" style="display: none;">${json}</div>

 <%@ include file="common.jsp"%>
<%@ include file="script.jsp"%>
<script type="text/javascript" src="js/pagination.js"></script>

<script type="text/javascript"> 
$().ready(function() { 


//获取地址栏参数 调用getUrlParam(name)方法
	
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r!=null) return unescape(r[2]); return null;
		}
	
	var $cls = getUrlParam("project_class");

	

	if($cls != null){
			$(".fenlei .select-item a").each(function(){
				
				if($(this).hasClass($cls)){
					$(this).parents("ul").find(".selected").removeClass("selected");
					$(this).parent().addClass("selected").click();
					}
				});
		}







	
	var $projectlist = JSON.parse($(".json").html()).projectlist;
	var $block = $(".block");
	
	gmc($projectlist,$block); 
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





	//点击筛选条件
		$(".select-item a").click(function(){
			$(this).parent().siblings(".selected").removeClass("selected");
			$(this).parent().addClass("selected");

			var $project_class = $(".fenlei").find(".selected a").html();
			var $project_state = $(".jincheng").find(".selected a").html();
			var $order_by = $(".paixu").find(".selected a").next("span").html();

			
			$.ajax({
					type:"post",
					url:"GetSelectProjectServlet",
					data:{project_class:$project_class,project_state:$project_state,order_by:$order_by},
					dataType: "json",
					success:function(data){
						var $block;
				    	var $projectlist;
				    	 
				    	$block = $(".block");
				    	$projectlist = data.projectlist;
				    	$block.find(".project-list").html("");//清空原有数据
				    	gmc($projectlist,$block);

				    	//处理页码
						$count = data.count;
						
						$(".pagination").pagination($count, { 
							  prev_text: '&laquo;', 
							  next_text: '&raquo;',
							  ellipse_text:"...", 
							  items_per_page: 1, 
							  num_display_entries: 6, 
							  current_page: 0, 
							  num_edge_entries: 2,
							  link_to:"javascript:void(0);"
						}); 

						
						}
			});
			
			});



		
	  
});
</script> 
</body>
</html>