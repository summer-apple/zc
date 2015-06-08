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
<style type="text/css">
.launch-wrap {
	width:100%;
	height:600px;
	min-width:1200px;
	background-image:url(images/common/launch-bg.jpg);
	margin-top:60px;
	text-align:center;
	background-repeat: no-repeat;
  background-size: cover;
}
.line1 {
  width: 469px;
  font-size: 35px;
  color: #fff09d;
  margin-left: auto;
  margin-right: auto;
  padding-top: 90px;
}
.line2 {
  color: #FFF;
  margin-top: 15px;
}
.line3 {
  font-size: 13px;
  margin-top: 25px;
}
.line3 a:hover {
	color:#FFF;
}
.line4 {
display: block;
  width: 450px;
  height: 80px;
  margin-left: auto;
  margin-right: auto;
  margin-top: 35px;
}
.line4 a {
display: block;
  width: 100%;
  height: 100%;
    border: 2px solid #FFF;
    line-height:80px;
    color:#FFF;
    font-size:30px;
}
.line4 a:hover {
	color:#55acef;
	background-color:#FFF;
}
.line5 {
  margin-top: 45px;
}
}
</style> 
</head>
<body>
<%@ include file="head.jsp"%>  

<div class="launch-wrap">
	<div class="line1">如果你有一颗真诚的心<br>
那么请在这里发起你的梦想</div>
	<div class="line2">众筹网是一家可以帮助您实现梦想的网站，在这里您可以发布您的梦想、创意和创业计划，并通过网络平台面对公众集资，<br>
让有创造力的人可能获得他们所需要的资金，以便使他们的梦想有可能实现。</div>
	<div class="line3">
		 <span class="fa fa-check"></span>阅读并同意众筹网的 <a href="#">《服务协议》</a>
	</div>
	<div class="line4">
		<a href="orgin-project.jsp">发起我的梦想</a>
	</div>
	<div class="line5">
		<img src="images/common/tree.png"/>
	</div>
</div>


<%@ include file="common.jsp"%>  
<%@ include file="script.jsp"%> 
</body>
</html>