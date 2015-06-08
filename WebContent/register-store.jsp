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
.store-mask {
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
.store-content-wrap {
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
  background-color: #DDD;

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
.store-view {
  line-height: 45px;
  font-size: 17px;
}
.image-display {
  width: 300px;
  height: 225px;
  margin-left: 37px;
  margin-top: 7px;
  background-color: #ccc;
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
<div class="big-title">商店信息</div>
<div class="content-left">
<form class="orgin-form" action="RegisterStoreServlet" method="post">

	<div class="line">
		商店名称：<input class="line-input store-title" type="text" name="store_name" placeholder="商店名称"/>
	</div>
	
	<div class="line">
		商店电话：<input class="line-input store-phone" type="number" name="store_phone" placeholder="商店电话"/>
	</div>
	
	<div class="line">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
		<select class="line-input"  name="store-class">
			<option value="科技">科技</option>
			<option value="公益">公益</option>
			<option value="出版">出版</option>
			<option value="娱乐">娱乐</option>
			<option value="艺术">艺术</option>
			<option value="农业">农业</option>
			<option value="商铺">商铺</option>
			
		</select>
	</div>
	<div class="line">商店地点：
		
			<select class="address-province line-input" name="store_address_province" id="s1">
				<option></option>
			</select>
			<select class="address-city line-input" name="store_address_city" id="s2">
				<option></option>
			</select>
		
	</div>
	<div class="line store-mask">
		商店照片：
		<a id="image-btn" href="javascript:void(0)">上传</a>
		<div class="upload-image-box" style="display:none;">
			
		</div>
		
		<input class="image-value store-head" type="hidden" name="store_head" placeholder="商店照片"/><br>
		<span id="form-action" style="display:none;">UploadStoreHeadServlet</span>
	</div>
	
	
	<div class="line" style="  text-indent: 0px;">
		商店简介：
		<textarea class="line-textarea" name="store_description" placeholder="商店简介" style="resize:none;"></textarea>
	</div>
	
	
	
<div class="line" style="  text-indent: -500px;  margin-bottom: -35px; margin-top: 60px;">
	商店详情：
	<input class="store-content" type="hidden" name="store_content" value=""/>
</div>
	
	
	
<div class="container store-content-wrap">
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

    <div id="editor">
      <h2>关于我（也可使用个性化小标题）</h2>
								<p>向支持者介绍你自己或你的团队，并详细说明你与所发起的商店之间的背景，让支持者能够在最短时间内了解你，以拉近彼此之间的距离。</p>
								<h2>我想要做什么（也可使用个性化小标题）</h2>
								<p>这是商店介绍中最关键的部分，建议上传5张以上高清图片（宽700、高不限），配合文字来简洁生动地说明你的商店，让支持者对你要做的事情一目了然并充满兴趣。</p>
								<h2>为什么我需要你的支持及资金用途（也可使用个性化小标题）</h2>
								<p>请在这一部分说明你的商店不同寻常的特色，为什么需要大家的支持以及详细的资金用途，这会增加你商店的可信度并由此提高筹资的成功率。</p>
								<h2>可能存在的风险（也可使用个性化小标题）</h2>
								<p>请在此标注你的商店在实施过程中可能存在的风险，让支持者对你的商店有全面而清晰的认识。</p>
    </div>
    </div>
</div>


<input id="all-subimt" type="submit" value="下一步"/> 			    
				    
</form>
</div>

<div class="content-right">
	<span class="store-view">商店预览</span>
	<div class="image-display">商店封面</div>
	<div class="title">店名：</div>

</div>
</div>
</div>
<%@ include file="common.jsp"%> 
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
  		$(".store-content").val($("#editor").html());
  		//alert($(".store-content").val());
  	});
  	
  //弹出上传头像框
  
  	$("#image-btn").click(function(){
  		$(".upload-image-box").html("<iframe id='iframe' name='iframe' src='upload-image.jsp' width='200px' height='250px' frameborder='0' scrolling='no'></iframe>").show();
  		//$(".frame-from",document.frames('iframe').document).attr("action","aa");
  	});	
  	
 //表单验证
 
 	$(".orgin-form").validate({
 		rules:{
						store_name:{
								required:true,
								maxlength:20,
								remote:{
									        url: "CheckStoreNameServlet",
									        type: "post",
									        contentType: "application/x-www-form-urlencoded; charset=utf-8"
								}
							},
						store_days:{
								required:true,
								digits:true,
								min:10,
								max:90
							},
						store_head:{
								required:true
						},
						store_description:{
								required:true,
								maxlength:100
						
						},
						store_phone:{
							require:true,
							maxlength:11,
							minlength:11
						}
							
					},
			messages:{
				store_title:{
								
								maxlength:"最多输入20个汉字！",
								remote:"该商店已存在！"
							},
				store_phone:{
								minlength:"请输入11位手机号",
								maxlength:"请输入11位手机号",
				}	
						
			}
					
 	});
 	 	
  	//预览

  	$(".store-title").blur(function(){
			$(".title").html("店名："+$(this).val());
  	  	});
  });
</script>
</body>
</html>