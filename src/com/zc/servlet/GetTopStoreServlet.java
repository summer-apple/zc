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

import com.zc.bean.Store;
import com.zc.bean.Return;
import com.zc.service.JsonService;
import com.zc.service.StoreService;

/**
 * Servlet implementation class GetTopStoreServlet
 */
@WebServlet("/GetTopStoreServlet")
public class GetTopStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTopStoreServlet() {
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
		 
		StoreService ps = (StoreService) wac.getBean("storeService");
		JsonService js = (JsonService) wac.getBean("jsonService");
		
		List<Store> storelist = ps.getTopStore();
	
		JSONObject obj = js.getJson(storelist);
		
		
		//System.out.println(obj.toJSONString());
		//Store store =  storelist.get(2);
		//Return r = store.getStore_return().get(0); 
		
//		
//		Method[] methods = Store.class.getMethods();// 类的方法
//	
//		for (Method method : methods) {
//			String methodName = method.getName();
//			
//			if (methodName.startsWith("get") && !methodName.equals("getClass")) {
//
//				Object value = null;
//				
//				try {
//					value = method.invoke(store);
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
//		for (int i = 0; i < storelist.size(); i++) {
//			Store store = storelist.get(i);
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
//			List<Return> returnlist = store.getStore_return();
//			JSONArray rtlist = new JSONArray();
//			
//			for (int j = 0; j < returnlist.size(); j++) {
//				Return rt = returnlist.get(j);
//				
//				JSONObject rtobj = new JSONObject();
//				
//				rtobj.put("return_id", rt.getReturn_id());
//				rtobj.put("store_id", rt.getStore_id());
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
//			pjobj.put("store_id", store.getStore_id());
//			pjobj.put("store_owner_id", store.getStore_owner_id());
//			pjobj.put("store_owner_name", store.getStore_owner_name());
//			pjobj.put("store_title", store.getStore_title());
//			pjobj.put("store_head", store.getStore_head());
//			pjobj.put("store_description", store.getStore_description());
//			pjobj.put("store_content", store.getStore_content());
//			pjobj.put("store_class", store.getStore_class());
//			pjobj.put("store_address_province", store.getStore_address_province());
//			pjobj.put("store_address_city", store.getStore_address_city());
//			pjobj.put("store_process", store.getStore_process());
//			pjobj.put("store_money", store.getStore_money());
//			pjobj.put("store_money_recive", store.getStore_money_recive());
//			pjobj.put("store_days", store.getStore_days());
//			pjobj.put("store_start", store.getStore_start());
//			pjobj.put("store_end", store.getStore_end());
//			pjobj.put("store_state", store.getStore_state());
//			pjobj.put("store_return", rtlist);
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
