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
import com.zc.service.ProjectService;
import com.zc.service.ReturnService;

public class DeleteReturnServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int return_id = Integer.parseInt(request.getParameter("return_id"));
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		
		ReturnService rs = (ReturnService) wac.getBean("returnService");
		
		rs.deleteReturn(return_id);
		
		ProjectService ps = (ProjectService) wac.getBean("projectService");
		 
		Project project = ps.getProjectById(project_id);
		
		
		request.getSession().setAttribute("project", project);
		request.getRequestDispatcher("/return.jsp").forward(request, response);
		
	}

}
