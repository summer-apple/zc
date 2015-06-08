package com.zc.bean;

import java.util.List;

public class Project {
	private int project_id;
	private int project_owner_id;
	private String project_owner_name;
	private String project_owner_avatar;
	private String project_title;
	private String project_head;
	private String project_description;
	private String project_content;
	private String project_class;
	private String project_address_province;
	private String project_address_city;
	private float project_process;
	private int project_money;
	private int project_money_recive;
	private int project_days;
	private String project_start;
	private String project_end;
	private int project_day_left;
	private String project_state;
	
	
	private List<Return> project_return;
	
	
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	
	public int getProject_owner_id() {
		return project_owner_id;
	}
	public void setProject_owner_id(int project_owner_id) {
		this.project_owner_id = project_owner_id;
	}
	public String getProject_owner_name() {
		return project_owner_name;
	}
	public void setProject_owner_name(String project_owner_name) {
		this.project_owner_name = project_owner_name;
	}
	public String getProject_title() {
		return project_title;
	}
	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}
	public String getProject_head() {
		return project_head;
	}
	public void setProject_head(String project_head) {
		this.project_head = project_head;
	}
	public String getProject_description() {
		return project_description;
	}
	public void setProject_description(String project_description) {
		this.project_description = project_description;
	}
	public String getProject_content() {
		return project_content;
	}
	public void setProject_content(String project_content) {
		this.project_content = project_content;
	}
	
	public String getProject_class() {
		return project_class;
	}
	public void setProject_class(String project_class) {
		this.project_class = project_class;
	}
	public String getProject_address_province() {
		return project_address_province;
	}
	public void setProject_address_province(String project_address_province) {
		this.project_address_province = project_address_province;
	}
	public String getProject_address_city() {
		return project_address_city;
	}
	public void setProject_address_city(String project_address_city) {
		this.project_address_city = project_address_city;
	}
	public float getProject_process() {
		return project_process;
	}
	public void setProject_process(float project_process) {
		this.project_process = project_process;
	}
	public int getProject_money() {
		return project_money;
	}
	public void setProject_money(int project_money) {
		this.project_money = project_money;
	}
	public String getProject_start() {
		return project_start;
	}
	public void setProject_start(String project_start) {
		this.project_start = project_start;
	}
	public String getProject_state() {
		return project_state;
	}
	public void setProject_state(String project_state) {
		this.project_state = project_state;
	}
	public int getProject_days() {
		return project_days;
	}
	public void setProject_days(int project_days) {
		this.project_days = project_days;
	}
	public List<Return> getProject_return() {
		return project_return;
	}
	public void setProject_return(List<Return> project_return) {
		this.project_return = project_return;
	}
	public String getProject_end() {
		return project_end;
	}
	public void setProject_end(String project_end) {
		this.project_end = project_end;
	}
	public int getProject_money_recive() {
		return project_money_recive;
	}
	public void setProject_money_recive(int project_money_recive) {
		this.project_money_recive = project_money_recive;
	}
	public int getProject_day_left() {
		return project_day_left;
	}
	public void setProject_day_left(int project_day_left) {
		this.project_day_left = project_day_left;
	}
	public String getProject_owner_avatar() {
		return project_owner_avatar;
	}
	public void setProject_owner_avatar(String project_owner_avatar) {
		this.project_owner_avatar = project_owner_avatar;
	}
	
	
	
}
