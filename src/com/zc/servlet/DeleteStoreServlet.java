package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.bean.Store;
import com.zc.bean.User;
import com.zc.service.StoreService;

@WebServlet("/DeleteStoreServlet")

public class DeleteStoreServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteStoreServlet() {
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
		
		request.setCharacterEncoding("utf-8");
		User u = (User) request.getSession().getAttribute("user");
		if (u.getUser_type()==0) {
			
			int store_id = Integer.parseInt(request.getParameter("store_id"));
			
			
			WebApplicationContext wac = WebApplicationContextUtils
		            .getRequiredWebApplicationContext(getServletContext());
			
			StoreService us = (StoreService) wac.getBean("storeService");
			
			
			us.deleteStore(store_id);
			
			
		}else {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
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
