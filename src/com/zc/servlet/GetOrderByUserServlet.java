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

import com.zc.bean.Order;
import com.zc.bean.Project;
import com.zc.bean.User;
import com.zc.service.JsonService;
import com.zc.service.OrderService;
import com.zc.service.ProjectService;

/**
 * Servlet implementation class GetOrderByUserServlet
 */
@WebServlet("/GetOrderByUserServlet")
public class GetOrderByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOrderByUserServlet() {
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
		
		User user = (User) request.getSession().getAttribute("user");
		int user_id = user.getUser_id();
		
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		OrderService os = (OrderService) wac.getBean("orderService");
		JsonService js = (JsonService) wac.getBean("jsonService");
		
		List<Order> orderlist = null;
		
		try {
			orderlist = os.getOrderByUser(user_id);
		} catch (NullPointerException e) {
			System.out.println("Asdf");
		}
		
		
		JSONObject obj = new JSONObject();
		if (orderlist.size()!=0) {
			obj = js.getJson(orderlist);
		}else {
			obj.put("orderlist", "");
		}
		
		
		
		//int count = ps.getSelectCount(project_class, project_state);
		
		//obj.put("count", count);
		System.out.println(obj.toJSONString());
		
		response.setContentType("text/javascript");
	    PrintWriter out = response.getWriter();
	    out.print(obj);
	    out.flush();
	    out.close();
	}

}
