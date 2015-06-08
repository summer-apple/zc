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
	            <li class="selected"><a href="settings-pass.jsp">密码修改</a></li>
	            <li><a href="settings-avatar.jsp">头像修改</a></li>   
	            <li><a href="GetAddressListServlet">收件地址管理</a></li>                    
	        </ul>
	</div>
	
<div class="form-wrap">	
${message}

<form class="change-pass-form" action="UpdateUserPassServlet" method="post" style="  padding-top: 15px;">
	<div class="line">
		<label>原&nbsp;&nbsp;密&nbsp;&nbsp;码：</label>
		<input class="old-pass" type="password" name="old_pass" placeholder="原密码"/>
	</div>
	<div class="line">
		<label>新&nbsp;&nbsp;密&nbsp;&nbsp;码：</label>	
		<input class="new-pass" type="password" name="new_pass" placeholder="新密码"/>
	</div>
	<div class="line">
		<label>确认密码：</label>
		<input class="new-pass-conf" type="password" name="new_pass_conf" placeholder="确认新密码"/>
	</div>
	
	<input class="update-btn" type="submit" value="更新"> 
	
</form>

</div>
</div>
</div>
<%@ include file="common.jsp"%> 
<%@ include file="script.jsp"%> 
<script src="js/jquery.validate.min.js"></script>
	<script src="js/messages_zh.js"></script>
	<script type="text/javascript">
		$().ready(function(){
			
		$(".change-pass-form").validate({
       		
				rules:{
						old_pass:{
							required:true
						},
						new_pass:{
								required:true,
								rangelength:[5,16],
							},
						new_pass_conf:{
								required:true,
								equalTo:".new-pass"
						}
							
					}
					
			});//Validate验证

	
	
	});
	</script>

</body>
</html>