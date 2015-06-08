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

<link rel="stylesheet" type="text/css" href="css/user-center-setting.css"> 

</head>
<body>
<%@ include file="head.jsp" %>	
<div class="main">
<div class="main-content">



		

	<div class="settings-bar">
	        <ul>
	            <li><a href="settings.jsp">资料修改</a></li>
	            <li><a href="settings-pass.jsp">密码修改</a></li>
	            <li class="selected"><a href="settings-avatar.jsp">头像修改</a></li>   
	            <li><a href="GetAddressListServlet">收件地址管理</a></li>                    
	        </ul>
	</div>
	
	<div class="head-img-wrap up-wrap">
		<img class="head-img" src="${user.user_avatar}" alt="上传用户头像,如果未更改请刷新" width="200px" height="200px">
	</div>
		
	<div class="upload-form-wrap up-wrap">
		
		  <form action="UploadUserHeadServlet" enctype="multipart/form-data" method="post">
	      	<input type="file" name="file" class="file" hidden="true">
		    <input type="button" class="choose-img up-bt" value="选择图片">
			
			<input type="submit" class="upload-bt up-bt" value="上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传"> 
		  </form>
	  
	 </div>	
	 <div class="upload-tip-wrap up-wrap">请上传1:1正方形，格式为JPG/JEPG/PNG的图片！</div>
	 
	 <div class="upload-state-wrap up-wrap">上传结果:${uploadMessage}</div>
	

</div></div>
<%@ include file="common.jsp"%> 
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
		});
	</script>
</body>
</html>