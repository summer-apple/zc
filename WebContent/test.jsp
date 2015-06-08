<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
        <script type="text/javascript" src="js/verifyCode.js"></script>   
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	
	$().ready(function(){
	
		
	
		$("#veryCode").blur(function(){ 
			
			var $subflag = $("#subflag");
			
			var $code = $("#veryCode").val();
    		$code = "c=" + $code;  
			$.ajax({    
		        type:"POST",    
		        url:"CheckVerifyCodeServlet",    
		        data:$code,    
		        success:function(data){
		        	if(data=="0"){
		        		$subflag.val("true");
		        	}else{
		        		$subflag.val("false");
		        	}
		        }   
		    });  
			
 		}).keyup(function(){

		   $(this).triggerHandler("blur");

		}).focus(function(){

	  	   $(this).triggerHandler("blur");

		});
 		
 		
 		

 	function login(){
 		
 		
 		
 		if($("#subflag").val()=="true"){  
		      $("#button").submit();
		    }else{  
		        return false;
		    }  
 	} 
 		
 		
	});

</script>  
  </head>
  
  <body>
    <form id="myForm" action="HtmlMailServlet" method="post">
    	<input type="text" name="veryCode" id="veryCode" placeholder="验证码"/>
		<a href="#" onclick="changeImg()"><img id="veryImg" src="VerifyCodeServlet"/></a>
    	<input id="button" type="submit" onclick="return login();" value="sumbit"/>
    </form>
  </body>
</html>
