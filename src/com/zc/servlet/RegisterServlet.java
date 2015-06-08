package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.service.UserService;

public class RegisterServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		String user_pass = request.getParameter("user_pass");
		
		
		System.out.println("RegisterServlet user_name:"+user_name);
		System.out.println("RegisterServlet user_email:"+user_email);
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService) wac.getBean("userService");
		
		
		boolean registerFlag = us.register(user_name, user_pass, user_email);
		
		
		String registerMessage="";
		if (registerFlag) {
			registerMessage="注册成功，请登录邮箱激活账号！";
		}else {
			registerMessage="注册成功，请登录邮箱激活账号！";
		}
		
		request.getSession().setAttribute("result", registerMessage);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
