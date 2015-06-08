package com.zc.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.zc.bean.Order;
import com.zc.bean.Return;

public class OrderService {

	private JdbcTemplate jdbcTemplate; // new jdbcTemplate

	public JdbcTemplate getJdbcTemplate(JdbcTemplate jdbcTemplate) {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	
	private AddressService addressService;
	public AddressService getAddressService() {
		return addressService;
	}

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	
	/*
	 * createOrder
	 */
	public boolean createOrder(int user_id, int project_id, int return_id,
			int address_id) {
		String sql = "select * from order_view where user_id=? and project_id=?";
		List<Order> orderList = jdbcTemplate.query(sql, new OrderRowMapper(),
				user_id, project_id);

		if (orderList.size() != 0) {
			return false;
		} else {

			String address = addressService.getAddressById(address_id);
			
			
			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String order_time = sdf1.format(date);

			String sql2 = "insert into orders(user_id,project_id,return_id,address,order_time) values(?,?,?,?,?)";
			jdbcTemplate.update(sql2, user_id, project_id, return_id,
					address, order_time);

			return true;
		}

	}

	/*
	 * pay
	 */

	public void pay(int order_id) {
		String sql = "update orders set order_state='已支付' where order_id=?";
		jdbcTemplate.update(sql, order_id);
	}

	/*
	 * goodsOut
	 */
	public void goodsOut(int order_id, String logistics) {
		String sql = "update orders set logistics=? and order_state='已发货' where order_id=?";
		jdbcTemplate.update(sql, logistics, order_id);
	}

	/*
	 * getOrderById
	 */
	
	public Order getOrderById(int order_id) {
		String sql = "select * from orders where order_id=?";
		List<Order> orderlist = jdbcTemplate.query(sql, new OrderRowMapper(),
				order_id);
		return orderlist.get(0);

	}
	
	/*
	 * getOrderByUserAndProject
	 */
	
	public Order getOrderByUserAndProject(int user_id,int project_id) {
		String sql = "select * from order_view where user_id=? and project_id=?";
		List<Order> orderlist = jdbcTemplate.query(sql, new OrderRowMapper(),
				user_id,project_id);
		return orderlist.get(0);

	}

	/*
	 * getOrderByUser
	 */
	public List<Order> getOrderByUser(int user_id) {
		String sql = "select * from order_view where user_id=?";
		List<Order> orderlist = jdbcTemplate.query(sql, new OrderRowMapper(),
				user_id);
		return orderlist;

	}

	/*
	 * getOrderByProject
	 */
	public List<Order> getOrderByProject(int project_id) {
		String sql = "select * from order_view where project_id=?";
		List<Order> orderlist = jdbcTemplate.query(sql, new OrderRowMapper(),
				project_id);
		return orderlist;

	}

	/*
	 * getOrderByProjectAndState
	 */
	public List<Order> getOrderByState(String order_state, int project_id) {
		String sql = "select * from order_view where project_id=? and order_state=?";
		List<Order> orderlist = jdbcTemplate.query(sql, new OrderRowMapper(),
				project_id, order_state);
		return orderlist;

	}

	/*
	 * getOrderByUserAndState
	 */
	public List<Order> getOrderByUserAndState(String order_state, int user_id) {
		String sql = "select * from order_view where user_id=? and order_state=?";
		List<Order> orderlist = jdbcTemplate.query(sql, new OrderRowMapper(),
				user_id, order_state);
		return orderlist;

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * rowmapper
	 */

















	
	
	
	
	
	/*
	 * rowmapper
	 */

	private class OrderRowMapper implements RowMapper<Order> {
		public Order mapRow(ResultSet rs, int rowNum) throws SQLException {

			Order order = new Order();

			order.setOrder_id(rs.getInt("order_id"));
			order.setUser_id(rs.getInt("user_id"));
			order.setProject_id(rs.getInt("project_id"));
			order.setReturn_id(rs.getInt("return_id"));
			order.setReturn_image(rs.getString("return_image"));
			order.setAddress(rs.getString("address"));
			order.setOrder_time(rs.getDate("order_time").toString());
			order.setOrder_state(rs.getString("order_state"));
			order.setLogistics(rs.getString("logistics"));
			order.setProject_head(rs.getString("project_head"));
			order.setProject_title(rs.getString("project_title"));
			order.setSupport_money(rs.getString("support_money"));
			return order;
		}
	}

}
