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
<link rel="stylesheet" type="text/css" href="css/store.css">
</head>
<body>

<%@ include file="head.jsp" %>

<div class="main">
	
	<div class="top-wrap">
		<div class="top-left">
			<div class="head-img-wrap">
				<img class="head-img" src="${store.store_head}"/>
			</div>
			<div class="head-process-wrap">
				<span class="head-process">9折优惠</span>
			</div>
		</div>
		
		<div class="top-right">
			<div class="store-name">${store.store_name}</div>
			<div class="store-description">${store.store_description}</div>
			
			
			<div class="order-btn-warp">
				<form class="form sorder-form" action="CreateSorderServlet" method="post">
					<div class="form-group">
						<input class="form-control sorder-amount" type="number" required placeholder="优惠前整数消费额" name="sorder_amount">
						<input name="user_id" value="${user.user_id}" hidden>
						<input name="store_id" value="${store.store_id}" hidden>
						<c:if test="${!empty user}">
							<input class="btn sub-btn" type="submit" value="结算">
						</c:if>
						<c:if test="${empty user}">
							<a class="click-mask log-btn" href="javascript:void(0);">结算</a>
						</c:if>
					</div>					
					
				</form>
			</div>
			
			
		</div>
		

	

</div>
	<div class="bottom-wrap-bg">
		<div class="bottom-wrap">
		
			<div class="bottom-left">
				<div class="store-content-title">项目内容</div>
				<div class="store-content">${store.store_content}</div>
			</div>
			
			<div class="bottom-right">
				<div class="store-owner-head">
						<img class="img img-circle" src="${store.store_head}"/>
					</div>
					
					<div class="store-info store-owner-name">
						店主：${store.store_owner_name}
					</div>
					<div class="store-info store-address">
						地区：${store.store_address_province}&nbsp;&nbsp;${store.store_address_city}
					</div>
					<div class="store-info store-phone">
						电话：${store.store_phone}
					</div>
					
					
				
				</div>
			</div>
			
		</div>
	</div>






<%@ include file="common.jsp"%> 
<%@ include file="script.jsp"%> 
</body>
</html>