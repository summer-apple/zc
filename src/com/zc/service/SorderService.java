package com.zc.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.zc.bean.Sorder;
import com.zc.bean.Return;

public class SorderService {

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
	 * createSorder
	 */
	public Sorder createSorder(int user_id, int store_id, int sorder_amount) {
		

			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String sorder_time = sdf1.format(date);

			String sql2 = "insert into sorder(user_id,store_id,sorder_amount,sorder_time) values(?,?,?,?)";
			jdbcTemplate.update(sql2, user_id,store_id,sorder_amount,sorder_time);

			return null;
		

	}

	/*
	 * pay
	 */

	public void pay(int sorder_id) {
		String sql = "update sorder set sorder_state='已支付' where sorder_id=?";
		jdbcTemplate.update(sql, sorder_id);
	}

	/*
	 * goodsOut
	 */
	public void goodsOut(int sorder_id) {
		String sql = "update sorder set sorder_state='已消费' where sorder_id=?";
		jdbcTemplate.update(sql,sorder_id);
	}

	/*
	 * getSorderById
	 */
	
	public Sorder getSorderById(int sorder_id) {
		String sql = "select * from sorder_view where sorder_id=?";
		List<Sorder> sorderlist = jdbcTemplate.query(sql, new SorderRowMapper(),
				sorder_id);
		return sorderlist.get(0);

	}
	
	/*
	 * getSorderByUserAndStore
	 */
	
	public List<Sorder> getSorderByUserAndStore(int user_id,int store_id) {
		String sql = "select * from sorder_view where user_id=? and store_id=?";
		List<Sorder> sorderlist = jdbcTemplate.query(sql, new SorderRowMapper(),
				user_id,store_id);
		return sorderlist;

	}

	/*
	 * getSorderByUser
	 */
	public List<Sorder> getSorderByUser(int user_id) {
		String sql = "select * from sorder_view where user_id=?";
		List<Sorder> sorderlist = jdbcTemplate.query(sql, new SorderRowMapper(),
				user_id);
		return sorderlist;

	}

	/*
	 * getSorderByProject
	 */
	public List<Sorder> getSorderByProject(int project_id) {
		String sql = "select * from sorder_view where project_id=?";
		List<Sorder> sorderlist = jdbcTemplate.query(sql, new SorderRowMapper(),
				project_id);
		return sorderlist;

	}

	/*
	 * getSorderByProjectAndState
	 */
	public List<Sorder> getSorderByState(String sorder_state, int project_id) {
		String sql = "select * from sorder_view where project_id=? and sorder_state=?";
		List<Sorder> sorderlist = jdbcTemplate.query(sql, new SorderRowMapper(),
				project_id, sorder_state);
		return sorderlist;

	}

	/*
	 * getSorderByUserAndState
	 */
	public List<Sorder> getSorderByUserAndState(String sorder_state, int user_id) {
		String sql = "select * from sorder_view where user_id=? and sorder_state=?";
		List<Sorder> sorderlist = jdbcTemplate.query(sql, new SorderRowMapper(),
				user_id, sorder_state);
		return sorderlist;

	}

	
	
	
	
	
	
	
	
	
	
	
















	
	
	
	
	
	/*
	 * rowmapper
	 */

	private class SorderRowMapper implements RowMapper<Sorder> {
		public Sorder mapRow(ResultSet rs, int rowNum) throws SQLException {

			Sorder sorder = new Sorder();

			sorder.setSorder_id(rs.getInt("sorder_id"));
			sorder.setUser_id(rs.getInt("user_id"));
			sorder.setSorder_amount(rs.getInt("sorder_amount"));
			sorder.setSorder_state(rs.getString("sorder_state"));
			sorder.setSorder_time(rs.getDate("sorder_time").toString()+" "+rs.getTime("sorder_time").toString());
			sorder.setSorder_state(rs.getString("sorder_state"));
		
			return sorder;
		}
	}

}
