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
	<span id="uploadMessage" style="display:none;">${uploadMessage}</span>

	<span id="image-url" style="display:none;">${image_url}</span>


<%@ include file="script.jsp"%> 
<script type="text/javascript">
	$().ready(function(){
		var $image_url = $("#image-url").html();
		
		$(".image-display", window.parent.document).show().html("<img src='"+ $image_url+"'/>");
		$(".image-value", window.parent.document).val($image_url);
		$("#image-btn", window.parent.document).html("修改");
		
		$(".upload-image-box", window.parent.document).hide();
	});
</script>
</body>
</html>