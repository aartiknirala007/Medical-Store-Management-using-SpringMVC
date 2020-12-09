package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.catalina.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.cart;
import com.dbms.model.customer;
import com.dbms.model.order;
import com.dbms.model.store;

public class OrderdaoImpl implements Orderdao {

	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	Medicinedao medicinedao;
	
	public cart GetCartbyReception(String name)
	{
		String sql = "SELECT * FROM cart WHERE reception='"+name+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<cart>() {
		
		public cart extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				cart user = new cart();
				user.setReception(rs.getString("reception"));
				user.setCustomer(rs.getString("customer"));
				
				return user;
			}
			return null;
		}
		
	});
	}
	public cart GetCartbyBatch(String name)
	{
		String sql = "SELECT * FROM cart WHERE batch_number='"+name+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<cart>() {
		
		public cart extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				cart user = new cart();
				user.setReception(rs.getString("reception"));
				user.setCustomer(rs.getString("customer"));
				
				return user;
			}
			return null;
		}
		
	});
	}
	public cart GetCartbyBatch1(String name,String name1)
	{
		System.out.println(name+name1);
		String sql = "SELECT * FROM cart WHERE batch_number='"+name+"' and  reception='"+name1+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<cart>() {
		
		public cart extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				cart user = new cart();
				user.setReception(rs.getString("reception"));
				user.setCustomer(rs.getString("customer"));
				
				return user;
			}
			return null;
		}
		
	});
	}
	
	public List<cart> getCartofUser(String name)
	{
		String sql= "select * from cart where reception='"+name+"'";
		List<cart> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<cart>(cart.class));
		return med;
	}
	
	public void deleteCart(String name)
	{
		String sql="delete from cart where reception='"+name+"'";
		jdbcTemplate.update(sql);
	}
	
	public void InsertintoCart(cart newcart)
	{
		
		List<store> stock=medicinedao.getStock(newcart.getMedicine_name());
		int i=0,c;
		while(newcart.getQuantity()>0)
		{
			store store1= stock.get(i);
			int d=store1.getQuantity();
			if(checkbybatch(store1.getBatch_number(),newcart.getReception())!=null)
			{
				int e=countbatch(store1.getBatch_number(),newcart.getReception());
				d=d-e;
			}
			if(d>newcart.getQuantity())
			{
				c=newcart.getQuantity();
				newcart.setQuantity(0);
			}
			else
			{
				c=d;
				newcart.setQuantity(newcart.getQuantity()-c);
			}
			System.out.println(newcart.getReception());
			if(GetCartbyBatch1(store1.getBatch_number(),newcart.getReception())==null) {
			String sql="insert into cart values(?,?,?,?,?,?)" ;
			jdbcTemplate.update(sql,new Object[] {newcart.getReception(),newcart.getCustomer(),newcart.getMedicine_name(),store1.getBatch_number(),c,"yes"});}
			else
			{
				String sql="update cart set quantity=quantity+"+c+ " where batch_number='"+store1.getBatch_number()+"'";
				jdbcTemplate.update(sql);
			}
			i++;
		}
	}
	
	public void updateorder_detail(cart cart,int id)
	{
		String sql="INSERT INTO order_detail VALUES(?,?,?)";
		jdbcTemplate.update(sql,new Object[] {id,cart.getBatch_number(),cart.getQuantity()});
		
	}
	
	public int CreateOrder(String name)
	{
		updateavailable();
		List<cart> usercart=getCartofUser(name);
		int c=usercart.size();
		int count=0;
		while(c!=0)
		{
			c--;
			cart cart1=usercart.get(c);
			if(cart1.getAvailable().equals("no")) {
				String sql3="delete from cart where reception='"+name+"'";
				jdbcTemplate.update(sql3);
				count++;}
				
		}
		if(count==usercart.size()) {
			return 0;}
		String sql="select sum(cart.quantity*price) from cart,stock where cart.batch_number=stock.batch_number and reception='"+name+"' and cart.available='yes'";
		int amount=jdbcTemplate.queryForObject(sql,Integer.class);
		cart sample=usercart.get(0);
		String sql1="insert into orders(customer_id,reception,amount,order_date) values(?,?,?,CURDATE())";
		jdbcTemplate.update(sql1,new Object[] {sample.getCustomer(),sample.getReception(),amount});
		String sql2="select max(order_id) from orders where reception='"+name+"'";
		int id=jdbcTemplate.queryForObject(sql2,Integer.class);
		int i=usercart.size();
		System.out.println(i);
		while(i!=0)
		{
			
			i--;
			cart cart1=usercart.get(i);
			System.out.println(cart1.getAvailable());
			if(cart1.getAvailable().equals("yes")) {
			medicinedao.updateorder(cart1.getBatch_number(),cart1.getQuantity());
			updateorder_detail(cart1,id);
			System.out.println("Ek baar dekho");
			}
			
		}
		String sql3="delete from cart where reception='"+name+"'";
		jdbcTemplate.update(sql3);
		updateavailable();
		return id;
	}
	
	public int countmedicine(String name,String name1)
	{
		String sql="select sum(quantity) from cart where medicine_name='"+name+"' and reception='"+name1+"'";		
		int count=jdbcTemplate.queryForObject(sql,Integer.class);
		return count;
	}
	public cart checkbyname(String name,String name1)
	{
		String sql = "SELECT * FROM cart WHERE reception='"+name1+"' and medicine_name='"+name+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<cart>() {
		
		public cart extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				cart user = new cart();
				user.setReception(rs.getString("reception"));
				
				
				return user;
			}
			return null;
		}
		
	});
	}
	
	public int countbatch(String name,String name1)
	{
		String sql="select sum(quantity) from cart where batch_number='"+name+"' and reception='"+name1+"'";		
		int count=jdbcTemplate.queryForObject(sql,Integer.class);
		return count;
	}
	public cart checkbybatch(String name,String name1)
	{
		String sql = "SELECT * FROM cart WHERE reception='"+name1+"' and batch_number='"+name+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<cart>() {
		
		public cart extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				cart user = new cart();
				user.setReception(rs.getString("reception"));
				
				
				return user;
			}
			return null;
		}
		
	});
	}
	public void updateavailable()
	{
		
		String sql="update cart set available='no' where batch_number in (select cart1.batch_number from (select * from cart) as cart1,stock where cart1.batch_number=stock.batch_number and stock.quantity<cart1.quantity);" ;
		jdbcTemplate.update(sql);
				
	}
	public void CancelOrder(int name,String name1)
	{
		String sql="update orders set cancelled='yes' where order_id="+name;
		jdbcTemplate.update(sql);
		
		String sql1="insert into cancellation values(?,?,CURDATE())";
		jdbcTemplate.update(sql1,new Object[] {name,name1});
	}
	
	
	public order GetOrderbyBatch(String name)
	{
		String sql = "SELECT * FROM order_detail WHERE batch_number='"+name+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<order>() {
		
		public order extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				order user = new order();
				user.setOrder_id(rs.getInt("order_id"));
				
				
				return user;
			}
			return null;
		}
		
	});
	}
	public order getOrderbyOrderId(int id)
	{
		String sql = "SELECT * FROM orders WHERE order_id="+id+" and cancelled = 'no'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<order>() {
		
		public order extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				order user = new order();
				user.setOrder_id(rs.getInt("order_id"));
				user.setCustomer_id(rs.getString("customer_id"));
				user.setAmount(rs.getFloat("amount"));
				user.setOrder_date(rs.getDate("order_date"));
				return user;
			}
			return null;
		}
		
	});
	}
	
	public List<order> getallOrder()
	{
		String sql= "select * from orders";
		List<order> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<order>(order.class));
		return med;
	}
	public List<order> getorderbyquery(String name,String name1,String name2)
	{
		String sql= "select * from orders where order_id like '%"+name+"%' and customer_id like '%"+name1+"%' and reception like '%"+name2+"%'";
		List<order> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<order>(order.class));
		return med;
	}
	public List<cart> getCartbyOrderId(int name)
	{
		String sql= "select * from order_detail where order_id = "+name;
		List<cart> med= jdbcTemplate.query(sql, new BeanPropertyRowMapper<cart>(cart.class));
		return med;
	}
	
}
