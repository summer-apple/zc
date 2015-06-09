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
<style>
.container {
	width:100px;
	height:100%;
	margin-top:100px;
}
</style>
</head>
<body>

<%@ include file="head.jsp" %>

<div class="container">

	<div class="row">
		<div class="col-12">
			<a href="GetUserListServlet">获取用户列表</a><br>
			<a href="GetStoreListServlet">获取商店列表</a><br>
			<a href="register-store.jsp">添加商店</a>
		</div>
	</div>


</div>

<%@ include file="common.jsp"%> 
<%@ include file="script.jsp"%> 
</body>
</html>