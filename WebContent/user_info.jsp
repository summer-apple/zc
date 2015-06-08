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
<title>用户信息</title>
<%@ include file="meta.jsp"%>
<%@ include file="css.jsp"%>
</head>
<body>

${user.user_name}<br>
${user.user_email}<br>
${user.user_sex}<br>
${user.user_avatar}<br>
${user.user_phone}<br>
${user.user_account}<br>
${user.user_true_name}<br>


<a href="settings.jsp">更新资料</a>

<%@ include file="script.jsp"%>

</body>
</html>