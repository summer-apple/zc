<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user-center.jsp' starting page</title>
    
	<%@ include file="meta.jsp" %>
	<%@ include file="css.jsp" %>
	<link rel="stylesheet" type="text/css" href="css/user-center-setting.css">
		


  </head>
  
  <body>
  <%@ include file="head.jsp" %>
  <div class="main">
  	<div class="main-content">
   		<div class="personal-center-left">
	        <ul>
	           <li class="selected"><a href="user-center.jsp" class="blue">我的订单</a></li>
             	<li><a href="GetStoreByOwnerServlet" class="blue">我的店铺</a></li>  
             	<li><a href="user-account.jsp">账户余额</a></li>                
	        </ul>
		</div>
   		
   		<div class="personal-center-right">

			<div class="personal-center-right-top">
					<img class="big-user-head"
						src="${user.user_avatar }" />

					<div class="user-info-warp">
						<div class="big-user-name">
							${user.user_name }
						</div>
						<div class="user-regin">
							<i class="fa fa-map-marker"></i>
							${user.user_address_province }
							${user.user_address_city }
						</div>
						<div class="user-settings">
							<i class="fa fa-android"></i>
							<a href="settings.jsp">个人设置</a>
						</div>
					</div>
				</div>

			<div class="my-support-project-warp">
				<table class="table table-bordered table-striped">
					<tr class="tb-title">
						<td style="width: 50px;">订单ID</td>
						<td style="width: 200px;">商店名称</td>
						<td style="width: 75px;">用户名称</td>
						<td style="width: 75px;">用户真名</td>
						<td style="width: 75px;">消费金额</td> 
						<td style="width: 75px;">订单时间</td> 
						<td style="width: 50px;">订单状态</td>
					</tr>
					
					
					
				</table>
			</div>
			
		</div>
		
		
		
   	</div>
  </div> 
   
   <%@ include file="common.jsp" %>
   <%@ include file="script.jsp" %>
   <script type="text/javascript">
	$().ready(function(){

		    $.getJSON("GetSorderByUserServlet", function(data) {
		      
		    	$.each(data.sorderlist, function(i, item) {
					$("tbody").append(
 								"<tr><td><a href='GetSorderByIdServlet?sorder_id="+item.sorder_id+"'>"+item.sorder_id+"</a></td>"+
 								"<td><a href='GetStoreByIdServlet?store_id="+item.store_id+"'>"+ item.store_name +"</a></td>"+
 								"<td>"+ item.user_name +"</td>"+
 								"<td>"+ item.user_true_name +"</td>"+
 								"<td>￥"+ item.sorder_amount +"</td>"+
 								"<td>"+ item.sorder_time +"</td>"+
 								"<td>"+ item.sorder_state +"</td></tr>"
							);

			    	});
		    	
	 	}); 

		    
		 	
		});
   </script>
  </body>
</html>
