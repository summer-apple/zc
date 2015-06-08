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
import com.zc.bean.Project;
import com.zc.bean.Return;
import com.zc.service.AddressService;
import com.zc.service.ProjectService;
import com.zc.service.ReturnService;

public class OrderConfirmServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int return_id = Integer.parseInt(request.getParameter("return_id"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 
		 ProjectService ps = (ProjectService) wac.getBean("projectService");
		 AddressService as = (AddressService) wac.getBean("addressService");
		 ReturnService rs = (ReturnService) wac.getBean("returnService");
		 
		 Project project = ps.getProjectById(project_id);
		 List<Address> addresslist  = as.getAddressList(user_id);
 		 Return rt = rs.getReturnById(return_id);
 		 
 		 
 		 
		 
		 
		 
		 
		 
		 
		 
		 request.getSession().setAttribute("project", project);
		 request.getSession().setAttribute("addresslist", addresslist);
		 request.getSession().setAttribute("rt", rt);
			 
		 request.getRequestDispatcher("/order-confirm.jsp").forward(request, response);
	}

}
