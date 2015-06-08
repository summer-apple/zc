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

	<span id="project_head_url" style="display:none;">${project_head_url}</span>


<%@ include file="script.jsp"%> 
<script type="text/javascript">
	$().ready(function(){
		var $project_head_url = $("#project_head_url").html();
		
		$(".project-head-img", window.parent.document).show().html("<img src='"+ $project_head_url+"'/>");
		$(".project-head", window.parent.document).val($project_head_url);
		$("#head-img-btn", window.parent.document).html("修改");
		
		$(".upload-head-box", window.parent.document).hide();
	});
</script>
</body>
</html>