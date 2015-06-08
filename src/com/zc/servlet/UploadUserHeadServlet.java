package com.zc.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;



import com.zc.bean.User;
import com.zc.service.UserService;

public class UploadUserHeadServlet extends HttpServlet {

	public UploadUserHeadServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("user");
		int user_id = user.getUser_id();
		
		String adjunctname = null;
		String user_head=user.getUser_avatar();
		String fileDir = "/Users/summer/Documents/workspace/zc/WebContent/images/user/avatar/";//request.getSession().getServletContext().getRealPath("/images/user/avatar/");
System.out.println("fileDir="+fileDir);
		String message = "图片上传成功 !";
		String address = "";
		if (ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(20 * 1024);
			factory.setRepository(factory.getRepository());
			ServletFileUpload upload = new ServletFileUpload(factory);
			int size = 200 * 1024 * 1024;
			List formlists = null;
			
				try {
					formlists = (List) upload.parseRequest(request);
				} catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			Iterator iter = formlists.iterator();
			while (iter.hasNext()) {
				FileItem formItem = (FileItem) iter.next();
				if (!formItem.isFormField()) {
					String name = formItem.getName();
					String extend = name.substring(name.lastIndexOf(".") + 1,name.length());
					extend = extend.toLowerCase();
System.out.println(extend);

					boolean extendboo = false;
					
					if(extend.equals("jpg")){
						extendboo = true;
					}else if(extend.equals("png")){
						extendboo = true;
					}else if(extend.equals("gif")){
						extendboo = true;
					}else if(extend.equals("jpeg")){
						extend="jpg";
						extendboo = true;
					}else{
						extendboo = false;
					}

					if (extendboo) {
						if (formItem.getSize() > size) {
							message = "不能大于2M ！";
							continue;
						}
						String adjunctsize = new Long(formItem.getSize())
								.toString();

						if ((name == null) || (name.equals(""))
								&& (adjunctsize.equals("0"))) {
							//message="没有选择图片";
							continue;
						}
						//adjunctname = name.substring(name.indexOf("/") + 1,name.length());
						Date date = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
						sdf.format(date);
						
						//adjunctname = user_id+sdf.format(date)+"."+extend;//rename
						
						
						adjunctname = user_id+"."+extend;//rename
						
						

						address = fileDir + "/" + adjunctname;

						user_head = "images/user/avatar/"+adjunctname;

						File saveFile = new File(address);
						try {
							formItem.write(saveFile);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						message = "文件格式不对 ！";
					}

				} else {
					// 如果是文件字段 **********************
					String name = formItem.getFieldName();
					String value = formItem.getString();

				}
				request.setAttribute("result", message);
			}
			
			
			WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
			UserService us = (UserService) wac.getBean("userService");
			if (message.equals("图片上传成功 !")) {
				
				us.updateUserHead(user_id, user_head);
				
			}
			
			user = us.getUserById(user_id);
			request.getSession().setAttribute("uploadMessage", message);
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("settings-avatar.jsp").forward(request, response);
System.out.println(message);
			
			
		}

	}
}
