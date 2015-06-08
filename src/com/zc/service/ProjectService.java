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
import com.zc.bean.Project;
import com.zc.bean.User;

public class ProjectService {
	private JdbcTemplate jdbcTemplate; // new jdbcTemplate

	public JdbcTemplate getJdbcTemplate(JdbcTemplate jdbcTemplate) {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	private ReturnService returnService;

	public ReturnService getReturnService(ReturnService returnService) {
		return returnService;
	}

	public void setReturnService(ReturnService returnService) {
		this.returnService = returnService;
	}

	/*
	 * orginProject
	 */
	public Project orginProject(int project_owner, String project_title,
			String project_head, String project_description,
			String project_content, String project_class,
			String project_address_province, String project_address_city,
			int project_days, int project_money) {

		String sql = "insert into project(project_owner,project_title,project_head,project_description,project_content,project_class,project_address_province,project_address_city,project_days,project_money) values(?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, project_owner, project_title, project_head,
				project_description, project_content, project_class,
				project_address_province, project_address_city, project_days,
				project_money);

		String sql2 = "select * from project_view where project_owner_id=? and project_title=?";

		List<Project> projectList = jdbcTemplate.query(sql2,
				new ProjectRowMapper(), project_owner, project_title);

		Project project = null;

		if (projectList.size() != 0) {
			project = projectList.get(0);
		}
		return project;
	}

	/*
	 * updateProject
	 */

	public void updateProject(int project_id, String project_title,
			String project_head, String project_description,
			String project_content, String project_class,
			String project_address_province, String project_address_city,
			int project_days, int project_money) {
		String sql = "update project set project_title=?,project_head=?,project_description=?,project_content=?,project_class=?,project_address_province=?,project_address_city=?,project_days=?,project_money=? where project_id=?";
		jdbcTemplate.update(sql, project_title, project_head,
				project_description, project_content, project_class,
				project_address_province, project_address_city, project_days,
				project_money, project_id);
	}

	/*
	 * deleteProject
	 */

	public void deleteProject(int project_id) {
		String sql = "delete from project where project_id=?";
		jdbcTemplate.update(sql, project_id);
	}

	/*
	 * postApproval
	 */
	public void postApproval(int project_id) {
		String sql = "update project set project_state='审核中' where project_id=?";
		jdbcTemplate.update(sql, project_id);
	}

	/*
	 * approvalProject
	 */

	public void approvalProject(int project_id) {
		String sql = "update project set project_state='众筹中' where project_id=?";
		jdbcTemplate.update(sql, project_id);
	}

	/*
	 * rejectProject
	 */

	public void rejectProject(int project_id) {
		String sql = "update project set project_state='未通过' where project_id=?";
		jdbcTemplate.update(sql, project_id);
	}

	/*
	 * getProjectById
	 */

	public Project getProjectById(int project_id) {
		String sql1 = "select * from project_view where project_id=?";
		List<Project> projectlist = jdbcTemplate.query(sql1,
				new ProjectRowMapper(), project_id);
		projectlist = returnService.getReturn(projectlist);

		Project project = projectlist.get(0);

		return project;
	}

	/*
	 * getProjectByOwner
	 */
	public List<Project> getProjectByOwner(int project_owner) {
		String sql = "select * from project_view where project_owner_id=?";
		List<Project> projectlist = jdbcTemplate.query(sql,
				new ProjectRowMapper(), project_owner);
		projectlist = returnService.getReturn(projectlist);

		return projectlist;
	}

	/*
	 * getAllProject
	 */
	public List<Project> getAllProject() {
		String sql = "select project_id,project_title,project_head,project_money_recive,project_day_left,project_process from project_view";
		List<Project> projectlist = jdbcTemplate.query(sql,
				new ThumbProjectRowmapper());

		return projectlist;
	}

	/*
	 * getProjectByState
	 */

	public List<Project> getProjectByState(int project_type) {
		String sql = "select project_id,project_title,project_head,project_money_recive,project_day_left,project_process from project_view where project_type=?";
		List<Project> projectlist = jdbcTemplate.query(sql,
				new ThumbProjectRowmapper(), project_type);

		return projectlist;
	}

	/*
	 * getTopProject random
	 */
	public List<Project> getTopProject() {
		String sql = "select project_id,project_title,project_head,project_money_recive,project_day_left,project_process from project_view order by rand() limit 20";
		List<Project> projectlist = jdbcTemplate.query(sql,
				new ThumbProjectRowmapper());

		return projectlist;
	}

	/*
	 * getIndexProjectByClass
	 */

	public List<Project> getIndexProjectByClass(String project_class) {
		String sql = "select project_id,project_title,project_head,project_money_recive,project_day_left,project_process from project_view where project_class=? order by project_money_recive desc limit 5";
		List<Project> projectlist = jdbcTemplate.query(sql,
				new ThumbProjectRowmapper(), project_class);

		return projectlist;
	}

	/*
	 * getSelectPeoject
	 */
	public List<Project> getSelectPeoject(String project_class,
			String project_state, String order_by,int limit) {
		System.out.println(project_class+"  "+project_state+"  "+order_by);
		String sql = "select project_id,project_title,project_head,project_money_recive,project_day_left,project_process from project_view ";
		List<Project> projectlist;

		if (project_class.equals("全部")) {
			if (project_state.equals("全部")) {
				if (order_by.equals("默认排序")) {
					sql = sql + " limit "+ limit+",3";
					projectlist = jdbcTemplate.query(sql,
							new ThumbProjectRowmapper());
				} else {
					sql = sql + "order by "+order_by+" limit " + limit+",3";
					projectlist = jdbcTemplate.query(sql,
							new ThumbProjectRowmapper());
					
				}
			} else {
				if (order_by.equals("默认排序")) {
					sql = sql
							+ "where project_state=? limit " + limit+",3";
					projectlist = jdbcTemplate.query(sql,
							new ThumbProjectRowmapper(), project_state);
				} else {
					sql = sql + "where project_state=? order by "+order_by+" limit " + limit+",3";
					projectlist = jdbcTemplate.query(sql,
							new ThumbProjectRowmapper(), project_state);
				}
			}
		} else {
			if (project_state.equals("全部")) {
				if (order_by.equals("默认排序")) {
System.out.println(project_class);
					sql = sql
							+ "where project_class=? limit "+ limit+",3";
					projectlist = jdbcTemplate.query(sql,
							new ThumbProjectRowmapper(), project_class);
System.out.println(projectlist.size());
				} else {
					sql = sql + "where project_class=? order by "+order_by+" limit " +limit+",3";
					projectlist = jdbcTemplate.query(sql,
							new ThumbProjectRowmapper(), project_class);
				}
			} else {
				if (order_by.equals("默认排序")) {
					sql = sql
							+ "where project_class=? and project_state=? limit " +limit+",3";
					projectlist = jdbcTemplate.query(sql,
							new ThumbProjectRowmapper(), project_class,
							project_state);
				} else {
					sql = sql
							+ "where project_class=? where project_state=? order by "+order_by+" limit " +limit+",3";
					projectlist = jdbcTemplate.query(sql,
							new ThumbProjectRowmapper(), project_class,
							project_state);
				}
			}
		}
		System.out.println(sql);
		return projectlist;
	}

	/*
	 * getSelectProjectCount
	 */
	public int getSelectCount(String project_class, String project_state) {

		String sql = "select count(project_id) from project_view ";
		int count = 0;

		if (project_class.equals("全部")) {
			if (project_state.equals("全部")) {

				count = jdbcTemplate.queryForInt(sql);

			} else {

				sql = sql + "where project_state=?";
				count = jdbcTemplate.queryForInt(sql, project_state);

			}
		} else {
			if (project_state.equals("全部")) {

				sql = sql + "where project_class=?";
				count = jdbcTemplate.queryForInt(sql, project_class);

			} else {

				sql = sql + "where project_class=? and project_state=?";
				count = jdbcTemplate.queryForInt(sql, project_class,
						project_state);

			}
		}
		System.out.println(sql);
		return count;
	}

	
	
	
	
	/*
	 * search
	 */
	public List<Project> search(String project_class,
			String project_state, String order_by,int limit,String key_word) {
		
		key_word = "%" + key_word + "%";
		
		System.out.println(project_class+"  "+project_state+"  "+order_by+"  "+key_word);
		String sql = "select project_id,project_title,project_head,project_money_recive,project_day_left,project_process from project_view ";
		List<Project> projectlist;

			
System.out.println("11111111111111");
			if (project_class.equals("全部")) {
				if (project_state.equals("全部")) {
					if (order_by.equals("默认排序")) {
						sql = sql + "where project_title like ? limit "+ limit+",3";
						projectlist = jdbcTemplate.query(sql,
								new ThumbProjectRowmapper(),key_word);
					} else {
						sql = sql + "where project_title like ?order by "+order_by+" limit " + limit+",3";
						projectlist = jdbcTemplate.query(sql,
								new ThumbProjectRowmapper(),key_word);
						
					}
				} else {System.out.println("2222222222222222222");
					if (order_by.equals("默认排序")) {
						sql = sql
								+ "where project_state=? and project_title like ? limit " + limit+",3";
						projectlist = jdbcTemplate.query(sql,
								new ThumbProjectRowmapper(), project_state,key_word);
					} else {
						sql = sql + "where project_state=? and project_title like ? order by "+order_by+" limit " + limit+",3";
						projectlist = jdbcTemplate.query(sql,
								new ThumbProjectRowmapper(), project_state,key_word);
					}
				}
			} else {System.out.println("33333333333333333333333");
				if (project_state.equals("全部")) {
					if (order_by.equals("默认排序")) {
	System.out.println(project_class);
						sql = sql
								+ "where project_class=? and project_title like ? limit "+ limit+",3";
						projectlist = jdbcTemplate.query(sql,
								new ThumbProjectRowmapper(), project_class,key_word);
	System.out.println(projectlist.size());
					} else {
						sql = sql + "where project_class=? and project_title like ? order by "+order_by+" limit " +limit+",3";
						projectlist = jdbcTemplate.query(sql,
								new ThumbProjectRowmapper(), project_class,key_word);
					}
				} else {System.out.println("44444444444444444444");
					if (order_by.equals("默认排序")) {
						sql = sql
								+ "where project_class=? and project_state=? and project_title like ? limit " +limit+",3";
						projectlist = jdbcTemplate.query(sql,
								new ThumbProjectRowmapper(), project_class,
								project_state,key_word);
					} else {
						sql = sql
								+ "where project_class=? where project_state=? and project_title like ?project_class=? where project_state=? order by order by "+order_by+" limit " +limit+",3";
						projectlist = jdbcTemplate.query(sql,
								new ThumbProjectRowmapper(), project_class,
								project_state,key_word);
					}
				}
			}
		
		
		
		
		
		
		
		
		
		
		System.out.println(sql);
		return projectlist;
	}

	/*
	 * getSearchCount
	 */
	public int getSearchCount(String project_class, String project_state,String key_word) {
		key_word = "%" + key_word + "%";
		String sql = "select count(project_id) from project_view ";
		int count = 0;

		if (project_class.equals("全部")) {
			if (project_state.equals("全部")) {
				sql = sql + "where project_title like ?";
				count = jdbcTemplate.queryForInt(sql,key_word);

			} else {

				sql = sql + "where project_state=? and project_title like ?";
				count = jdbcTemplate.queryForInt(sql, project_state,key_word);

			}
		} else {
			if (project_state.equals("全部")) {

				sql = sql + "where project_class=? and project_title like ?";
				count = jdbcTemplate.queryForInt(sql, project_class,key_word);

			} else {

				sql = sql + "where project_class=? and project_state=? and project_title like ?";
				count = jdbcTemplate.queryForInt(sql, project_class,
						project_state,key_word);

			}
		}
		System.out.println(sql);
		return count;
	}	
	
	
	
	
/*
 * search
 */

	
	public List<Project> search(String key_word) {
		String sql = "select project_id,project_title,project_head,project_money_recive,project_day_left,project_process from project_view where project_title like ?";
		List<Project> projectlist = jdbcTemplate.query(sql, new ThumbProjectRowmapper(),key_word);
		return projectlist;
	}
	
	
	
	
	
	
	
	
	/*
	 * RowMapper
	 */

	private class ProjectRowMapper implements RowMapper<Project> {
		public Project mapRow(ResultSet rs, int rowNum) throws SQLException {

			Project project = new Project();

			project.setProject_id(rs.getInt("project_id"));
			project.setProject_owner_id(rs.getInt("project_owner_id"));
			project.setProject_owner_name(rs.getString("project_owner_name"));
			project.setProject_owner_avatar(rs.getString("project_owner_avatar"));
			project.setProject_title(rs.getString("project_title"));
			project.setProject_head(rs.getString("project_head"));
			project.setProject_class(rs.getString("project_class"));
			project.setProject_description(rs.getString("project_description"));
			project.setProject_money(rs.getInt("project_money"));
			project.setProject_money_recive(rs.getInt("project_money_recive"));
			project.setProject_days(rs.getInt("project_days"));
			project.setProject_address_city(rs
					.getString("project_address_city"));
			project.setProject_address_province(rs
					.getString("project_address_province"));
			project.setProject_process(rs.getFloat("project_process"));
			project.setProject_start(rs.getDate("project_start").toString());
			project.setProject_end(rs.getDate("project_end").toString());

			int day_left = rs.getInt("project_day_left");
			if (day_left < 0) {
				day_left = 0;
			}
			project.setProject_day_left(day_left);
			project.setProject_state(rs.getString("project_state"));

			Blob noteBlob = (Blob) rs.getBlob("project_content");
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
			project.setProject_content(note);

			return project;
		}
	}

	/*
	 * ThumbProjectRowmapper
	 */
	private class ThumbProjectRowmapper implements RowMapper<Project> {
		public Project mapRow(ResultSet rs, int rowNum) throws SQLException {

			Project project = new Project();

			project.setProject_id(rs.getInt("project_id"));
			project.setProject_title(rs.getString("project_title"));
			project.setProject_head(rs.getString("project_head"));
			project.setProject_money_recive(rs.getInt("project_money_recive"));
			project.setProject_process(rs.getFloat("project_process"));
			int day_left = rs.getInt("project_day_left");
			if (day_left < 0) {
				day_left = 0;
			}
			project.setProject_day_left(day_left);

			return project;
		}
	}

}
