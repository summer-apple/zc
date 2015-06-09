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
@WebServlet("/RegisterStoreServlet")
public class RegisterStoreServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 User user = (User) request.getSession().getAttribute("user");
		 
		 int store_owner = user.getUser_id();
		
		 String store_name = request.getParameter("store_name");
		 
		 int store_class_id = Integer.parseInt(request.getParameter("store_class_id"));
		 String store_address_province = request.getParameter("store_address_province");
		 String store_address_city = request.getParameter("store_address_city");
		 String store_head = request.getParameter("store_head");
		 String store_description = request.getParameter("store_description");
		 String store_content = request.getParameter("store_content");
		 String store_type = request.getParameter("store_type");
		 String store_phone = request.getParameter("store_phone");
		 String store_alipay = request.getParameter("store_alipay");
		 
		 
		 
		 WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 
		 StoreService ss = (StoreService) wac.getBean("storeService");
		 
		 Store store = ss.registerStore(store_owner, store_name, store_head, store_description, store_content, store_class_id, store_address_province, store_address_city, store_type, store_phone, store_alipay);
		 
		 if (store!=null) {
			 request.getSession().setAttribute("store", store);
			 System.out.println(store.getStore_content());
			 request.getRequestDispatcher("/store.jsp").forward(request, response);
			
		} else {
			System.out.println("failure");
		}
	}

}
