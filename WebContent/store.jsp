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
			
			
			
			<div class="return-list-wrap">
			
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
				<div class="store-owner-info">
					<div class="store-owner-avatar">
						<img src="${store.store_owner_id}"/>
					</div>
					
					<div class="store-owner-name">
					</div>
					
					
				</div>
			</div>
		</div>
	</div>


	<!-- <div class="b-wrapper" style="width:1000px;height:500px;background-color:#F00;">
		<div style="width:700px; height:400px;background-color:#CDD;">
			asdf
		</div>
	</div>
 -->



</div>






<%-- ${store.store_id}
${store.store_title}
${store.store_head}
${store.store_owner_id}
${store.store_owner_name}
${store.store_class}
${store.store_state}
${store.store_start}
${store.store_end}
${store.store_days}
${store.store_money}
${store.store_money_recive}
${store.store_address_province}
${store.store_address_city}
${store.store_description}
${store.store_content}



<c:if test="${!empty store.store_return}">
<table class="table return-list">
	<tr>
		<td>回报ID</td>
		<td>回报内容</td>
		<td>回报图片</td>
		<td>回报期限</td>
		<td>回报类型</td>
		<td>支持人数限制</td>
		<td>支持金额</td>
		<td>运费</td>
		<td>项目ID</td>
		<td>操作</td>
	</tr>
	<c:forEach items="${store.store_return}" var="r">
		<tr>
			<td>${r.return_id}</td>
			<td>${r.return_content}</td>
			<td><img src="${r.return_image}" style="width:100px;"/></td>
			<td>${r.return_time}</td>
			<td>${r.return_type}</td>
			<td>${r.support_limit}</td>
			<td>${r.support_money}</td>
			<td>${r.freight}</td>
			<td>${r.store_id}</td>
			<td><a href="OrderConfirmServlet?return_id=${r.return_id}&store_id=${r.store_id}&user_id=${user.user_id}">支持</a></td>
		</tr>
	</c:forEach>
</table>
</c:if>  --%>
<%@ include file="common.jsp"%> 
<%@ include file="script.jsp"%> 
</body>
</html>