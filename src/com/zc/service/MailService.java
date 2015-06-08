package com.zc.service;
import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage; 


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.javamail.JavaMailSenderImpl; 
import org.springframework.mail.javamail.MimeMessageHelper; 

public class MailService {
	
	private JdbcTemplate jdbcTemplate;  //new jdbcTemplate
	
	/**
	 * get and set jdbcTemplate
	 */
	public JdbcTemplate getJdbcTemplate(JdbcTemplate jdbcTemplate) {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {   
		this.jdbcTemplate = jdbcTemplate;   
	}  
		
	
	/*
	 * 生成随机字符串
	 */
	private static String getRandomString(int length) { //length表示生成字符串的长度  
	    String base = "abcdefghijklmnopqrstuvwxyz0123456789";     
	    Random random = new Random();     
	    StringBuffer sb = new StringBuffer();     
	    for (int i = 0; i < length; i++) {     
	        int number = random.nextInt(base.length());     
	        sb.append(base.charAt(number));     
	    }     
	    return sb.toString();     
	 }  	
			
	
	
	
	public String  registerMail(String user_email,String user_name) throws MessagingException {
		
		System.out.println("MailService user_email:"+user_email);
		System.out.println("MailService user_name:"+user_name);
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl(); 
	    
	    //设定mail server 
	    senderImpl.setHost("smtp.126.com"); 
	    
	    //建立邮件消息,发送简单邮件和html邮件的区别 
	    MimeMessage mailMessage = senderImpl.createMimeMessage(); 
	    MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,true,"utf-8"); 
	             
	    //设置收件人，寄件人 
	    messageHelper.setTo(user_email); 
	    messageHelper.setFrom("gmctest@126.com"); 
	    messageHelper.setSubject("测试HTML邮件！"); 
	    //true 表示启动HTML格式的邮件 
	    
	 
	    String url = "";
	    String randomCode = MailService.getRandomString(20);
	    url="http://127.0.0.1:8080/zc/RegisterActivationServlet?user_code="+randomCode+"&user_name="+user_name;
	    
	    messageHelper.setText("<html><head><meta charset='utf-8'></head><body><h1><a style='text-decoration:underline' href='"+url+"'>"+url+"</a></h1><br><br><h1>请在15分钟内登录邮箱激活，否则该账号将被释放！</h1></body></html>",true); 
	    
	    senderImpl.setUsername( "gmctest@126.com" ) ;  //  根据自己的情况,设置username 
	    senderImpl.setPassword( "123asdASD" ) ;  //  根据自己的情况, 设置password 
	    Properties prop = new Properties() ;
	    prop.put("mail.smtp.auth", "true") ; // 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
	    prop.put("mail.smtp.timeout", "25000") ; 
	    senderImpl.setJavaMailProperties(prop); 
	    //发送邮件 
	    senderImpl.send(mailMessage); 
		return randomCode;
	}
	
	
	
	
	
	
	
	public String forgetPassMail(String user_email) throws MessagingException {
	
		
JavaMailSenderImpl senderImpl = new JavaMailSenderImpl(); 
	    
	    //设定mail server 
	    senderImpl.setHost("smtp.126.com"); 
	    
	    //建立邮件消息,发送简单邮件和html邮件的区别 
	    MimeMessage mailMessage = senderImpl.createMimeMessage(); 
	    MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,true,"utf-8"); 
	             
	    //设置收件人，寄件人 
	    messageHelper.setTo(user_email); 
	    messageHelper.setFrom("gmctest@126.com"); 
	    messageHelper.setSubject("找回密码"); 
	    //true 表示启动HTML格式的邮件 
	    
	 
	    String url = "";
	    String randomCode = MailService.getRandomString(20);
	    url="http://127.0.0.1:8080/zc/ForgetPassActivationServlet?user_code="+randomCode+"&user_email="+user_email;
	    
	    messageHelper.setText("<html><head><meta charset='utf-8'></head><body><h1><a style='text-decoration:underline' href='"+url+"'>"+url+"</a></h1><br><br><h1>请在15分钟内登录邮箱查看并重设密码，过期无效！</h1></body></html>",true); 
	    
	    senderImpl.setUsername( "gmctest@126.com" ) ;  //  根据自己的情况,设置username 
	    senderImpl.setPassword( "123asdASD" ) ;  //  根据自己的情况, 设置password 
	    Properties prop = new Properties() ;
	    prop.put("mail.smtp.auth", "true") ; // 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
	    prop.put("mail.smtp.timeout", "25000") ; 
	    senderImpl.setJavaMailProperties(prop); 
	    //发送邮件 
	    senderImpl.send(mailMessage); 
		
		
		
		return randomCode;
	}
}
