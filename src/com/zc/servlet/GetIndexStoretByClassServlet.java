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
@WebServlet("/GetIndexStoreByClass")
public class GetIndexStoretByClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetIndexStoretByClassServlet() {
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
		 
		
		
		StoreService ps = (StoreService) wac.getBean("StoreService");
		JsonService js = (JsonService) wac.getBean("jsonService");
		
		List<Store> kejilist = ps.getIndexStoreByClass("科技");
		List<Store> gongyilist = ps.getIndexStoreByClass("公益");
		List<Store> chubanlist = ps.getIndexStoreByClass("出版");
		List<Store> yulelist = ps.getIndexStoreByClass("娱乐");
		List<Store> yishulist = ps.getIndexStoreByClass("艺术");
		List<Store> nongyelist = ps.getIndexStoreByClass("农业");
	
		
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
