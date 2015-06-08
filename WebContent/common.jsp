<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 尾部开始 -->
  <div class="footer">
		<div class="footer-in">
		</div>
  </div>
  <!-- 尾部结束 -->
  
  
  <!-- log and reg -->
  <div id="login-box" class="log-reg-alert-warp">
  			<div class="log-reg-title-warp">
  				<span class="log-reg-title">登录</span>
  				<a href="javascript:void(0);"><span class="cancel-icon fa fa-close"></span></a>
  			</div>
  			<span class="login-message">${message}</span>
  			
  			<form class="login-form log-reg-content" action="LoginServlet" method="post">
  				<div class="form-line">
	  				
	  				<input class="user-name log-reg-input" type="text" name="user_name" placeholder="用户名"><br/>
	  				 
  				</div>
  				<div class="form-line">
	  				
	  				<input class="user-pass log-reg-input" type="password" name="user_pass" placeholder="密&nbsp;&nbsp;&nbsp;码"><br/>
	  				 
	  			</div>
	  			<c:if test="${wrongPassCount>3}">
		  			<div class="form-line">
		  				<input class="log-reg-input very-code-input" type="text" name="veryCode" id="veryCode" placeholder="验证码"/>
				 		<a href="#" onclick="changeImg()"><img id="veryImg" src="VerifyCodeServlet"/></a>
				 		<label id="veryCode-error" class="error" for="veryCode">验证码错误！</label>
				 	</div>	
			 	</c:if>
			 	
			 	
		 		<input type="submit" class="submit-btn login-btn" value="登&nbsp;&nbsp;&nbsp;录">
		 		
  			</form>
  			<a class="form-bottom-a register-a reg-btn" href="javascript:void(0);">注册</a>
  			<a class="form-bottom-a forget-a" href="forget.jsp">忘记密码</a>
 </div>
  
 <div id="register-box" class="log-reg-alert-warp">
  			<div class="log-reg-title-warp">
  				<span class="log-reg-title">注册</span>
  				<a href="javascript:void(0);"><span class="cancel-icon fa fa-close"></span></a>
  			</div>
  			
  			<form class="register-form log-reg-content" action="RegisterServlet" method="post">
  				<div class="form-line">
	  				
	  				<input class="user-name log-reg-input" type="text" name="user_name" placeholder="用户名"><br/>
	  				
  				</div>
  				<div class="form-line">
	  				
	  				<input type="email" class="user-email log-reg-input" name="user_email" placeholder="邮&nbsp;&nbsp;&nbsp;箱">
	  				
	  			</div>
	  			<div class="form-line">	
	  				
	  				<input type="password" class="user_pass log-reg-input" name="user_pass" placeholder="密&nbsp;&nbsp;&nbsp;码">
			 		
			 	</div>	
			 	<div class="form-line">	
	  				
	  				 <input type="password" class="pass_conf log-reg-input" name="pass_conf" placeholder="确&nbsp;&nbsp;&nbsp;认">
			 		
			 	</div>	
			 	
			 
			   <input class="input-submit submit-btn" type="submit" value="注&nbsp;&nbsp;&nbsp;册"/>
			 	
		 		<!-- <a class="submit-btn register-btn" href="javascript:void(0);">注&nbsp;&nbsp;&nbsp;册</a> -->
		 		
  			</form>
  			<a class="form-bottom-a register-a log-btn" href="javascript:void(0);">登录</a>
  			<a class="form-bottom-a forget-a" href="policy.jsp">用户协议</a>
  </div>
  
  
  
  <div class="alert-box">
  	<div class="alert-title">提示</div>
  </div>
  
  <div class="back-top">
  	<span class="back-top-icon fa fa-arrow-circle-up"></span>
  </div>