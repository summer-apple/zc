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
<title>忘记密码</title>
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
	            <li class="selected"><a href="settings.jsp">资料修改</a></li>
	            <li><a href="settings-pass.jsp">密码修改</a></li>
	            <li><a href="settings-avatar.jsp">头像修改</a></li>   
	            <li><a href="GetAddressListServlet">收件地址管理</a></li>                    
	        </ul>
	</div>
	
	
<div class="form-wrap">
${message }
 
<form class="forget_form" action="ForgetPassServlet" method="post" style="padding-top: 30px;">
	
    <div class="line">           
		<label for="user_email">邮箱：</label>
		<input type="email" name="user_email" required placeholder="邮箱" />
	</div>
	
	<input class="cancel-save-btn" type="submit" value="验证"/>
	<a class="cancel-save-btn" href="login.jsp">取消</a>
</form>

</div></div></div>
<%@ include file="common.jsp"%> 
<%@ include file="script.jsp"%>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/messages_zh.js"></script>  
    <script type="text/javascript">
    	$().ready(function(e) {
		
			
			
			$(".forget_form").validate({
				
				rules:{
						user_email:{
								required:true,
								email:true
							}
					}
				
				});
			
			
        });
    </script> 
</body>
</html>