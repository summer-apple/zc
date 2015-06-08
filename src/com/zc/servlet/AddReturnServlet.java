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

import com.zc.bean.Project;
import com.zc.bean.Return;
import com.zc.service.ReturnService;

public class AddReturnServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Project project = (Project)request.getSession().getAttribute("project");
		int project_id = project.getProject_id();
		int support_money = Integer.parseInt(request.getParameter("support_money"));
		String return_content = request.getParameter("return_content");
		String return_type = request.getParameter("return_type");
		String return_image = request.getParameter("return_image");
		
		int support_limit = Integer.parseInt(request.getParameter("support_limit"));
		int return_time = Integer.parseInt(request.getParameter("return_time"));
		int freight = Integer.parseInt(request.getParameter("freight"));
		
		 
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		
		ReturnService rs = (ReturnService) wac.getBean("returnService");
		
		rs.addReturn(project_id, support_money, return_content, return_image, support_limit, freight, return_time, return_type);
 		
		List<Return> rList = rs.getReturnByProjectId(project_id);		
		project.setProject_return(rList);
		
		request.getSession().setAttribute("project", project);
		  
		request.getRequestDispatcher("/return.jsp").forward(request, response);
	}

}
