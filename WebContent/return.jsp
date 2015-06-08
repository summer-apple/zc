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
	margin-top:20px;
}
.big-title {
  width: 100%;
  height: 75px;
  text-align: left;
  font-size: 20px;
  line-height: 95px;
  text-indent: 10px;
  border-bottom: 2px solid #ccc;
  margin-bottom: 30px;
}
.line {
	width:600px;
	height:70px;
	margin-bottom:10px;
	  text-align: left;
	
}
.line-input {
 width: 500px;
  height: 50px !important;
  border-radius: 0 !important;
  line-height: 50px;
  margin-top: 1px;
  border: 1px solid #CBCBCB;
  text-indent: 5px;
 
}
.return-mask {
width: 400px;
  height: auto;
  text-align: left;
  text-indent: -2px;
  margin-top: 60px;
  margin-bottom: 30px;
}
.line-textarea {
  width: 500px;
  height: 75px !important;
  border-radius: 0 !important;
  line-height: 20px;
  margin-top: 1px;
  overflow: hidden;
}
#iframe {
  margin-top: 20px;
  margin-left: 75px;
  width: 200px;
  height: 250px;
}
#image-btn {
  display: block;
  width: 65px;
  height: 25px;
  font-size: 13px;
  color: #FFF;
  background-color: #55acef;
  line-height: 25px;
  float: right;
  margin-right: 262px;
  margin-top: -2px;
  text-indent: 20px;
}
.save-return {
  display: block;
  width: 65px;
  height: 25px;
  font-size: 13px;
  color: #FFF;
  background-color: #55acef;
  line-height: 25px;
}
.save-sub-btn {
width: 200px;
  height: 35px;
  background-color: #55acef;
  border-radius: 10px;
  color: #FFF;
  float: left;
  display: block;
  line-height: 35px;
  margin-left: 60px;
  margin-bottom: 100px;
}
.image-display {
  width: 400px;
  height: 400px;
  margin-top: 20px;
  margin-left: 75px;
}
.image-display img {
	width:100%;
	height:100%;
}
</style> 
</head>
<body>
<%@ include file="head.jsp"%> 


<div class="main">
<div class="content">
<div class="big-title">回报设置</div>

<c:if test="${!empty project.project_return}">

<table class="table  table-bordered table-striped return-list">
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
			<td><img src="${r.return_image}" style="width:75px;"/></td>
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
<div class="line">
支持金额：<input class="line-input" type="number" name="support_money" placeholder="支持金额"/>
</div>

<div class="line">
回报内容：<textarea class="line-input line-textarea" name="return_content" placeholder="回报内容" style="resize:none; overflow: hidden;"></textarea>
</div>
<div class="line return-mask ">
回报图片：
	<a id="image-btn" href="javascript:void(0)">上传</a>
	<div class="upload-image-box" style="display:none;">
		
	</div>
	<div class="image-display"  style="display:none;"></div>
	<input class="image-value return-image" type="hidden" name="return_image"/><br>
	<span id="form-action" style="display:none;">UploadReturnImageServlet</span>
</div>
<div class="line">
人数限制：<input class="line-input" type="number" name="support_limit" value="0" placeholder="0表示不限制"/>
</div>
<div class="line">
运费设置：<input class="line-input" type="number" name="freight" value="0" placeholder="单位：元"/>
</div>
<div class="line">
回报期限：<input class="line-input" type="number" name="return_time" value="0"  placeholder="0表示项目结束后立即进行"/>
</div>
<div class="line">
回报类型：
<select class="line-input" name="return_type" style="background-color: #FFF;">
	<option value="虚拟">虚拟</option>
	<option value="实物">实物</option>
</select>
</div>
<div class="line">
<input class="save-return" type="submit" value="保存">
</div>


	

</form>



<br><br>

<a class="save-sub-btn" href="PostApprovalServlet?project_id=${project.project_id}&user_id=${user.user_id}">提交审核</a>
<a class="save-sub-btn" href="/my-project.jsp">存为草稿</a>










</div>

</div>
<%@ include file="common.jsp"%> 

<%@ include file="script.jsp"%> 
<!-- 验证 -->
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
     <script type="text/javascript" src="js/messages_zh.js"></script>
     <script type="text/javascript">
     	$().ready(function(){

  //弹出上传头像框
  
  	$("#image-btn").click(function(){
  		$(".upload-image-box").html("<iframe id='iframe' name='iframe' src='upload-image.jsp' width='400px' height='400px' frameborder='0' scrolling='no'></iframe>").show();
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