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
<link rel="stylesheet" type="text/css" href="css/thumb-store.css">
</head>
<body>
  <%@ include file="head.jsp" %>

	<div class="main" style="margin-top:100px;">
		<div class="block">
			   		<div class="store-list-warp">
			   			<ul class="store-list">
			   				
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
	
	$.getJSON("BrowseStoreServlet", function(data){
		
		var $storelist = data.storelist;
		var $block = $(".block");
		
		  $.each($storelist, function(i, item) {
			  $block.find(".store-list").append(
	            	
	            		 "<li class='store-item'>"+
		   					"<div class='thumb-store-warp'>"+
		   						"<a href='GetStoreByIdServlet?store_id="+ item.store_id +"'><img class='thumb-store-head' src='" + item.store_head +"'/></a>" +
		   						"<span class='thumb-line thumb-store-title'><a href='GetProjectByIdServlet?store_id="+ item.store_id +"'>"+ item.store_name +"</a></span>"+
		   						//"<div class='thumb-line thumb-store-money-recive'>已筹资<span class='money-span'>￥"+ item.store_money_recive +"</span></div>"+
		   						//"<div class='thumb-line thumb-store-process-line'>"+
		   							"<div class='thumb-store-description'>"+item.store_description.substr(0,30)+"</div>"+
		   						//"</div>"+
		   						"<div class='thumb-line thumb-store-process-no'>"+ item.store_address_province+" "+item.store_address_city +"</div>"+
		   						"<div class='thumb-line thumb-store-day-left'>"+ item.store_class_name +"</div>"+
		   					"</div>"+
		   				"</li>"
	            		
	            );
	            
	        });
	  }); 
	



		
	  
});
</script> 
</body>
</html>