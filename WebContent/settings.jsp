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
<title>更新资料</title>
<%@ include file="meta.jsp"%>
<%@ include file="css.jsp"%>
<link rel="stylesheet" type="text/css" href="css/user-center-setting.css">  
</head>
<body onload="setup();promptinfo();">
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
	<form class="user_info" action="UpdateUserInfoServlet" method="post" style="  padding-top: 15px;">
	
		<div class="line line1">
			<label for="user_name">用户：</label>
			<label>${user.user_name}</label><br> 
		</div>
		
		<div class="line line2">
			<label for="user_email">邮箱：</label>
			<label>${user.user_email}</label><br>
		</div>
		
		<div class="line line3">
			<c:if test="${empty user.user_true_name}">
				<label>真名：</label>
				<input class=""  type="text" name="user_true_name" value="${user.user_true_name}" placeholder="提交后无法修改"/><br> 
			</c:if>
			<c:if test="${!empty user.user_true_name}">
				<label for="user_true_name">真名：</label>
				<label>${user.user_true_name}</label><br>
			</c:if>
		</div>
		
		<div class="line line4">
			<label>性别：</label>
			
			<c:if test="${user.user_sex eq '男'}">
			<input class=""  type="radio" name="user_sex" value="男" checked/><label>男</label> 
			<input class=""  type="radio" name="user_sex" value="女"/><label>女</label>
			</c:if>
			<c:if test="${user.user_sex eq '女'}">
			<input class=""  type="radio" name="user_sex" value="男"/><label>男</label>
			<input class=""  type="radio" name="user_sex" value="女" checked/><label>女</label>
			</c:if>
		</div>
		
		<div class="line line5">
			<label>手机：</label>
			<input class=""  type="text" name="user_phone" <c:if test="${!empty user.user_phone}">value="${user.user_phone}"</c:if>/><br> 
		</div>
		
		<div class="line line6">
			
		
		<c:if test="${!empty user.user_address_province}">
			
			<div class="change-address" style="display:none;">
			<label>地区：</label>
				<select class="address-province" name="user_address_province" id="s1">
					<option></option>
				</select>
				<select class="address-city" name="user_address_city" id="s2">
					<option></option>
				</select>
			</div>
			
			<div class="address">
				<label>地区：</label>
				<label>${user.user_address_province}&nbsp;&nbsp;&nbsp;&nbsp;${user.user_address_city}</label>
				<input type="hidden" name="user_address_province" value="${user.user_address_province}"/>
				<input type="hidden" name="user_address_city" value="${user.user_address_city}"/>
				<a class="change-address-bt" href="javascript:void(0)">更改</a><br>
			</div>
		</c:if>
		
		<c:if test="${empty user.user_address_province}">
		<label style="float:left;">地区：</label>
			<div class="change_address">
				<select class="address-province" name="user_address_province" id="s1">
					<option></option>
				</select>
				<select class="address-city" name="user_address_city" id="s2">
					<option></option>
				</select>
			</div>
		</c:if>
	               
		</div>
		
		
		
		<input class="cancel-save-btn" type="submit" value="保存"/>
		<a class="cancel-save-btn" href="user_info.jsp">取消</a>
	</form>
</div>


</div>
</div>
<%@ include file="common.jsp" %>	
<%@ include file="script.jsp"%>
    
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/messages_zh.js"></script>  
    <script type="text/javascript" src="js/geo.js"></script>
    <script type="text/javascript">
    	$().ready(function(e) {
		
		
			$(".change-address-bt").click(function(){
				$(".address").hide();
				$(".change-address").show();
			});
		
			
			
			$(".user-info").validate({
				
				rules:{
						user_ture_name:{
								required:true,
								maxlength:10
							},
						user_sex:{
								required:true
							},
						user_phone:{
								required:true,
								digits:true,
								minlength:11,
								maxlength:11
							}
					}
				
				});
			
			
        });
    </script> 
</body>
</html>