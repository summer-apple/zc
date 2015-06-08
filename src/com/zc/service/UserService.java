package com.zc.service;

import java.security.MessageDigest;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.mail.MessagingException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.zc.bean.User;
import com.zc.service.MailService;

public class UserService {
	
		private JdbcTemplate jdbcTemplate;  //new jdbcTemplate
		private MailService mailService;
		private AddressService addressService;
/**
 * get and set jdbcTemplate
 */
		public JdbcTemplate getJdbcTemplate(JdbcTemplate jdbcTemplate) {
			return jdbcTemplate;
		}
		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {   
			  this.jdbcTemplate = jdbcTemplate;   
			} 
		
		public MailService getMailService(MailService mailService) {
			return mailService;
		}
		public void setMailService(MailService mailService) {
			this.mailService = mailService;
		}
		
		public AddressService getAddressService(AddressService addressService) {
			return addressService;
		}
		public void setAddressService(AddressService addressService) {
			this.addressService = addressService;
		}
		/**
	     * 生成md5
	     * @param message
	     * @return
	     */
	    public static String getMD5(String message) {
	        String md5str = "";
	        try {
	            //1 创建一个提供信息摘要算法的对象，初始化为md5算法对象
	            MessageDigest md = MessageDigest.getInstance("MD5");
	 
	            //2 将消息变成byte数组
	            byte[] input = message.getBytes();
	 
	            //3 计算后获得字节数组,这就是那128位了
	            byte[] buff = md.digest(input);
	 
	            //4 把数组每一字节（一个字节占八位）换成16进制连成md5字符串
	            md5str = UserService.bytesToHex(buff);
	            //5 转换成16位
	            md5str = md5str.substring(8,24);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	       
	        return md5str;
	    }
	    
	    
	    /**
	     * 二进制转十六进制
	     * @param bytes
	     * @return
	     */
	    public static String bytesToHex(byte[] bytes) {
	        StringBuffer md5str = new StringBuffer();
	        //把数组每一字节换成16进制连成md5字符串
	        int digital;
	        for (int i = 0; i < bytes.length; i++) {
	             digital = bytes[i];
	 
	            if(digital < 0) {
	                digital += 256;
	            }
	            if(digital < 16){
	                md5str.append("0");
	            }
	            md5str.append(Integer.toHexString(digital));
	        }
	        return md5str.toString().toUpperCase();
	    }		
		
		
/**
 * checkUserName	
 * @param un
 * @return
 */
		public boolean checkUserName(String un) {
			boolean checkUnFlag;
			String sql="select * from User " +
					"where user_name=?";
			List<User> userList = jdbcTemplate.query(sql, new UserRowMapper(),un);
			if (userList.size()>0) {
				checkUnFlag=true;//user_name is exist
			} else {
				checkUnFlag=false;//user_name is not exist
			}
			return checkUnFlag;
		}
		
		
		
/**
 * checkUserEmail		
 */
		
		public boolean checkUserEmail(String ue) {
			boolean checkUeFlag;
			String sql="select * from User " +
					"where user_email=?";
			List<User> userList = jdbcTemplate.query(sql, new UserRowMapper(),ue);
			if (userList.size()>0) {
				checkUeFlag=true;//user_name is exist
			} else {
				checkUeFlag=false;//user_name is not exist
			}
			return checkUeFlag;
		}
		
/**
 * checkUser		
 */
		public User checkUser(String un,String up) {
			up = UserService.getMD5(up);
			User user=new User();
			String sql="select * from user where user_name=?";
			List<User> userList = jdbcTemplate.query(sql, new UserRowMapper(),un);
			if (userList.size()!=0) {//用户名存在
				user=userList.get(0);
				if(user.getUser_pass().equals(up)){//用户名与密码匹配成功
					return user;
				}else {//用户名密码不匹配
					user=null;
					return user;
				}
				
			} else {//用户名不存在
				user=null;
				return user;
			}
			
		}
		
/**
 * register
 */
		
		public boolean register(final String user_name,String user_pass,String user_email) {
			
			
			
			user_pass = UserService.getMD5(user_pass);//转成md5密码
			
			boolean registerFlag;//生成邮件激活码
			String user_code = "";
			try {
				user_code = mailService.registerMail(user_email,user_name);
			} catch (MessagingException e) {
				System.out.println("send mail error!");
				e.printStackTrace();
			}
			
			
		
			
			
			String sql="insert into User " +
					"(user_name,user_pass,user_email,user_code) " +
					"values(?,?,?,?)";
			jdbcTemplate.update(sql,user_name,user_pass,user_email,user_code);
			
			
			
			// 第一种方法：设定指定任务task在指定时间time执行 schedule(TimerTask task, Date time)  
			   
	        Timer timer = new Timer();  
	        timer.schedule(new TimerTask() {  
	            public void run() { 
	            	String sqlflag="select * from user where user_name=?";
	    			List<User> userList = jdbcTemplate.query(sqlflag, new UserRowMapper(),user_name);
	    			if (userList.size()>0) {
	    				int user_type = userList.get(0).getUser_type();
	    				if (user_type==0) {
	    					String sql = "delete from user where user_name=?";
	    	                jdbcTemplate.update(sql,user_name);
	    	                System.out.println("time run out,the register is failure!");
						}
	    			}
	    			
	    			
	                
	            }  
	        }, 15*60*1000);// 设定指定的时间time,此处为1分钟  
	    
		
			
			
			String sqlflag="select * from user " +
					"where user_name=?";
			List<User> userList = jdbcTemplate.query(sqlflag, new UserRowMapper(),user_name);
			if (userList.size()>0) {
				registerFlag=true;//add user success
			} else {
				registerFlag=false;//add user failure
			}
			return registerFlag;
			
			
		}

		
		
		
		
		
		
		
		
		
		
		
		
/*
 * registerActivation
 */
		public void registerActivation(String user_name,String user_code) {
			
			String sql1 = "select * from user where user_name=? and user_code=?";
			List<User> userlist = jdbcTemplate.query(sql1, new UserRowMapper(),user_name,user_code);
			if (userlist.size()>0) {
				User user = userlist.get(0);
				
				if (user!=null) {
					String sql2 = "update user set user_type=1 where user_name=?";
					jdbcTemplate.update(sql2,user_name);
					System.out.println("user_type changed!");
				} else {
					System.out.println("激活出错！");
				}
			}else {
				System.out.println("激活出错！");
			}
			
			
			
		}
		
		
/**
 * update user head		
 * @param user_id
 * @return
 */
		
		
		public void updateUserHead(int user_id,String user_avatar) {
			String sql ="update user set user_avatar=? where user_id=?";
			jdbcTemplate.update(sql,user_avatar,user_id);
		}
		
/*
 * getUserById		
 */

		public User getUserById(int user_id) {
			
			String sql = "select * from user where user_id=?";
			
			List<User> userlist = jdbcTemplate.query(sql,new UserRowMapper(),user_id);
			
			User user = userlist.get(0);
			
			return user;
		}
		
/*
* getUserByName		
*/

		public User getUserByName(String  user_name) {
					
			System.out.println("getUserByName:"+user_name);
			String sql = "select * from user where user_name=?";
					
			List<User> userlist = jdbcTemplate.query(sql,new UserRowMapper(),user_name);
			User user=null;
			
			if (userlist.size()>0) {
				user = userlist.get(0);
			}
			
					
			return user;
		}

/*
 * getUserByEmail
 */
		
		
		public User getUserByEmail(String user_email) {
			String sql = "select * from user where user_email=?";
			
			List<User> userlist = jdbcTemplate.query(sql,new UserRowMapper(),user_email);
			User user=null;
			
			if (userlist.size()>0) {
				user = userlist.get(0);
			}
			return user;
		}
/*
 *
 * updateUserInfo		
 */
		
		public void updateUserInfo(int user_id,String user_true_name,String user_sex,String user_phone,String user_address_province,String user_address_city) {
			if (user_true_name!=null) {
				String sql ="update user set user_true_name=?,user_sex=?,user_phone=?,user_address_province=?,user_address_city=? where user_id=?";
				jdbcTemplate.update(sql,user_true_name,user_sex,user_phone,user_address_province,user_address_city,user_id);
			}else {
				String sql ="update user set user_sex=?,user_phone=?,user_address_province=?,user_address_city=? where user_id=?";
				jdbcTemplate.update(sql,user_sex,user_phone,user_address_province,user_address_city,user_id);
			}
		}
		
		
/*
 * updateUserPass		
 */
		
		
		public void updateUserPass(int user_id,String new_pass) {
			String sql = "update user set user_pass=? where user_id=?";
			
			new_pass = UserService.getMD5(new_pass);
			jdbcTemplate.update(sql,new_pass,user_id);
		}
		
		
/*
 * forgetPass		
 */
		
		public void forgetPass(final String user_email) {
			
			try {
				String user_code = mailService.forgetPassMail(user_email);
				String sql = "update user set user_code=? where user_email=?";
                jdbcTemplate.update(sql,user_code,user_email);
                
			} catch (MessagingException e) {
				
				e.printStackTrace();
			}
			
			// 第一种方法：设定指定任务task在指定时间time执行 schedule(TimerTask task, Date time)  
			   
	        Timer timer = new Timer();  
	        timer.schedule(new TimerTask() {  
	            public void run() { 
	            	
	            	String sql = "update user set user_code='' where user_email=?";
	                jdbcTemplate.update(sql,user_email);
	    	        System.out.println("time run out,the forgetpass is failure!");
					 
	            }  
	        }, 15*60*1000);// 设定指定的时间time,此处为1分钟  
			
		}
		
		
		
//getUserList
		
		public List<User> getUserList() {
			String sql = "select * from User order by user_type";
			return jdbcTemplate.query(sql, new UserRowMapper());
		}
		
//deleteUser
		
		public void deleteUser(int user_id) {
			String sql1 = "delete from User where user_id=?";
			String sql2 = "delete from Store where store_owner=?";
			jdbcTemplate.update(sql1,user_id);
			jdbcTemplate.update(sql2,user_id);
	
		}
		
//changeUserType
		
		public void changeUserType(int user_id,int user_type) {
			String sql = "update user set user_type=? where user_id=?";
			jdbcTemplate.update(sql,user_type,user_id);
	
		}
		
		
		
		
		
		
		
		
		
/**
 * UserRowMapper
 */
		private class UserRowMapper implements RowMapper<User>  {
			public User mapRow(ResultSet rs,int rowNum) throws SQLException{
				
				User user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_pass(rs.getString("user_pass"));
				user.setUser_email(rs.getString("user_email"));
				user.setUser_avatar(rs.getString("user_avatar"));
				user.setUser_address_province(rs.getString("user_address_province"));
				user.setUser_address_city(rs.getString("user_address_city"));
				user.setUser_account(rs.getInt("user_account"));
				user.setUser_true_name(rs.getString("user_true_name"));
				user.setUser_phone(rs.getString("user_phone"));
				user.setUser_sex(rs.getString("user_sex"));
				user.setUser_type(rs.getInt("user_type"));
				user.setUser_code(rs.getString("user_code"));
				user.setUser_rank(rs.getInt("user_rank"));
				user.setStore_id(rs.getInt("store_id"));
				return user;
			}
		}
		
		
		
		

				
				
				
				
				
				
				
				
				
				
				
		
}






