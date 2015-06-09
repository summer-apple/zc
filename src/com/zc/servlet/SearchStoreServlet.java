package com.zc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.bean.Store;
import com.zc.service.JsonService;
import com.zc.service.StoreService;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchStoreServlet")
public class SearchStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStoreServlet() {
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

		String key_word = request.getParameter("key_word");
		
		
		
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		StoreService ss = (StoreService) wac.getBean("storeService");
		JsonService js = (JsonService) wac.getBean("jsonService");
		List<Store> storelist=ss.search(key_word);
		
		
		
		JSONObject obj = new JSONObject();
		if (storelist.size()!=0) {
			obj = js.getJson(storelist);
		}else {
			obj.put("storelist", "");
		}
		
		
		obj.put("keyword", key_word);
		
		System.out.println(obj.toJSONString());
		
		
		
		

		request.getSession().setAttribute("json", obj);
		request.getRequestDispatcher("search-store.jsp").forward(request, response);
	}

}
