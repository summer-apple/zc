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

public class UpdateUserInfoServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = (User)request.getSession().getAttribute("user");

		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService)wac.getBean("userService");

			int user_id = user.getUser_id();
			String user_true_name = request.getParameter("user_true_name");
			String user_sex = request.getParameter("user_sex");
			String user_phone = request.getParameter("user_phone");
			String user_address_province = request.getParameter("user_address_province");
			String user_address_city = request.getParameter("user_address_city");
			us.updateUserInfo(user_id, user_true_name, user_sex, user_phone, user_address_province, user_address_city);
			
			
			user = us.getUserById(user_id);
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("settings.jsp").forward(request, response);
	}

}
