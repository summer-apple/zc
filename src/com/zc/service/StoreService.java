package com.zc.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mysql.jdbc.Blob;
import com.zc.bean.Store;




public class StoreService {
	private JdbcTemplate jdbcTemplate; // new jdbcTemplate

	/**
	 * get and set jdbcTemplate
	 */
	public JdbcTemplate getJdbcTemplate(JdbcTemplate jdbcTemplate) {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/**
	 * checkStoreName
	 * 
	 * @param un
	 * @return
	 */
	public boolean checkStoreName(String sn) {
		boolean checkUnFlag;
		String sql = "select * from Store " + "where store_name=?";
		List<Store> storeList = jdbcTemplate
				.query(sql, new StoreRowMapper(), sn);
		if (storeList.size() > 0) {
			checkUnFlag = true;// store_name is exist
		} else {
			checkUnFlag = false;// store_name is not exist
		}
		return checkUnFlag;
	}

	
	
	
/**
* registerStore
*/
	
	public Store registerStore(int store_owner, String store_name,
			String store_head, String store_description,
			String store_content, String store_class,
			String store_address_province, String store_address_city,
			String store_type, String  store_phone,String store_alipay) {

		
		String sql2 = "select * from store_view where store_owner_id=?";

		List<Store> storeList = jdbcTemplate.query(sql2,
				new StoreRowMapper(), store_owner);

		Store store = new Store();

		if (storeList.size() == 0) {
			String sql = "insert into store(store_owner,store_name,store_head,store_description,store_content,store_class,store_address_province,store_address_city,store_type,store_phone,store_alipay) values(?,?,?,?,?,?,?,?,?,?,?)";
			jdbcTemplate.update(sql, store_owner, store_name, store_head,
					store_description, store_content, store_class,
					store_address_province, store_address_city, store_type,store_phone,store_alipay);
			
			store = jdbcTemplate.query(sql2, new StoreRowMapper(),store_owner).get(0);
			
			String sql3 = "update user set store_id=? where user_id=?";
			jdbcTemplate.update(sql3,store.getStore_id(),store_owner);
			
			
		}else {
			store = storeList.get(0);
		}
		

		
		return store;
	}
	
/**
* deleteStore		
*/
	public void deleteStore(int store_id) {
		String sql="delete from Store " +
				"where store_id=?";
		jdbcTemplate.update(sql,store_id);
	}
	

	
/**
 * getStoreList
 */
		
	public List<Store> getStoreList() {
		String sql="select * from store_view";
		List<Store> storelist = jdbcTemplate.query(sql, new StoreRowMapper());
		return storelist;
	}	
	
	

	
/**
 * getStoreByOwner	
 */
	
	public  Store getStoreByOwner(int owner) {
		String sql="select * from store_view where store_owner_id=?";
		Store store = jdbcTemplate.queryForObject(sql, new StoreRowMapper(),owner);
		return store;
	}
	

	
/**
* getStoreById	
*/
		
	public  Store getStoreById(int store_id) {
		String sql="select * from store_view where store_id=?";
		Store store = jdbcTemplate.queryForObject(sql, new StoreRowMapper(),store_id);
		return store;
	}
		
/*
 * getTopStore	
 */
	
	public  List<Store> getTopStore() {
		String sql="select * from store_view order by rand() limit 20";
		 List<Store> storelist = jdbcTemplate.query(sql, new StoreRowMapper());
		return storelist;
	}
	
	
	
	
	
	
	
	/**
	 * StoreRowMapper
	 */
	private class StoreRowMapper implements RowMapper<Store> {
		public Store mapRow(ResultSet rs, int rowNum) throws SQLException {
			Store store = new Store();
			store.setStore_id(rs.getInt("store_id"));
			store.setStore_name(rs.getString("store_name"));
			store.setStore_head(rs.getString("store_head"));
			store.setStore_owner_id(rs.getInt("store_owner_id"));
			store.setStore_owner_name(rs.getString("store_owner_name"));
			store.setStore_address_province(rs.getString("store_address_province"));
			store.setStore_address_city(rs.getString("store_address_city"));
			store.setStore_class(rs.getString("store_class"));
			
			store.setStore_description(rs.getString("store_description"));
			store.setStore_type(rs.getString("store_type"));
			store.setStore_phone(rs.getString("store_phone"));
			store.setStore_alipay(rs.getString("store_alipay"));
			
			Blob noteBlob = (Blob) rs.getBlob("store_content");
			String note = null;
			if (noteBlob != null) {
				InputStream is = noteBlob.getBinaryStream();
				ByteArrayInputStream bais = (ByteArrayInputStream) is;
				byte[] byte_data = new byte[bais.available()]; // bais.available()返回此输入流的字节数

				bais.read(byte_data, 0, byte_data.length);// 将输入流中的内容读到指定的数组
				try {
					note = new String(byte_data, "utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 再转为String，并使用指定的编码方式
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			store.setStore_content(note);
			
			
			
			return store;
		}
	}

}
