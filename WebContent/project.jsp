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
<link rel="stylesheet" type="text/css" href="css/project.css">
</head>
<body>

<%@ include file="head.jsp" %>

<div class="main">
	
	<div class="top-wrap">
		<div class="top-left">
			<div class="head-img-wrap">
				<img class="head-img" src="${project.project_head}"/>
			</div>
			<div class="head-process-wrap">
				<span class="head-process">已完成${project.project_process}%</span>
			</div>
		</div>
		
		<div class="top-right">
			<div class="project-title">${project.project_title}</div>
			<div class="project-description">${project.project_description}</div>
			
			
			
			<div class="return-list-wrap">
				<ul class="return-list">
				<c:forEach items="${project.project_return}" var="r" begin="0" end="2">
					<li class="return-item">
						<div class="return-item-left">
							<div class="return-content">${r.return_content}</div>
							<span class="return-info info-1">支持:${r.support_count}人</span>
							<span class="return-info info-2">运费:${r.freight}元</span>
							<span class="return-info info-3">回报:${r.return_time}天</span>
						</div>
						<div class="return-item-right">
							<c:if test="${!empty user}">
								<a href="OrderConfirmServlet?return_id=${r.return_id}&project_id=${r.project_id}&user_id=${user.user_id}">支持￥${r.support_money}</a>
							</c:if>
							<c:if test="${empty user}">
								<a class="click-mask log-btn" href="javascript:void(0);">支持￥${r.support_money}</a>
							</c:if>
						</div>
					</li>
				</c:forEach>	
				</ul>
			</div>
			
			
		</div>
		

	

</div>
	<div class="bottom-wrap-bg">
		<div class="bottom-wrap">
			<div class="bottom-left">
				<div class="project-content-title">项目内容</div>
				<div class="project-content">${project.project_content}</div>
			</div>
			<div class="bottom-right">
				<div class="project-owner-info">
					<div class="project-owner-avatar">
						<img src="${project.project_owner_avatar}"/>
					</div>
					
					<div class="project-owner-name">
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






<%-- ${project.project_id}
${project.project_title}
${project.project_head}
${project.project_owner_id}
${project.project_owner_name}
${project.project_class}
${project.project_state}
${project.project_start}
${project.project_end}
${project.project_days}
${project.project_money}
${project.project_money_recive}
${project.project_address_province}
${project.project_address_city}
${project.project_description}
${project.project_content}



<c:if test="${!empty project.project_return}">
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
	<c:forEach items="${project.project_return}" var="r">
		<tr>
			<td>${r.return_id}</td>
			<td>${r.return_content}</td>
			<td><img src="${r.return_image}" style="width:100px;"/></td>
			<td>${r.return_time}</td>
			<td>${r.return_type}</td>
			<td>${r.support_limit}</td>
			<td>${r.support_money}</td>
			<td>${r.freight}</td>
			<td>${r.project_id}</td>
			<td><a href="OrderConfirmServlet?return_id=${r.return_id}&project_id=${r.project_id}&user_id=${user.user_id}">支持</a></td>
		</tr>
	</c:forEach>
</table>
</c:if>  --%>
<%@ include file="common.jsp"%> 
<%@ include file="script.jsp"%> 
</body>
</html>