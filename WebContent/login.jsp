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
<title>众筹-登录</title>
<%@ include file="meta.jsp"%>
<%@ include file="css.jsp"%>  

</head>
<body>
${message}
<form class="login_form">
		<input type="text" class="user_name log_input" name="user_name" placeholder="用户名">
		<input type="password" class="user_pass log_input" name="user_pass" placeholder="密&nbsp;&nbsp;&nbsp;码">
		
		<c:if test="${wrongPassCount>3}">
			<input type="text" name="veryCode" id="veryCode" placeholder="验证码"/>
		 	<a href="#" onclick="changeImg()"><img id="veryImg" src="VerifyCodeServlet"/></a>
		</c:if>
		
		<input type="submit" class="login_bt" value="登&nbsp;&nbsp;&nbsp;录">
		<a href="forget.jsp">忘记密码</a>
</form>

<a href="login.jsp">登录</a>
<a href="register.jsp">注册</a>
<a href="user-center.jsp">个人中心</a>
<a href="settings.jsp">个人设置</a>
<%@ include file="script.jsp"%>  
<script type="text/javascript" src="js/verifyCode.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/messages_zh.js"></script>
<script type="text/javascript">
	$().ready(function(){
		$(".login_form").validate({
				rules:{	
						user_name:{
							required:true
						},
						user_pass:{
							required:true
						},
						veryCode:{
								required:true,
								remote:{
									        url: "CheckVerifyCodeServlet",
									        type: "post",
									        contentType: "application/x-www-form-urlencoded; charset=utf-8"
								}
							}
							
					},
					
				messages:{
							user_name:"请输入用户名！",
							user_pass:"请输入密码！",
					        veryCode:{
					        	required:"请输入验证码！",
					            remote:"验证码错误！"
					        }
					    }
					
			});
	});
</script>  
</body>
</html>