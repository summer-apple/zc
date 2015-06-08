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
   		<div class="personal-center-left">
	        <ul>
	            <li><a href="user-center.jsp">支持项目</a></li>
	            <li class="selected"><a href="GetMyProjectServlet" class="blue">我的项目</a></li>
	            <li><a href="agree-project-protocol.jsp">发起项目</a></li>   
	            <li><a href="user-account.jsp">账户余额</a></li>                    
	        </ul>
		</div>
		
	<div class="personal-center-right">

			<div class="personal-center-right-top">
					<img class="big-user-head"
						src="${user.user_avatar }" />

					<div class="user-info-warp">
						<div class="big-user-name">
							${user.user_name }
						</div>
						<div class="user-regin">
							<i class="fa fa-map-marker"></i>
							${user.user_address_province }
							${user.user_address_city }
						</div>
						<div class="user-settings">
							<i class="fa fa-android"></i>
							<a href="settings.jsp">个人设置</a>
						</div>
					</div>
				</div>
				
				
				<table class="table table-bordered table-striped project-list">
					<tr>
								<td style="width:200px;">项目名称</td>
								<td style="width:75px;">发布日期</td>
								<td style="width:75px;">截止日期</td>
								<td style="width:75px;">目标/进度</td>
								<td style="width:75px;">项目状态</td>
								<td style="width:75px;">操作</td>
							</tr>
						<c:forEach items="${projectlist}" var="project">
							
							
							
							
							
							<tr>
								
								<td>${project.project_title}</td>
								<c:if test="${(project.project_state eq '众筹中')||(project.project_state eq '已完成')||(project.project_state eq '未完成')}">
									<td>${project.project_start}</td>
									<td>${project.project_end}</td>
									<td>${project.project_process}%</td>
								</c:if>
								<c:if test="${(project.project_state eq '草稿')||(project.project_state eq '审核中')||(project.project_state eq '未通过')}">
									<td>----</td>
									<td>----</td>
									<td>----</td>
								</c:if>
								
								
								<td>${project.project_state}</td>
								<td>
									
								<c:if test="${(project.project_state eq '草稿')||(project.project_state eq '未通过')}">
									<a href="GetProjectByIdServlet?project_id=${project.project_id}">预览</a>
									<a href="EditProjectServlet?project_id=${project.project_id}">编辑</a>
									<a href="PostApprovalServlet?project_id=${project.project_id}&user_id=${user.user_id}">提交审核</a>
								</c:if>
								<c:if test="${project.project_state eq '审核中'}">
									<a href="GetProjectByIdServlet?project_id=${project.project_id}">预览</a>
								</c:if>
								<c:if test="${(project.project_state eq '众筹中')||(project.project_state eq '已完成')||(project.project_state eq '未完成')}">
									<a href="GetProjectByIdServlet?project_id=${project.project_id}">查看</a>
								</c:if>
									
								</td>
								
							</tr>
							
							
						</c:forEach>
					</table>
	</div>


</div>
</div>
<%@ include file="script.jsp"%> 
</body>
</html>