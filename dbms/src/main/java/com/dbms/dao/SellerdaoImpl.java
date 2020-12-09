package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class SellerdaoImpl implements Sellerdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SellerdaoImpl() {
		
	}
	public SellerdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	public void delete(String username) {
		String sql = "DELETE FROM USERS WHERE username=?";
		jdbcTemplate.update(sql,username);
	}
	public seller getUser(String regno) {
		String sql = "SELECT * FROM seller WHERE regno='"+regno+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<seller>() {
		
		public seller extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				seller user = new seller();
				user.setRegno(rs.getString("regno"));
				
				return user;
			}
			return null;
		}
		
	});
		
	}
	public void saveOrUpdateSeller(seller user) {
		String sql="INSERT INTO seller VALUES(?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getName(),user.getRegno(),user.getLocation(),user.getPhone_number()});
		
	}
	
	public List<seller> getSeller(){
		String sql= "select * from seller ";
		List<seller> sell= jdbcTemplate.query(sql, new BeanPropertyRowMapper<seller>(seller.class));
		System.out.println(sell);
		return sell;
	}
	
}