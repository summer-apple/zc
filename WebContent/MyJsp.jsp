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
</head>
<body>



<%@ include file="script.jsp"%>
<script type="text/javascript"> 
$().ready(function() { 
	
	 $.getJSON("GetTopProjectServlet", function(data) {
	      
	        $.each(data.projectlist, function(i, item) {
	            $("body").append(
	            		
	            		item.project_id+"<br>"+
	            		item.project_title+"<br>"+
	            		item.project_owner_id+"<br>"+
	            		"<img src='" +item.project_head+ "'/><br>"+
	            		item.project_money_recive+"<br>"+
	            		item.project_process+"%<br>"+
	            		
	            		item.project_money+"<br><br><br><br>"
	            		
	            );
	            
	        });
	 
	 });
});
</script> 
</body>
</html>