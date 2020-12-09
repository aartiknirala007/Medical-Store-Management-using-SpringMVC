package com.dbms.dao;

import java.security.Principal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.medicine;
import com.dbms.model.store;

public class MedicinedaoImpl implements Medicinedao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public MedicinedaoImpl() {
		
	}
	public MedicinedaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	public void delete(String username) {
		String sql = "DELETE FROM medicine WHERE name=?";
		jdbcTemplate.update(sql,username);
	}
	public medicine getName(String name) {
		String sql = "SELECT * FROM medicine WHERE name='"+name+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<medicine>() {
		
		public medicine extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				medicine user = new medicine();
				user.setName(rs.getString("name"));
				
				return user;
			}
			return null;
		}
		
	});
		
	}
	public void insertMedicine(medicine user) {
		String sql="INSERT INTO medicine VALUES(?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getName(),user.getCompany(),user.getDetail()});
		
	}
	public store getBatch(String batch)
	{
		String sql = "SELECT * FROM stock WHERE batch_number='"+batch+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<store>() {
		
		public store extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				store user = new store();
				user.setBatch_number(rs.getString("batch_number"));
				user.setQuantity(rs.getInt("quantity"));
				
				return user;
			}
			return null;
		}
		
	});
	}
	public void insertstock(store user,Principal principal)
	{
		String sql="INSERT INTO stock VALUES(?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getBatch_number(),user.getExpiry(),user.getQuantity(),user.getPrice(),user.getName(),user.getSeller_reg(),principal.getName(),user.getCost()});
	}
	
	public List<medicine> getMedicine(){
		String sql= "select * from medicine ";
		List<medicine> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<medicine>(medicine.class));
		System.out.println(med);
		return med; 
	}
	
	public List<store> getStock(String name){
		String sql= "select * from stock where name='"+name+"' and quantity <> 0 order by expiry";
		List<store> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<store>(store.class));
		return med; 
	}
	@Override
	public List<store> getallStock() {
		String sql= "select distinct name from stock where quantity <> 0 ";
		List<store> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<store>(store.class));
		return med;
	}
	
	public List<store> getmedbyquery(String name){
		String sql= "select distinct name from stock where name like '%"+name+"%' and quantity <> 0";
		List<store> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<store>(store.class));
		return med; 
	}
	
	public List<store> getBatch(){
		String sql= "select * from stock where quantity <> 0";
		List<store> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<store>(store.class));
		
		return med; 
	}
	public void updatestock(store batch)
	{
		String sql= "update stock set quantity=quantity+"+batch.getQuantity()+" where batch_number='"+batch.getBatch_number()+"'";
		jdbcTemplate.update(sql);
	}
	
	public void deletestock(String batch)
	{
		String sql= "delete from stock where batch_number='"+batch+"'";
		jdbcTemplate.update(sql);
	}
	public int countmedicine(String name)
	{
		String sql="select sum(quantity) from stock where name='"+name+"'";
		int count=jdbcTemplate.queryForObject(sql,Integer.class);
		return count;
	}
	public void updateorder(String batch,int q)
	{
		String sql="update stock set quantity=quantity-"+q+" where batch_number='"+batch+"'";
		jdbcTemplate.update(sql);
		
	}
	public List<store> outofstock()
	{
		String sql ="Select * from stock where expiry<CURDATE() and quantity>0";
		List<store> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<store>(store.class));
		return med;
		
	}
	public void delete_expired()
	{
		String sql="Update stock set quantity=0 where expiry<CURDATE()";
		jdbcTemplate.update(sql);
	}
	public void deleteStock(String batch)
	{
		String sql="Update stock set quantity=0 where batch_number='"+batch+"'";
		jdbcTemplate.update(sql);
	}
}
