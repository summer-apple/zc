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

public class ForgetPassActivationServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String user_code = request.getParameter("user_code");
		String user_email = request.getParameter("user_email");
		
		System.out.println(user_code);
		System.out.println(user_email);
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService) wac.getBean("userService");
		
		
		
		
		
		User user = us.getUserByEmail(user_email);
		
		
		
		if (user.getUser_code().equals(user_code)) {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("reset-pass.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("message", "验证邮件已过期，请重新申请！");
			request.getRequestDispatcher("forget.jsp").forward(request, response);
		}
		
 	}

}
