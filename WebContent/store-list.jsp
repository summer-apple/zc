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
					<td>商店头像</td>
					<td>商店ID</td>
					<td>商店名</td>
					<td>省份</td>
					<td>城市</td>
					<td>店主ID</td>
					<td>店主姓名</td>
					<td>商店电话</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${storelist}" var="s">
					<tr>
						<td><img src="${s.store_head}" width="75px"></td>
						<td class="store-id">${s.store_id}</td>
						<td>${s.store_name}</td>
						<td>${s.store_address_province}</td>
						<td>${s.store_address_city}</td>
						<td>${s.store_owner_id}</td>
						<td>${s.store_owner_name}</td>
						<td>${s.store_phone}</td>
						<td><a class="delete-store-btn store-btn" href="javasctipt:void(0);">删除</a></td>
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
	
	$(".delete-store-btn").click(function(){
		$store_id = $(this).parents("tr").find(".store-id").html();
		$(this).parents("tr").remove();
		$.ajax({
			url:"DeleteStoreServlet?store_id="+$store_id,
			type:"POST"/* ,
			success:function(data){
				$store_id.parent("tr").remove();
			} */
		});
	});
	
	/* $(".chang-store-type-btn").click(function(){
		$store_id = $(this).parents("tr").find(".store-id").html();
		if($(this).html()=="锁定用户"){
			$(this).html("解锁用户");
			$(this).parents("tr").find(".store-type").html("锁定用户");
			$.ajax({
				url:"ChangeStoreTypeServlet?store_id="+$store_id+"&store_type=9",
				type:"POST"
			});
		}else{
			$(this).html("锁定用户");
			$(this).parents("tr").find(".store-type").html("普通用户");
			$.ajax({
				url:"ChangeStoreTypeServlet?store_id="+$store_id+"&store_type=1",
				type:"POST"
			});
		}
		
		
	}); */
	
	
	
	
	
	
	
	
	
});










</script>
</body>
</html>