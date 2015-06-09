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

import com.zc.bean.Store;
import com.zc.service.JsonService;
import com.zc.service.StoreService;

/**
 * Servlet implementation class GetIndexStoreByClass
 */
@WebServlet("/GetIndexStoreByClassServlet")
public class GetIndexStoreByClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetIndexStoreByClassServlet() {
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
		 
		
		
		StoreService ps = (StoreService) wac.getBean("storeService");
		JsonService js = (JsonService) wac.getBean("jsonService");
		
		List<Store> l1= ps.getIndexStoreByClass(1);
		List<Store> l2 = ps.getIndexStoreByClass(2);
		List<Store> l3 = ps.getIndexStoreByClass(3);
//		List<Store> l4 = ps.getIndexStoreByClass(4);
//		List<Store> l5 = ps.getIndexStoreByClass(5);
//		List<Store> l6 = ps.getIndexStoreByClass(6);
	
		
		JSONObject obj = new JSONObject();
		
		
		JSONObject obj1 = js.getJson(l1);
		JSONObject obj2 = js.getJson(l2);
		JSONObject obj3 = js.getJson(l3);
//		JSONObject obj4 = js.getJson(l4);
//		JSONObject obj5 = js.getJson(l5);
//		JSONObject obj6 = js.getJson(l6);
		
		
		
		obj.put("l1", obj1);
		obj.put("l2", obj2);
		obj.put("l3", obj3);
//		obj.put("l4", obj4);
//		obj.put("l5", obj5);
//		obj.put("l6", obj6);
		
		response.setContentType("text/javascript");
	    PrintWriter out = response.getWriter();
	    out.print(obj);
	    out.flush();
	    out.close();
	}

}
