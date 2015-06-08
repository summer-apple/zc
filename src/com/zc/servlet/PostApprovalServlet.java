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
import com.zc.service.ProjectService;

public class PostApprovalServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		ProjectService ps = (ProjectService) wac.getBean("projectService");
		Project project = ps.getProjectById(project_id);
		if(project.getProject_state().equals("草稿")){
			ps.postApproval(project_id);
			
			List<Project> projectlist = ps.getProjectByOwner(user_id);
			request.getSession().setAttribute("projectlist", projectlist);
			request.getRequestDispatcher("/my-project.jsp").forward(request, response);
		}else {
			List<Project> projectlist = ps.getProjectByOwner(user_id);
			request.getSession().setAttribute("projectlist", projectlist);
			request.getRequestDispatcher("/my-project.jsp").forward(request, response);
		}
		
	}

}
