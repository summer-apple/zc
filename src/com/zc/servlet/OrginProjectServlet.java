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
import com.zc.bean.User;
import com.zc.service.ProjectService;
import com.zc.service.UserService;

public class OrginProjectServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 User user = (User) request.getSession().getAttribute("user");
		 
		 int project_owner = user.getUser_id();
		
		 String project_title = request.getParameter("project_title");
		 int project_money = Integer.parseInt(request.getParameter("project_money"));
		 int project_days = Integer.parseInt(request.getParameter("project_days"));
		 String project_class = request.getParameter("project_class");
		 String project_address_province = request.getParameter("project_address_province");
		 String project_address_city = request.getParameter("project_address_city");
		 String project_head = request.getParameter("project_head");
		 String project_description = request.getParameter("project_description");
		 String project_content = request.getParameter("project_content");
		 
		 
		 
		 WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 
		 ProjectService ps = (ProjectService) wac.getBean("projectService");
		 
		 Project project = ps.orginProject(project_owner, project_title, project_head, project_description, project_content, project_class, project_address_province, project_address_city, project_days, project_money);
		 
		 if (project!=null) {
			 request.getSession().setAttribute("project", project);
			 System.out.println(project.getProject_content());
			 request.getRequestDispatcher("/return.jsp").forward(request, response);
			
		} else {
			System.out.println("failure");
		}
	}

}
