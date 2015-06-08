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

public class CheckUserEmailServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckUserEmailServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String ue =  request.getParameter("user_email");
		System.out.println(ue);
		WebApplicationContext wus = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		UserService us = (UserService) wus.getBean("userService");
		
		if (us.checkUserEmail(ue)) {
			System.out.println("111111111111");
			response.getWriter().print("false");//user email is exist
		}else{
			System.out.println("2222222222222");
			response.getWriter().print("true");//user email is available
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
