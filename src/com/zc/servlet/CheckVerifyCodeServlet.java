package com.zc.servlet;
import java.io.IOException;    
import java.io.PrintWriter;    
   
import javax.servlet.ServletException;    
import javax.servlet.http.HttpServlet;    
import javax.servlet.http.HttpServletRequest;    
import javax.servlet.http.HttpServletResponse;    
   
public class CheckVerifyCodeServlet extends HttpServlet {    
   
    /**   
     * The doGet method of the servlet. <br>   
     *   
     * This method is called when a form has its tag value method equals to get.   
     *    
     * @param request the request send by the client to the server   
     * @param response the response send by the server to the client   
     * @throws ServletException if an error occurred   
     * @throws IOException if an error occurred   
     */   
    public void doGet(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException {    
   
        doPost(request, response);    
    }    
   
    /**   
     * The doPost method of the servlet. <br>   
     *   
     * This method is called when a form has its tag value method equals to post.   
     *    
     * @param request the request send by the client to the server   
     * @param response the response send by the server to the client   
     * @throws ServletException if an error occurred   
     * @throws IOException if an error occurred   
     */   
    public void doPost(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException {    
   
        response.setContentType("text/plain;charset=utf-8");    
        String validateC = (String) request.getSession().getAttribute("validateCode");  
        String veryCode = request.getParameter("veryCode");    
        
        System.out.println(validateC);
        System.out.println(veryCode);
        
        validateC = validateC.toUpperCase();
        veryCode = veryCode.toUpperCase();
        
        PrintWriter out = response.getWriter();    
        if(veryCode==null||"".equals(veryCode)){
        	System.out.println("验证码为空111");
            out.println(false); //验证码为空   
        }else{    
            if(validateC.equals(veryCode)){  
            	System.out.println("验证码正确222");
                out.println(true);  //验证码正确  
            }else{    
            	System.out.println("验证码错误333");
                out.println(false);    //验证码错误
            }    
        }    
        out.flush();    
        out.close();    
    }    
   
} 