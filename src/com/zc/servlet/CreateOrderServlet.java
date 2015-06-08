package com.zc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.service.OrderService;
import com.zc.service.ProjectService;

/**
 * Servlet implementation class CreateOrderServlet
 */
@WebServlet("/CreateOrderServlet")
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateOrderServlet() {
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
		

		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int return_id = Integer.parseInt(request.getParameter("return_id"));
		int address_id = Integer.parseInt(request.getParameter("address_id"));
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		OrderService os = (OrderService) wac.getBean("orderService");
		
		boolean flag = os.createOrder(user_id, project_id, return_id, address_id);
		
		if (flag) {
			System.out.println("订单生成成功");
		}else {
			System.out.println("订单出错，同一项目不允许重复下单");
		}
		
	}

}
