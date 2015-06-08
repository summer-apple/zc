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
<style type="text/css">
.content {
	width:1200px;
	height:auto;
	margin-left:auto;
	margin-right:auto;
	margin-top:120px;
}
.address-wrap {
  width: 100%;
  height: auto;
  text-align: left;
  padding-left: 30px;
}
.add-address {
  display: block;
  width: 100px;
  height: 30px;
  background-color: #55acef;
  line-height: 30px;
  color:#FFF;
}
.add-address:hover {
  color:#FFF;
}
.confirm-btn {
    width: 200px;
  height: 35px;
  background-color: #55acef;
  border-radius: 10px;
  color: #FFF; 
  margin-top: 50px;
  margin-bottom: 100px;
  
}
.finish-btn {
  width: 200px;
  height: 35px;
  display:block;
  background-color: #55acef;
  border-radius: 10px;
  color: #FFF; 
  margin-top: 50px;
  margin-bottom: 100px;
  margin-left: auto;
  margin-right: auto;
  line-height: 37px;
}
.finish-btn:hover {
	color:#FFF;
}
</style>
</head>
<body>
<%@ include file="head.jsp"%>  
<div class="main">
<div class="content">
<form action="PaySorderServlet" method="post">


<table class="table  table-bordered table-striped return">
	<tr>
		<td style="width: 75px;">订单ID</td>
		<td style="width: 200px;">商店名称</td>
		<td style="width: 100px;">用户名称</td>
		<td style="width: 75px;">用户真名</td>
		<td style="width: 75px;">消费金额</td> 
		<td style="width: 75px;">订单时间</td> 
		<td style="width: 75px;">订单状态</td>
		
	</tr>
	
	
	
		<tr>
			<td>${sorder.sorder_id}</td>
			<td style=" text-align:left;">${sorder.store_name}</td>
			<td>${sorder.user_name}</td>
			<td>${sorder.user_true_name}</td> 
			<td>￥${sorder.sorder_amount}</td>
			<td>${sorder.sorder_time}</td> 
			<td>${sorder.sorder_state}</td> 
		</tr>

</table>
<br><br>




	<input type="hidden" name="sorder_id" value="${sorder.sorder_id}"/>
	<input type="hidden" name="user_id" value="${user.user_id}"/>
	<c:if test="${sorder.sorder_state=='已支付'}">
		<a class="finish-btn" href="user-center.jsp">完成</a>
	</c:if>
	<c:if test="${sorder.sorder_state!='已支付'}">
		<input class="confirm-btn" type="submit" value="线下支付"/>
	</c:if>
	
</form>
</div>
</div>
<%@ include file="common.jsp"%>  
<%@ include file="script.jsp"%>
<script type="text/javascript">
	$().ready(function(){
		
	});
</script> 
</body>
</html>