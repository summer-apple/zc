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
</head>
<body>

<c:if test="${!empty returnlist }">
<table class="return-list">
	<c:forEach items="${returnlist}" var="r">
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
			<td><a href="DeleteReturnServlet?return_id=${r.return_id}&project_id=${r.project_id}">删除</a></td>
		</tr>
	</c:forEach>
</table>
</c:if>


<form class="return-from" action="AddReturnServlet" method="post">
<input type="hidden" name="project_id" value="${project.project_id}"/>
支持金额：
<input class="" type="number" name="support_money" placeholder="支持金额"/><br>
回报内容：
<textarea class="" name="return_content" placeholder="回报内容" style="resize:none;"></textarea><br>
回报图片：
<a id="image-btn" href="javascript:void(0)">上传</a>
	<div class="upload-image-box" style="display:none;">
		
	</div>
	<div class="image-display"  style="display:none;"></div>
	<input class="image-value return-image" type="hidden" name="return_image"/><br>
	<span id="form-action" style="display:none;">UploadReturnImageServlet</span>
人数限制：
<input class="" type="number" name="support_limit" value="0"/>0表示不限制<br>
运费设置：
<input class="" type="number" name="freight" value="0"/>元<br>
回报期限：
<input class="" type="number" name="return_time" value="0"/>0表示项目结束后立即进行<br>
回报类型：
<select class="" name="return_type">
	<option value="虚拟">虚拟</option>
	<option value="实物">实物</option>
</select><br>

<input type="submit" value="保存">
</form>



<br><br>

<a href="PostApprovalServlet?project_id=${project.project_id}&user_id=${user.user_id}">提交审核</a>
<a href="/my-project.jsp">存为草稿</a>















<%@ include file="script.jsp"%> 
<!-- 验证 -->
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
     <script type="text/javascript" src="js/messages_zh.js"></script>
     <script type="text/javascript">
     	$().ready(function(){

  //弹出上传头像框
  
  	$("#image-btn").click(function(){
  		$(".upload-image-box").html("<iframe id='iframe' name='iframe' src='upload-image.jsp' width='400px' height='600px' frameborder='0' scrolling='no'></iframe>").show();
  		//$(".frame-from",document.frames('iframe').document).attr("action","aa");
  	});	
  	
 //表单验证
 
 	$(".return-from").validate({
 		rules:{
						support_money:{
								required:true,
								digits:true,
								min:1
							},
						return_content:{
								required:true,
								maxlength:500
							},
						support_limit:{
								required:true,
								digits:true,
								min:0
							},
						freight:{
								required:true,
								digits:true,
								min:0
						},
						return_time:{
								required:true,
								digits:true,
								min:0
						}
				}
						
						});
 	 	
     	});
     </script>
</body>
</html>