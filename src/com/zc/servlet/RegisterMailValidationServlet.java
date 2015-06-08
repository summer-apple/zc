package com.zc.servlet;
//package com.zc.servlet;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.web.context.WebApplicationContext;
//import org.springframework.web.context.support.WebApplicationContextUtils;
//
//
//
//public class RegisterMailValidationServlet extends HttpServlet {
//
//	
//	public void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		doPost(request, response);
//		
//	}
//
//	
//	public void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		
//		
//		String code1 = request.getParameter("code");
//		String code2 = (String) request.getSession().getAttribute("code");
//		
//		System.out.println(code1);
//		System.out.println(code2);
//		
//		if (code1.equals(code2)) {
//			System.out.println("success");
//		}else {
//			System.out.println("failure");
//		}
//		
//	}
//
//}
