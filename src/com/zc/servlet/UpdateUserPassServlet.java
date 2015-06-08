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

public class UpdateUserPassServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService)wac.getBean("userService");
		
		
		User user = (User) request.getSession().getAttribute("user");
		String user_pass = user.getUser_pass();
		int user_id = user.getUser_id();
		String old_pass = request.getParameter("old_pass");
		
		
		old_pass = UserService.getMD5(old_pass);
		
		String new_pass = request.getParameter("new_pass");
		
		if (user_pass.equals(old_pass)) {
			
			us.updateUserPass(user_id, new_pass);
			
			user = us.getUserById(user_id);
			request.getSession().setAttribute("user", user);
			request.setAttribute("message", "密码更新成功！");
			request.getRequestDispatcher("settings-pass.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "原密码有误，请重试！");
			request.getRequestDispatcher("settings-pass.jsp").forward(request, response);
		}
	}

}
