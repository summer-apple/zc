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
<style>
.container {
	margin-top:100px;
	min-height:500px;
}
</style>
</head>
<body>

<%@ include file="head.jsp" %>

<div class="container">

	<div class="row">
		<div class="col-12">
			<table class="table table-bordered">
				<tr>
					<td>用户ID</td>
					<td>用户名</td>
					<td>真实姓名</td>
					<td>省份</td>
					<td>城市</td>
					<td>用户类型</td>
					<td>用户等级</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${userlist}" var="u">
					<tr>
						<td class="user-id">${u.user_id}</td>
						<td>${u.user_name}</td>
						<td>${u.user_true_name}</td>
						<td>${u.user_address_province}</td>
						<td>${u.user_address_city}</td>
						<td class="user-type">
						<c:if test="${u.user_type==0}">管理员</c:if>
						<c:if test="${u.user_type==1}">普通用户</c:if>
						<c:if test="${u.user_type==9}">锁定用户</c:if>
						
						</td>
						<td>${u.user_rank}</td> 
						<td>	
								<c:if test="${u.user_type==0}">不可修改</c:if>
								<c:if test="${u.user_type!=0}">
									<a class="delete-user-btn user-btn" href="javasctipt:void(0);">删除</a>
									<c:if test="${u.user_type==1 }"><a class="chang-user-type-btn user-btn" href="javasctipt:void(0);">锁定用户</a></c:if>
									<c:if test="${u.user_type==9 }"><a class="chang-user-type-btn user-btn" href="javasctipt:void(0);">解锁用户</a></c:if>
								</c:if>
						</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
	</div>


</div>

<%@ include file="common.jsp"%> 
<%@ include file="script.jsp"%> 
<script>

$().ready(function(){
	
	$(".delete-user-btn").click(function(){
		$user_id = $(this).parents("tr").find(".user-id").html();
		$(this).parents("tr").remove();
		$.ajax({
			url:"DeleteUserServlet?user_id="+$user_id,
			type:"POST"/* ,
			success:function(data){
				$user_id.parent("tr").remove();
			} */
		});
	});
	
	$(".chang-user-type-btn").click(function(){
		$user_id = $(this).parents("tr").find(".user-id").html();
		if($(this).html()=="锁定用户"){
			$(this).html("解锁用户");
			$(this).parents("tr").find(".user-type").html("锁定用户");
			$.ajax({
				url:"ChangeUserTypeServlet?user_id="+$user_id+"&user_type=9",
				type:"POST"
			});
		}else{
			$(this).html("锁定用户");
			$(this).parents("tr").find(".user-type").html("普通用户");
			$.ajax({
				url:"ChangeUserTypeServlet?user_id="+$user_id+"&user_type=1",
				type:"POST"
			});
		}
		
		
	});
	
	
	
	
	
	
	
	
	
});










</script>
</body>
</html>