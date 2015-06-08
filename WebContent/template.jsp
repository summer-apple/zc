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
<div class="r" style="background-color:#F00; width:100px; height:100px;position: absolute;">asdf</div>
<div class="a" style="background-color:rgba(55,55,55,0.5);padding:0px;position:absolute;z-index:100;">aaa</div>



<%@ include file="script.jsp"%>
<script type="text/javascript"> 
$().ready(function() { 
	$(".r").click(function(){
		alert("rrrrrrrr");
	});
	$(".a").css({
		"height":$(window).height(),
		"width":$(document).width()
	});

	//alert($(window).height()); //浏览器时下窗口可视区域高度 
	/* alert($(document).height()); //浏览器时下窗口文档的高度 
	alert($(document.body).height());//浏览器时下窗口文档body的高度 
	alert($(document.body).outerHeight(true));//浏览器时下窗口文档body的总高度 包括border padding margin  */
	//alert($(window).width()); //浏览器时下窗口可视区域宽度 
	/* alert($(document).width());//浏览器时下窗口文档对于象宽度 
	alert($(document.body).width());//浏览器时下窗口文档body的高度 
	alert($(document.body).outerWidth(true));//浏览器时下窗口文档body的总宽度 包括border padding margin  */
});
</script> 
</body>
</html>