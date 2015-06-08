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
<img class="head_img" alt="上传用户头像,如果未更改请刷新" width="200px" height="200px"><br>
		
		
		
		
	  <form action="UploadProjectHeadServlet" enctype="multipart/form-data" method="post">
      	<input type="file" name="file" class="file" hidden="true">
	    <input type="button" class="choose_img up_bt" value="选择图片">
		
		<input type="submit" class="upload_bt up_bt" value="上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传"> 
	  </form>



<%@ include file="script.jsp"%> 
<script type="text/javascript">
	$().ready(function(){
		$(".file").hide();
		
		$(".choose_img").click(function(){
		
			$(".file").click();
		
		});
		$(".file").change(function(){

			var objUrl = getObjectURL(this.files[0]) ;
			console.log("objUrl = "+objUrl) ;
			if (objUrl) {
				$(".head_img").attr("src", objUrl) ;
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
		
		
		$(".upload_bt").click(function(){

		
			
			
		});
		
		
		
		});
	</script>
</body>
</html>