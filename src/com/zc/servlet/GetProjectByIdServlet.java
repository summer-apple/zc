package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.bean.Project;
import com.zc.service.ProjectService;

public class GetProjectByIdServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 
		 ProjectService ps = (ProjectService) wac.getBean("projectService");
		 
		 Project project = ps.getProjectById(project_id);
		
		 request.getSession().setAttribute("project", project);
			 
		 request.getRequestDispatcher("/project.jsp").forward(request, response);
	}

}
