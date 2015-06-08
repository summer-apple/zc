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
<body onload="setup();preselect('浙江省');">
<%@ include file="head.jsp" %>	
<div class="main">
<div class="main-content">



		

	<div class="settings-bar">
	        <ul>
	            <li><a href="settings.jsp">资料修改</a></li>
	            <li><a href="settings-pass.jsp">密码修改</a></li>
	            <li><a href="settings-avatar.jsp">头像修改</a></li>   
	            <li class="selected"><a href="GetAddressListServlet">收件地址管理</a></li>                    
	        </ul>
	</div>
	
	 
	<div class="address-list-wrap"> 
		<table class="address-list table table-bordered table-striped">
			<tr>
					<td style="width:75px">收件人</td>
					<td style="width:75px">手机</td>
					<td style="width:75px">省</td>
					<td style="width:75px">市</td>
					<td style="width:75px">区</td>
					<td>具体地址</td>
					<td style="width:75px">操作</td>
			</tr>
			<c:forEach items="${addressList}" var="address">
				<tr>
					<td>${address.address_name}</td>
					<td>${address.address_phone}</td>
					<td>${address.address_province}</td>
					<td>${address.address_city}</td>
					<td>${address.address_district}</td>
					<td>${address.address_detial}</td>
					<td>
						<form action="DeleteAddressServlet" method="post">
							<input type="hidden" name="address_id" value="${address.address_id}"/>
							<input class="delete-btn" type="submit" value="删除"/>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
</div>

<div class="form-wrap">
<form class="address-form" action="AddAddressServlet" method="post">
	<div class="line">
		<label>收件人姓名：</label>
		<input class="address-name" type="text" name="address_name" placeholder="收件人姓名"/>
	</div>
	
	<div class="line">
	<label>联系手机号：</label>
	<input class="address-phone" type="text" name="address_phone" placeholder="联系手机号"/><br>
	</div>
	
	<div class="line">
	<label>地址信息：&nbsp;&nbsp;&nbsp;&nbsp;</label>
	<select class="address-province" name="address_province" id="s1">
		<option></option>
	</select>
	<select class="address-city" name="address_city" id="s2">
		<option></option>
	</select>
	<select class="address-district" name="address_district" id="s3">
		<option></option>
	</select>
	</div>
	
	<div class="line">
	<label>详细地址：&nbsp;&nbsp;&nbsp;&nbsp;</label>
	<textarea name="address_detial" placeholder="详细地址"></textarea>
	</div>
	
	<input class="add-btn" type="submit" value="添加"/>
</form>
</div>
</div></div>
<%@ include file="common.jsp"%> 
<%@ include file="script.jsp"%> 
  <script type="text/javascript" src="js/jquery.validate.min.js"></script>
  <script type="text/javascript" src="js/messages_zh.js"></script>  
 <script type="text/javascript" src="js/geo.js"></script>
    <script type="text/javascript">
    	$().ready(function(e) {
		
		
		
			$(".address-form").validate({
				
				rules:{
						address_name:{
								required:true,
								maxlength:10
							},
						address_phone:{
								required:true,
								digits:true,
								minlength:11,
								maxlength:11
							},
						address_detial:{
								required:true
								
							}
					}
				
				});
			
			
        });
    </script> 
</body>
</html>