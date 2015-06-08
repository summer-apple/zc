package com.zc.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.zc.bean.Address;
import com.zc.bean.User;


public class AddressService {
	private JdbcTemplate jdbcTemplate;  //new jdbcTemplate
	public JdbcTemplate getJdbcTemplate(JdbcTemplate jdbcTemplate) {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {   
		  this.jdbcTemplate = jdbcTemplate;   
		} 
	
/*
 * 添加地址
 */
	public boolean addAddress(int user_id,String address_name,String address_phone,String address_province,String address_city,String address_district,String address_detial) {
		boolean flag = false;
		String sql1="select * from address where user_id=? and address_name=? and address_phone=? and address_province=? and address_city=? and address_district=? and address_detial=?";
		List<Address> addressList = jdbcTemplate.query(sql1,new AddressRowMappser(),user_id,address_name,address_phone,address_province,address_city,address_district,address_detial);
		if (addressList.size()==0) {
			String sql2 = "insert into address(user_id,address_name,address_phone,address_province,address_city,address_district,address_detial) values(?,?,?,?,?,?,?)";
			jdbcTemplate.update(sql2,user_id,address_name,address_phone,address_province,address_city,address_district,address_detial);
			flag = true;
			return flag;
		}else {
			return flag;
		}
	}
	
/*
 * 删除地址
 */
	public void deleteAddress(int address_id) {
		String sql = "delete from address where address_id=?";
		jdbcTemplate.update(sql,address_id);
	}
	
	
	
/*
 * 获取地址列表	
 */
	public List<Address> getAddressList(int user_id) {
		String sql = "select * from address where user_id=?";
		List<Address> addressList = jdbcTemplate.query(sql,new AddressRowMappser(),user_id);
		return addressList;
	}
/*
 * getAddressById	
 */
	
	public String  getAddressById(int address_id) {
		String sql = "select * from address where address_id=?";
		List<Address> addressList = jdbcTemplate.query(sql, new AddressRowMappser(),address_id);
		Address a = addressList.get(0);
		String address = "";
		address = a.getAddress_name() + "  "+a.getAddress_phone() + "  " +a.getAddress_province() + " " +a.getAddress_city() + " " + a.getAddress_district()+ " " + a.getAddress_detial();
		System.out.println(address);
		return address;
	}
/*
 * 	
 */
	
/*
 * AddressRowMappser	
 */
	private class AddressRowMappser implements RowMapper<Address>  {
		public Address mapRow(ResultSet rs,int rowNum) throws SQLException{
			
			Address address = new Address();
			
			address.setAddress_id(rs.getInt("address_id"));
			address.setUser_id(rs.getInt("user_id"));
			address.setAddress_name(rs.getString("address_name"));
			address.setAddress_phone(rs.getString("address_phone"));
			address.setAddress_province(rs.getString("address_province"));
			address.setAddress_city(rs.getString("address_city"));
			address.setAddress_district(rs.getString("address_district"));
			address.setAddress_detial(rs.getString("address_detial"));
			
	
			return address;
		}
	}
}