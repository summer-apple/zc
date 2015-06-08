<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Register</title>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/messages_zh.js"></script>
	<script type="text/javascript">
		$().ready(function(){
			
		$(".register_form").validate({
       		
				rules:{
						user_name:{
								required:true,
								rangelength:[5,10],
								remote:{
									        url: "CheckUserNameServlet",
									        type: "post",
									        contentType: "application/x-www-form-urlencoded; charset=utf-8"
								}
							},
						user_email:{
								required:true,
								email:true,
								remote:{
									        url: "CheckUserEmailServlet",
									        type: "post",
									        contentType: "application/x-www-form-urlencoded; charset=utf-8"
								
										}
							},
						user_pass:{
								required:true,
								rangelength:[5,16],
							},
						pass_conf:{
								required:true,
								equalTo:".user_pass"
						}
							
					}
					
			});//Validate验证

	
	
	});
	</script>

  </head>
  
  <body>
   <div class="register_box">
   
		<label class="company_name">众彩行</label>

	<form class="register_form" action="RegisterServlet" method="post">
		<input type="text" class="user_name reg_input" name="user_name" placeholder="用户名">
	     
	    <input type="email" class="user_email reg_input" name="user_email" placeholder="邮&nbsp;&nbsp;&nbsp;箱">
	    
		<input type="password" class="user_pass reg_input" name="user_pass" placeholder="密&nbsp;&nbsp;&nbsp;码">
	    
	    <input type="password" class="pass_conf reg_input" name="pass_conf" placeholder="确&nbsp;&nbsp;&nbsp;认">
	    
		<input type="submit" class="register_bt" value="注&nbsp;&nbsp;&nbsp;册">
	</form>

	<div class="log_pro">
    	<a href="login.jsp">登&nbsp;&nbsp;录</a>
        <a href="protocal.html">协&nbsp;&nbsp;议</a>
  </div> 
</div>
  </body>
</html>
