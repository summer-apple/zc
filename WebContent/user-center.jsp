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
	            <li class="selected"><a href="user-center.jsp">支持项目</a></li>
	            <li><a href="GetMyProjectServlet" class="blue">我的项目</a></li>
	            <li><a href="agree-project-protocol.jsp">发起项目</a></li>   
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
						<td style="width:75px;">项目图片</td>
						<td style="width:300px;">项目名称</td>
						<td style="width:120px;">支持日期</td>
						<td style="width:75px;">支持金额</td>
						<td style="width:75px;">支持状态</td>
						<td style="width:150px;">地址</td>
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

		    $.getJSON("GetOrderByUserServlet", function(data) {
		      
		    	$.each(data.orderlist, function(i, item) {
					$("tbody").append(
 								"<tr><td><a href='GetProjectByIdServlet?project_id="+item.project_id+"'><img class='tb-project-head' src='" + item.project_head +"'/></a></td>"+
 								"<td><a href='GetProjectByIdServlet?project_id="+item.project_id+"'>"+ item.project_title +"</a></td>"+
 								"<td>"+ item.order_time +"</td>"+
 								"<td>"+ item.support_money +"</td>"+
 								"<td>"+ item.order_state +"</td>"+
 								"<td>"+ item.address +"</td></tr>"
							);

			    	});
		    	
	 	}); 

		    
		 	
		});
   </script>
  </body>
</html>
