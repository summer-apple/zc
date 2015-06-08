package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.bean.User;
import com.zc.service.UserService;

public class RegisterActivationServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String user_code = request.getParameter("user_code");
		
		String user_name = new String(request.getParameter("user_name").getBytes("iso8859-1"), "utf-8");
		System.out.println("RegisterActivationServlet user_name:"+user_name);
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService) wac.getBean("userService");
		
		
		
		us.registerActivation(user_name,user_code);
		
		User user = us.getUserByName(user_name);
		if (user.getUser_type()!=0) {
			System.out.println(user.getUser_type());
			response.getWriter().print("激活成功！");
		}else {
			response.getWriter().print("激活失败！");
		}
		
 	}

}
