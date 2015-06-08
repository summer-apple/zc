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
import com.zc.bean.User;
import com.zc.service.ProjectService;

public class GetMyProjectServlet extends HttpServlet {
 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 User user = (User)request.getSession().getAttribute("user");
		 int user_id = user.getUser_id();
		 
		 WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 ProjectService ps = (ProjectService) wac.getBean("projectService");
			
			
			
			List<Project> projectlist = ps.getProjectByOwner(user_id);
			request.getSession().setAttribute("projectlist", projectlist);
			request.getRequestDispatcher("/my-project.jsp").forward(request, response);
	}

}
