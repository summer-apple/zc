package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
import com.zc.service.UserService;
@WebServlet("/GetStoreByOwnerServlet")
public class GetStoreByOwnerServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 
		 
		
		 int store_owner = Integer.parseInt(request.getParameter("store_owner"));
		 
		 
		 
		 
		 WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 
		 StoreService ss = (StoreService) wac.getBean("storeService");
		 Store store = ss.getStoreByOwner(store_owner);
		 
		 request.getSession().setAttribute("store", store);
		 request.getRequestDispatcher("/store.jsp").forward(request, response);
		
	}

}
