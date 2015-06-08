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
import com.zc.bean.User;
import com.zc.service.SorderService;



@WebServlet("/PaySorderServlet")
public class PaySorderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int sorder_id = Integer.parseInt(request.getParameter("sorder_id"));
		
		User user = (User) request.getSession().getAttribute("user");
		
		if (user.getUser_id()==user_id) {
			WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
			SorderService os = (SorderService) wac.getBean("sorderService");
			
			Sorder sorder = os.paySorder(sorder_id);
			request.getSession().setAttribute("sorder", sorder);
			request.getRequestDispatcher("/sorder.jsp").forward(request, response);
		}else {
			
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		
		
	
		
		
		
		
		
	}

}
