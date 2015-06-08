package com.zc.bean;

import java.io.Serializable;

public class User implements Serializable {
	private int user_id;
	private String user_name;
	private String user_pass;
	private String user_email;
	private String user_sex;
	private String user_avatar;
	private String user_address_province;
	private String user_address_city;
	private String user_phone;
	private int    user_account;
	private String user_true_name;
	private int user_type;
	private String user_code;
	private int user_rank;
	private int store_id;
	
	public int getUser_rank() {
		return user_rank;
	}
	public void setUser_rank(int user_rank) {
		this.user_rank = user_rank;
	}

	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_avatar() {
		return user_avatar;
	}
	public void setUser_avatar(String user_avatar) {
		this.user_avatar = user_avatar;
	}

	public String getUser_address_province() {
		return user_address_province;
	}
	public void setUser_address_province(String user_address_province) {
		this.user_address_province = user_address_province;
	}
	public String getUser_address_city() {
		return user_address_city;
	}
	public void setUser_address_city(String user_address_city) {
		this.user_address_city = user_address_city;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public int getUser_account() {
		return user_account;
	}
	public void setUser_account(int user_account) {
		this.user_account = user_account;
	}
	public String getUser_true_name() {
		return user_true_name;
	}
	public void setUser_true_name(String user_true_name) {
		this.user_true_name = user_true_name;
	}
	
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	
	
	
}
