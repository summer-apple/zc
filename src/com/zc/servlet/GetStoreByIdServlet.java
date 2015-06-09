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
import com.zc.service.StoreService;
@WebServlet("/GetStoreByIdServlet")
public class GetStoreByIdServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int store_id = Integer.parseInt(request.getParameter("store_id"));
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 
		 StoreService ps = (StoreService) wac.getBean("storeService");
		 
		 Store store = ps.getStoreById(store_id);
		
		 request.getSession().setAttribute("store", store);
			 
		 request.getRequestDispatcher("/store.jsp").forward(request, response);
	}

}
