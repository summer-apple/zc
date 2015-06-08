package com.zc.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter {
	private FilterConfig config;
	public void init(FilterConfig config) throws ServletException {
		this.config=config;
	}
	public void destroy() {
		this.config=null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest requ = (HttpServletRequest)request;
		HttpSession session = requ.getSession(true);
		String requestPath = requ.getContextPath();
		
		//System.out.println(session.getAttribute("user"));
		
	
		
		String refer = ((HttpServletRequest) request).getHeader("REFERER"); 
		
		System.out.println(refer);
		
		if (refer!=null) {//转跳访问
			
				if((session.getAttribute("user")==null) && !refer.endsWith("index.jsp")
														&& !refer.endsWith("forget.jsp")
														&& !refer.endsWith("reset-pass.jsp")){
					
					request.getRequestDispatcher("/index.jsp").forward(request, response);
					
					chain.doFilter(request, response);
				}else {
					
					chain.doFilter(request, response);
				}
				
			}else {//直接网址访问
				
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				
				
				chain.doFilter(request, response);
			}
		
		
		//chain.doFilter(request, response);
	}

	

}
