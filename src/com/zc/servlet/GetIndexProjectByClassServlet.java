package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.bean.Project;
import com.zc.service.JsonService;
import com.zc.service.ProjectService;

/**
 * Servlet implementation class GetIndexProjectByClass
 */
@WebServlet("/GetIndexProjectByClass")
public class GetIndexProjectByClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetIndexProjectByClassServlet() {
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
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 
		
		
		ProjectService ps = (ProjectService) wac.getBean("projectService");
		JsonService js = (JsonService) wac.getBean("jsonService");
		
		List<Project> kejilist = ps.getIndexProjectByClass("科技");
		List<Project> gongyilist = ps.getIndexProjectByClass("公益");
		List<Project> chubanlist = ps.getIndexProjectByClass("出版");
		List<Project> yulelist = ps.getIndexProjectByClass("娱乐");
		List<Project> yishulist = ps.getIndexProjectByClass("艺术");
		List<Project> nongyelist = ps.getIndexProjectByClass("农业");
	
		
		JSONObject obj = new JSONObject();
		
		
		JSONObject obj1 = js.getJson(kejilist);
		JSONObject obj2 = js.getJson(gongyilist);
		JSONObject obj3 = js.getJson(chubanlist);
		JSONObject obj4 = js.getJson(yulelist);
		JSONObject obj5 = js.getJson(yishulist);
		JSONObject obj6 = js.getJson(nongyelist);
		
		
		
		obj.put("keji", obj1);
		obj.put("gongyi", obj2);
		obj.put("chuban", obj3);
		obj.put("yule", obj4);
		obj.put("yishu", obj5);
		obj.put("nongye", obj6);
		
		response.setContentType("text/javascript");
	    PrintWriter out = response.getWriter();
	    out.print(obj);
	    out.flush();
	    out.close();
	}

}
