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


${result}
<span id="num">3</span>秒后转跳至首页


<%@ include file="script.jsp"%>
<script type="text/javascript"> 
$(document).ready(function() {   
	
    function jump(count) {    
        window.setTimeout(function(){    
            count--;    
            if(count > 0) {    
                $('#num').html(count);    
                jump(count);    
            } else {    
                location.href="index.jsp";    
            }    
        }, 1000);    
    }    
    jump(3);    
});    
</script> 
</body>
</html>