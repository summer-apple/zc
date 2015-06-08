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

public class DeleteAddressServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user  = (User) request.getSession().getAttribute("user");
		int user_id = user.getUser_id();
		int address_id =Integer.parseInt(request.getParameter("address_id"));
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		AddressService as = (AddressService) wac.getBean("addressService");
		
		as.deleteAddress(address_id);
		request.setAttribute("message", "地址已删除！");
		
		List<Address> addresssList = as.getAddressList(user_id);
		request.getSession().setAttribute("addressList", addresssList);
		request.getRequestDispatcher("settings-consignee.jsp").forward(request,response);
		
		
		

	}

}
