package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.bean.Project;
import com.zc.service.JsonService;
import com.zc.service.ProjectService;

/**
 * Servlet implementation class GetSelectProjectServlet
 */
@WebServlet("/GetSelectProjectServlet")
public class GetSelectProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSelectProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String project_class = request.getParameter("project_class");
		String project_state = request.getParameter("project_state");
		String order_by = request.getParameter("order_by");
		
		
		System.out.println(project_class);
		
		
		String l = request.getParameter("limit");
		int limit=0;
		if (l!=null) {
			limit = Integer.parseInt(l);
		}
		
		if (project_class==null && project_class==null && order_by==null) {
			project_class="全部";
			project_state="全部";
			order_by="默认排序";
		}
		
		
		System.out.println(limit);
		

		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		ProjectService ps = (ProjectService) wac.getBean("projectService");
		JsonService js = (JsonService) wac.getBean("jsonService");
		List<Project> projectlist=null;
		try {
			projectlist = ps.getSelectPeoject(project_class, project_state, order_by,limit);
		} catch (NullPointerException e) {
			System.out.println("Asdf");
		}
		
		
		JSONObject obj = new JSONObject();
		if (projectlist.size()!=0) {
			obj = js.getJson(projectlist);
		}else {
			obj.put("projectlist", "");
		}
		
		
		
		int count = ps.getSelectCount(project_class, project_state);
		
		obj.put("count", count);
		System.out.println(obj.toJSONString());
		
		response.setContentType("text/javascript");
	    PrintWriter out = response.getWriter();
	    out.print(obj);
	    out.flush();
	    out.close();
		
		
		
	}

}
