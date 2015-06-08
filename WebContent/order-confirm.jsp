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
</style>
</head>
<body>
<%@ include file="head.jsp"%>  
<div class="main">
<div class="content">
<form action="CreateOrderServlet" method="post">

<%-- project_id:${project.project_id}
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
 --%>



<table class="table  table-bordered table-striped return">
	<tr>
		<td style="width: 300px;">项目名称</td>
		<td style="width: 300px;">回报内容</td>
		<td style="width: 100px;">回报图片</td>
		<td style="width: 75px;">回报期限</td>
		<td style="width: 75px;">回报类型</td> 
		<td style="width: 75px;">支持金额</td>
		<td style="width: 75px;">运费</td> 
		
	</tr>
	
	
	
		<tr>
			<td style=" text-align:left;">${project.project_title}</td>
			<td style=" text-align:left;">${rt.return_content}</td>
			<td><img src="${rt.return_image}" style="width:100px;"/></td>
			<td>${rt.return_time}</td>
			<td>${rt.return_type}</td> 
			<td>￥${rt.support_money}</td>
			<td>${rt.freight}</td> 
		</tr>

</table>
<br><br>



  


<c:if test="${!empty addresslist}">
		
		<div class="address-wrap">
		选择地址：
			<c:forEach items="${addresslist}" var="address">
				<div class="address-item">
				<input type="radio" name="address_id" id="address-radio" value="${address.address_id}">
				
					${address.address_name}&nbsp;&nbsp;
					${address.address_phone}&nbsp;&nbsp;&nbsp;
					${address.address_province}&nbsp;&nbsp;
					${address.address_city}&nbsp;&nbsp;
					${address.address_district}&nbsp;&nbsp;
					${address.address_detial}&nbsp;&nbsp;
				</div>	
			</c:forEach>
		</div>
</c:if>

<c:if test="${empty addresslist}">
	<a class="add-address" href="settings-consignee.jsp">设置送货地址</a>
</c:if>
<br><br>







	<input type="hidden" name="project_id" value="${project.project_id}"/>
	<input type="hidden" name="user_id" value="${user.user_id}"/>
	<input type="hidden" name="return_id" value="${rt.return_id}"/>
	<input class="confirm-btn" type="submit" value="确认支付"/>
</form>
</div>
</div>
<%@ include file="common.jsp"%>  
<%@ include file="script.jsp"%>
<script type="text/javascript">
	$().ready(function(){
		$("#address-radio").first().attr("checked","checked");
	});
</script> 
</body>
</html>