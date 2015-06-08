package com.zc.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.zc.bean.Project;
import com.zc.bean.Return;

public class ReturnService {
	private JdbcTemplate jdbcTemplate;  //new jdbcTemplate
	public JdbcTemplate getJdbcTemplate(JdbcTemplate jdbcTemplate) {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {   
		  this.jdbcTemplate = jdbcTemplate;   
		} 
	
	
//	private ProjectService projectService;
//	public ProjectService getProjectService(ProjectService projectService) {
//		return projectService;
//	}
//	public void setProjectService(ProjectService projectService) {
//		this.projectService = projectService;
//	}
	
/*
 * addReturn	
 */
	public boolean  addReturn(int project_id,int support_money,String return_content,String return_image,int support_limit,int freight,int return_time,String return_type) {
		System.out.println("3333333333333333");
		String sql1 = "select * from returns where project_id=? and support_money=?";
		List<Return> rlist = jdbcTemplate.query(sql1, new ReturnRowMapper(),project_id,support_money);
		if (rlist.size()!=0) {
			return false;
		}else {
			System.out.println("4444444444444444");
			String sql2 = "insert into returns(project_id,support_money,return_content,return_image,support_limit,freight,return_time,return_type) values(?,?,?,?,?,?,?,?)";
			jdbcTemplate.update(sql2,project_id,support_money,return_content,return_image,support_limit,freight,return_time,return_type);
			return true;
		}
		
		
	}
	
/*
 * getReturn of one project
 */
	public List<Return> getReturnByProjectId(int project_id) {
		
		String sql = "select * from returns where project_id=?";
		List<Return> rList = jdbcTemplate.query(sql, new ReturnRowMapper(),project_id);
		
		return rList;
	}
	
	
/*
 * getReturnById	
 */
	public Return getReturnById(int return_id){
		
		String sql = "select * from returns where return_id=?";
		List<Return> rList = jdbcTemplate.query(sql, new ReturnRowMapper(),return_id);
		
		return rList.get(0);
	}
	
	
/*
 * getReturn	for each project
 */
	public List<Project> getReturn(List<Project> projectlist) {
		
		for (int i = 0; i < projectlist.size(); i++) {
			Project project = projectlist.get(i);
			int project_id = project.getProject_id();
			String sql = "select * from returns where project_id=?";
			List<Return> rList = jdbcTemplate.query(sql, new ReturnRowMapper(),project_id);
			
			project.setProject_return(rList);
		}
		
		
		
		return projectlist;
	}
	
	
/*
 * deleteReturn	
 */
	public void deleteReturn(int return_id) {
		String sql = "delete from returns where return_id=?";
		jdbcTemplate.update(sql,return_id);
	}

/*
 * eidtReturn
 */
	
	
	public void eidtReturn(int return_id,int support_money,String return_content,String return_image,int support_limit,int freight,int return_time,String return_type) {
		String sql = "update returns set support_money=?,return_content=?,return_image=?,support_limit=?,freight=?,return_time=?,return_type=? where return_id=?";
		jdbcTemplate.update(sql,support_money,return_content,return_image,support_limit,freight,return_time,return_type,return_id);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*
 * rowMapper	
 */
	
	private class ReturnRowMapper implements RowMapper<Return>  {
		public Return mapRow(ResultSet rs,int rowNum) throws SQLException{
			
			Return r = new Return();
			
			r.setReturn_id(rs.getInt("return_id"));
			r.setReturn_content(rs.getString("return_content"));
			r.setReturn_image(rs.getString("return_image"));
			r.setSupport_limit(rs.getInt("support_limit"));
			r.setProject_id(rs.getInt("project_id"));
			r.setFreight(rs.getInt("freight"));
			r.setReturn_time(rs.getInt("return_time"));
			r.setSupport_money(rs.getInt("support_money"));
			r.setReturn_type(rs.getString("return_type"));
			r.setSupport_count(rs.getInt("support_count"));
	
			return r;
		}
	}//rowmapper end
	
	
	
	
}
