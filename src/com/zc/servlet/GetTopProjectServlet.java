package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import com.zc.bean.Project;
import com.zc.bean.Return;
import com.zc.service.JsonService;
import com.zc.service.ProjectService;

/**
 * Servlet implementation class GetTopProjectServlet
 */
@WebServlet("/GetTopProjectServlet")
public class GetTopProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTopProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
	
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		 
		ProjectService ps = (ProjectService) wac.getBean("projectService");
		JsonService js = (JsonService) wac.getBean("jsonService");
		
		List<Project> projectlist = ps.getTopProject();
	
		JSONObject obj = js.getJson(projectlist);
		
		
		//System.out.println(obj.toJSONString());
		//Project project =  projectlist.get(2);
		//Return r = project.getProject_return().get(0); 
		
//		
//		Method[] methods = Project.class.getMethods();// 类的方法
//	
//		for (Method method : methods) {
//			String methodName = method.getName();
//			
//			if (methodName.startsWith("get") && !methodName.equals("getClass")) {
//
//				Object value = null;
//				
//				try {
//					value = method.invoke(project);
//					String s = value.getClass().toString();
//					if (s.endsWith("ArrayList")) {
//						
//					}else if (s.endsWith("ArrayList")) {
//						
//					}
//				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
//					e.printStackTrace();
//				}
//				System.out.println(methodName.substring(3).toLowerCase());
//				System.out.println(value+"###"+value.getClass());
//			}
//		}
//	
//		
		
		
		
		
		
		
//		
//		
//		
//		JSONObject obj = new JSONObject();
//		
//		JSONArray pjlist = new JSONArray();
//		
//		
//		for (int i = 0; i < projectlist.size(); i++) {
//			Project project = projectlist.get(i);
//
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			JSONObject pjobj = new JSONObject();
//			
//			List<Return> returnlist = project.getProject_return();
//			JSONArray rtlist = new JSONArray();
//			
//			for (int j = 0; j < returnlist.size(); j++) {
//				Return rt = returnlist.get(j);
//				
//				JSONObject rtobj = new JSONObject();
//				
//				rtobj.put("return_id", rt.getReturn_id());
//				rtobj.put("project_id", rt.getProject_id());
//				rtobj.put("support_money", rt.getSupport_money());
//				rtobj.put("return_content", rt.getReturn_content());
//				rtobj.put("return_image", rt.getReturn_image());
//				rtobj.put("support_limit", rt.getSupport_limit());
//				rtobj.put("freight", rt.getFreight());
//				rtobj.put("return_time", rt.getReturn_time());
//				rtobj.put("return_type", rt.getReturn_type());
//				
//				rtlist.add(rtobj);
//			}
//			
//			pjobj.put("project_id", project.getProject_id());
//			pjobj.put("project_owner_id", project.getProject_owner_id());
//			pjobj.put("project_owner_name", project.getProject_owner_name());
//			pjobj.put("project_title", project.getProject_title());
//			pjobj.put("project_head", project.getProject_head());
//			pjobj.put("project_description", project.getProject_description());
//			pjobj.put("project_content", project.getProject_content());
//			pjobj.put("project_class", project.getProject_class());
//			pjobj.put("project_address_province", project.getProject_address_province());
//			pjobj.put("project_address_city", project.getProject_address_city());
//			pjobj.put("project_process", project.getProject_process());
//			pjobj.put("project_money", project.getProject_money());
//			pjobj.put("project_money_recive", project.getProject_money_recive());
//			pjobj.put("project_days", project.getProject_days());
//			pjobj.put("project_start", project.getProject_start());
//			pjobj.put("project_end", project.getProject_end());
//			pjobj.put("project_state", project.getProject_state());
//			pjobj.put("project_return", rtlist);
//			
//			pjlist.add(pjobj);
//			
//		}
//		
//		
//		obj.put("pjlist", pjlist);
//		
//		
//		
//		

//		
//		  
//		  
//		  
//		
//		
//		
//		
//		
//		
//		
	    response.setContentType("text/javascript");
	    PrintWriter out = response.getWriter();
	    out.print(obj);
	    out.flush();
	    out.close();
	    
	}

}
