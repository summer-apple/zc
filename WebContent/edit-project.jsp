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
.content {
	width:1200px;
	height:auto;
	margin-left:auto;
	margin-right:auto;
	margin-top:20px;
}
.content-left {
  width: 700px;
  float: left;
}
.line {
	width:600px;
	height:70px;
	margin-bottom:10px;
}
.line-input {
  width: 500px;
  height: 50px !important;
  border-radius: 0 !important;
  line-height: 50px;
  margin-top: 1px;

}
.line-textarea {
  width: 500px;
  height: 100px !important;
  border-radius: 0 !important;
  line-height: 20px;
  margin-top: 1px;
  overflow: hidden;
}
.error {

}
select {
 width: 500px !important;
  height: 50px !important;
  border-radius: 0 !important;
  line-height: 50px;
  margin-top: 1px;
}
.address-city {
	margin-left: 70px;
}
.project-mask {
width: 400px;
  height: auto;
  text-align: left;
  text-indent: 14px;
  margin-top: 60px;
  margin-bottom: 30px;
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
  margin-right: 208px;
  text-indent: 20px;
}
#image-btn:hover {
	text-decoration: none !important;
}
.project-content-wrap {
  width: 815px !important;
  float: left !important;
  margin-left: 35px !important;
}
.hero-unit {
  padding: 30px !important;
}
#editor {
  max-height: 1000px !important;
  height: 450px !important;
}



.content-right {
  width: 375px;
  float: left;
  height: 400px;
  background-color: #EEE;

}
#all-subimt {
    width: 200px;
  height: 35px;
  background-color: #55acef;
  border-radius: 10px;
  color: #FFF;
  margin-left: 485px;
  margin-top: 50px;
  margin-bottom: 100px;
}
.project-view {
  line-height: 45px;
  font-size: 17px;
}
.image-display {
  width: 300px;
  height: 225px;
  margin-left: 37px;
  margin-top: 7px;
  background-color: #DDD;
  font-size: 20px;
  color: #999;
  line-height: 222px;
}
.image-display img {
	width:100%;
	height:100%;
}
.title {
  width: 300px;
  height: auto;
  margin-left: 37px;
  margin-top: 10px;
  font-size: 17px;
  text-align: left;
}
.taget {
  width: 75px;
  height: 30px;
  margin-top: 15px;
  margin-left: 37px;
  float: left;
  color:#666;
}
.line.show-address-box {
  width: 600px;
  height: 20px;
  text-align: left;
  text-indent: 15px;
  margin-top: 17px;
}
</style>
    <!-- 富文本编辑器 -->
    <link href="wysiwyg/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="wysiwyg/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="wysiwyg/css/font-awesome.css" rel="stylesheet">
	
	<!-- 公共 -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    
	
    <!-- 富文本编辑器 -->
	<link href="wysiwyg/css/wysiwyg.css" rel="stylesheet">
	<script src="wysiwyg/js/jquery.hotkeys.js"></script>
    <script src="wysiwyg/js/bootstrap-wysiwyg.js"></script>
    
    
    <!-- 地址 -->
    <script type="text/javascript" src="js/geo.js"></script>
    
    <!-- 验证 -->
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
     <script type="text/javascript" src="js/messages_zh.js"></script>
    
    
</head>
<body onload="setup();promptinfo();">
<%@ include file="head.jsp"%> 
<div class="main">
<div class="content">
<div class="big-title">项目信息</div>
<div class="content-left">
<form class="orgin-form" action="UpdateProjectServlet" method="post">
<input type="hidden" name="project_id" value="${project.project_id}"/>
	<div class="line">
		项目名称：<input class="line-input project-title" type="text" name="project_title" placeholder="项目名称" value="${project.project_id}"/>
	</div>
	<div class="line">筹资金额：<input class="line-input project-money" type="number" name="project_money" placeholder="筹资金额" value="${project.project_money}"/></div>
	<div class="line">募集天数：<input class="line-input project-days" type="number" name="project_days" placeholder="募集天数" value="${project.project_days}"/></div>
	<div class="line">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
		<select class="line-input"  name="project_class">
			<option value="${project.project_class}">${project.project_class}</option>
			<option value="科技">科技</option>
			<option value="公益">公益</option>
			<option value="出版">出版</option>
			<option value="娱乐">娱乐</option>
			<option value="艺术">艺术</option>
			<option value="农业">农业</option>
			<option value="商铺">商铺</option>
			
		</select>
	</div>
	
	
	
	
	
	<div class="line show-address-box">
	项目地点：
		${project.project_address_province}
		${project.project_address_city}
		<a class="change-address-btn" href="javascript:void(0)">修改</a>
		<input type="hidden" name="project_address_province" value="${project.project_address_province}"/>
		<input type="hidden" name="project_address_city" value="${project.project_address_city}"/>
	</div>
	
	
	<div class="line edit-address-box" style="display:none;">项目地点：
		
			<select class="address-province line-input" name="project_address_province" id="s1">
				<option></option>
			</select>
			<select class="address-city line-input" name="project_address_city" id="s2">
				<option></option>
			</select>
		
	</div>
	
	
	<div class="line project-mask">
		项目封面：
		<a id="image-btn" href="javascript:void(0)">编辑</a>
		<div class="upload-image-box" style="display:none;">
			
		</div>
	
		<input class="image-value project-head" type="hidden" name="project_head" placeholder="项目封面"/><br>
		<span id="form-action" style="display:none;">UploadProjectHeadServlet</span>
	</div>
	
	
	
	<%-- 项目封面：
	<a id="image-btn" href="javascript:void(0)">编辑</a>
	<div class="upload-image-box" style="display:none;">
		
	</div>
	<div class="image-display">
		<img src="${project.project_head}"/>
	</div>
	<input class="image-value project-head" type="hidden" name="project_head" placeholder="项目封面" value="${project.project_head}"/><br>
	<span id="form-action" style="display:none;">UploadProjectHeadServlet</span> --%>
	
	
	
	<div class="line" style="  text-indent: 0px;">
		项目简介：
		<textarea class="line-textarea" name="project_description" placeholder="项目简介" style="resize:none;">
			${project.project_description}
		</textarea>
	</div>
	
 
	
	<div class="line" style="  text-indent: -500px;  margin-bottom: -35px; margin-top: 60px;">
		项目详情：
		<input class="project-content" type="hidden" name="project_content" value="${project_project_content}"/>
	</div>
	
	
<div class="container project-content-wrap">
	<div class="hero-unit">
	<div id="alerts"></div>
    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
          <ul class="dropdown-menu">
          </ul>
        
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
          <ul class="dropdown-menu">
          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
          </ul>
       
        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
       
        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
       
        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
       
		  <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
		    <div class="dropdown-menu input-append">
			    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
			    <button class="btn" type="button">Add</button>
        	</div>
          <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>
		<a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
        
         <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
      </div>
      
    </div>

    <div id="editor">${project.project_content}</div>
    </div>
</div>


<input id="all-subimt" type="submit" value="下一步"/> 			    
				    
</form>
</div>

<div class="content-right">
	<span class="project-view">项目预览</span>
	<div class="image-display"><img src="${project.project_head}"/></div>
	<div class="title">${project.project_title}</div>
	<div class="taget days">目标：${project.project_days}天</div>
	<div class="taget money">￥${project.project_money}</div>
</div>
</div>
</div>


<script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
    initToolbarBootstrapBindings();  
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
    window.prettyPrint && prettyPrint();
  });
  
  
  $().ready(function(){
  
  
  //富文本编辑器内容赋值给表单项
  	$("#all-subimt").click(function(){
  		$(".project-content").val($("#editor").html());
  		//alert($(".project-content").val());
  	});
  	
  //弹出地址选择框
  
  $(".change-address-btn").click(function(){
  	$(".show-address-box").html("").hide();
  	$(".edit-address-box").show();
  });
  
  //弹出上传头像框
  
  	$("#image-btn").click(function(){
  		$(".upload-image-box").html("<iframe id='iframe' name='iframe' src='upload-image.jsp' width='400px' height='600px' frameborder='0' scrolling='no'></iframe>").show();
  		//$(".frame-from",document.frames('iframe').document).attr("action","aa");
  	});	
  	
 //表单验证
 
 	$(".orgin-form").validate({
 		rules:{
						project_title:{
								required:true,
								maxlength:40/* ,
								remote:{
									        url: "CheckProjectTitleNameServlet",
									        type: "post",
									        contentType: "application/x-www-form-urlencoded; charset=utf-8"
								} */
							},
						project_money:{
								required:true,
								digits:true,
								min:500,
								max:10000000
							},
						project_days:{
								required:true,
								digits:true,
								min:10,
								max:90
							},
						project_head:{
								required:true
						},
						project_description:{
								required:true
						}
							
					},
			messages:{
				project_title:{
								
								maxlength:"最多输入40个汉字！",
								remote:"该项目已存在！"
							},
						project_money:{
								
								digits:"请输入整数！",
								min:"金额至少为500元人命币！",
								max:"金额至多为10000000元人命币！"
							},
						project_days:{
								digits:"请输入整数！",
								min:"众筹期限最少为10天！",
								max:"众筹期限最多为90天！"
							}
			}
					
 	});
 	 	
  	
  	
  });
</script>
</body>
</html>