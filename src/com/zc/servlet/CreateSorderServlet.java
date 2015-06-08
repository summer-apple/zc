package com.zc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zc.bean.Sorder;
import com.zc.service.SorderService;



@WebServlet("/CreateSorderServlet")
public class CreateSorderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int store_id = Integer.parseInt(request.getParameter("store_id"));
		int sorder_amount = Integer.parseInt(request.getParameter("sorder_amount"));
		
		
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		SorderService os = (SorderService) wac.getBean("sorderService");
		
		Sorder sorder = os.createSorder(user_id, store_id, sorder_amount);
		
		if (sorder!=null) {
			System.out.println("订单生成成功");
		}else {
			System.out.println("订单出错");
		}
		
	}

}
