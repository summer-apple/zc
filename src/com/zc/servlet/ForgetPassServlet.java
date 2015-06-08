package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.bean.User;
import com.zc.service.MailService;
import com.zc.service.UserService;

public class ForgetPassServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_email = request.getParameter("user_email");
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		
		UserService us = (UserService) wac.getBean("userService");
		
		User user = us.getUserByEmail(user_email);
		
		if (user==null) {
			request.setAttribute("message", "该邮箱还未注册！<a href='register.jsp'>注册</a>");
			request.getRequestDispatcher("forget.jsp").forward(request, response);
		}else {
			us.forgetPass(user_email);
			request.setAttribute("message", "验证邮件已发送，请前往收件箱查看！");
			request.getRequestDispatcher("result.jsp").forward(request, response);
		}
		
	}

}
