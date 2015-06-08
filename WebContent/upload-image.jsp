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
.up-bt {
	width: 75px;
  height: 30px;
  font-size: 13px;
  color: #FFF;
  background-color: #55acef;
  margin-top: 5px;
  margin-right: 10px;
  margin-left: 11px;
  line-height: 30px;
}
</style>
</head>
<body>
<img class="head-img" alt="如果未更改请刷新" width="200px" height="200px"><br>
		
		
		
		
	  <form class="frame-form" action="" enctype="multipart/form-data" method="post">
      	<input type="file" name="file" class="file" hidden="true">
      	
	    <input type="button" class="choose-img up-bt" value="选择图片">
		
		<input type="submit" class="upload-bt up-bt" value="上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传"> 
	  </form>



<%@ include file="script.jsp"%> 
<script type="text/javascript">
	$().ready(function(){
		$(".file").hide();
		
		$(".choose-img").click(function(){
		
			$(".file").click();
		
		});
		$(".file").change(function(){

			var objUrl = getObjectURL(this.files[0]) ;
			console.log("objUrl = "+objUrl) ;
			if (objUrl) {
				$(".head-img").attr("src", objUrl) ;
			}
		}) ;
		//建立一個可存取到該file的url
		function getObjectURL(file) {
			var url = null ; 
			if (window.createObjectURL!=undefined) { // basic
				url = window.createObjectURL(file) ;
			} else if (window.URL!=undefined) { // mozilla(firefox)
				url = window.URL.createObjectURL(file) ;
			} else if (window.webkitURL!=undefined) { // webkit or chrome
				url = window.webkitURL.createObjectURL(file) ;
			}
			return url ;
		}
		
		var $formaction = $("#form-action", window.parent.document).html();
		//alert($formaction);
		$(".frame-form").attr("action",$formaction);
		
		
		
		});
	</script>
</body>
</html>