package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.customer;
import com.dbms.model.store;

public class CustomerdaoImpl implements Customerdao {

	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public CustomerdaoImpl() {
		
	}
	public CustomerdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	public customer getCustomer(String cust_id)
	{
		String sql = "SELECT * FROM customer WHERE customer_id='"+cust_id+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<customer>() {
		
		public customer extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				customer user = new customer();
				user.setName(rs.getString("name"));
				user.setCustomer_id(rs.getString("customer_id"));
				
				return user;
			}
			return null;
		}
		
	});
	}
	
	public void InsertCustomer(customer cust)
	{
			String sql="INSERT INTO customer VALUES(?,?,?,?,?,?)";
			jdbcTemplate.update(sql,new Object[] {cust.getCustomer_id(),cust.getName(),cust.getDob(),cust.getAddress(),cust.getPhone(),cust.getDetail()});
			
	}
	
	public List<customer> GetAllCustomer()
	{
		String sql="select * from customer";
		List<customer> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<customer>(customer.class));
		return med;
	}
}
