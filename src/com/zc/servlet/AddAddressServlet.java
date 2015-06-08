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

import com.zc.bean.Address;
import com.zc.bean.User;
import com.zc.service.AddressService;
import com.zc.service.UserService;

public class AddAddressServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user  = (User) request.getSession().getAttribute("user");
		int user_id = user.getUser_id();
		String address_name = request.getParameter("address_name");
		String address_phone = request.getParameter("address_phone");
		String address_province = request.getParameter("address_province");
		String address_city = request.getParameter("address_city");
		String address_district = request.getParameter("address_district");
		String address_detial = request.getParameter("address_detial");
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		AddressService as = (AddressService) wac.getBean("addressService");
		
		boolean flag = as.addAddress(user_id, address_name, address_phone, address_province, address_city, address_district, address_detial);
		if (flag==true) {
			List<Address> addresssList = as.getAddressList(user_id);
			request.setAttribute("message", "地址添加成功！");
			request.getSession().setAttribute("addressList", addresssList);
			request.getRequestDispatcher("settings-consignee.jsp").forward(request,response);
			
		}else {
			request.setAttribute("message", "地址添加失败，请重试！");
			request.getRequestDispatcher("settings-consignee.jsp").forward(request,response);
		}
		
		

	}

}
