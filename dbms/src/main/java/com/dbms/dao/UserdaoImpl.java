package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.User;
import com.dbms.model.medicine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class UserdaoImpl implements Userdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UserdaoImpl() {
		
	}
	public UserdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(User user) {
		 String sql = "INSERT INTO USERS(username, password) VALUES (?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getPassword()});
		 sql = "INSERT INTO USERS_ROLES(user,role) VALUES(?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getRole()});
		 saveOrUpdateEmployee(user);
		 //System.out.println("EROOR");
		 System.out.println("EROOR");
	}
	public void delete(String username) {
		String sql = "DELETE FROM USERS WHERE username=?";
		jdbcTemplate.update(sql,username);
	}
	
	public User getUser(String username) {
		String sql = "SELECT * FROM USERS WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
		public User extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				return user;
			}
			return null;
		}
		
	});
		
	}
	public void saveOrUpdateEmployee(User user) {
		String sql="INSERT INTO employee VALUES(?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getName(),user.getAddress(),user.getSalary(),user.getJoining_date(),user.getUsername(),user.getMail()});
		
	}
	
	public User getCustomer(String username) {
		String sql = "SELECT * FROM customer WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
		public User extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				//user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setSalary(rs.getLong("salary"));
				user.setJoining_date(rs.getDate("joining_date"));
				
//				user.setMail(rs.getString("mail"));
				return user;
			}
			return null;
		}
		
	});
		
	}
	public List<User> getEmployee(){
		String sql= "select * from employee ";
		List<User> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
		
		return med; 
	}
	public User getUserinfo(String username) {
		String sql = "SELECT * FROM employee WHERE username='"+username+"'";
		
		List<User> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));

		return med.get(0);
		
	}
	public void updateuser(User user)
	{
		String sql="Update employee set name=?,address=?,salary=?,joining_date=?,mail=? where username=?";
		jdbcTemplate.update(sql,new Object[] {user.getName(),user.getAddress(),user.getSalary(),user.getJoining_date(),user.getMail(),user.getUsername()});
	}
	public String getrole(String username)
	{
		String sql="select role from USERS_ROLES where user='"+username+"'";
		String id=jdbcTemplate.queryForObject(sql,String.class);
		return id;
	}
	
}