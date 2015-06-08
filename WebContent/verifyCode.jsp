<%@ page language="java" contentType="text/html; charset=UTF-8"   
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
<html>   
    <head>   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <script type="text/javascript" src="js/verifyCode.js"></script>   
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>   
        <title>test verify code</title>   
    </head>   
    <body>   
        <input id="veryCode" name="veryCode" type="text"/>   
        <a href="#" onclick="changeImg()"><img id="imgObj" alt="" src="VerifyCodeServlet"/></a> 
        <input type="button" value="验证" onclick="isRightCode()"/>   
        <div id="info"></div>   
    </body>   
</html>