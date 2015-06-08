package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


import com.zc.bean.User;
import com.zc.service.UserService;

public class LoginServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("LoginServlet Start");
		String un =  request.getParameter("user_name");
		String up =  request.getParameter("user_pass");
		
		
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService) wac.getBean("userService");
		
		
		User user = us.checkUser(un, up);
		if (user!=null) {
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("message", "登录成功！");
			
			if (user.getUser_type()==0) {
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
			
			
		}else{
			
			int wrongPassCount = 0;
			
			if(request.getSession().getAttribute("wrongPassCount")!=null){
				wrongPassCount = (Integer) request.getSession().getAttribute("wrongPassCount");
				wrongPassCount++;
				request.getSession().setAttribute("wrongPassCount", wrongPassCount);
			}else {
				wrongPassCount++;
				request.getSession().setAttribute("wrongPassCount", wrongPassCount);
			};
			
			request.getSession().setAttribute("message", "用户名或密码错误！");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}
		
	}

}
