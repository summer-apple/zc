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

public class ResetPassServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService)wac.getBean("userService");
		
		User user = (User) request.getSession().getAttribute("user");

		int user_id = user.getUser_id();
		String new_pass = request.getParameter("new_pass");
		
		us.updateUserPass(user_id, new_pass);
		
		user = us.getUserById(user_id);
		
		request.getSession().setAttribute("user", user);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}

}
