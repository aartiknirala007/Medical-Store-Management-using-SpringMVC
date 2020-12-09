package com.dbms.dao;

import java.util.List;

//import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.User;

public interface Userdao{
	
	public void saveOrUpdate(User user);
	public void delete(String username);
	public User getUser(String username);
	public User getCustomer(String username);
	public void saveOrUpdateEmployee(User user);
	public List<User> getEmployee();
	public User getUserinfo(String username);
	public void updateuser(User user);
	public String getrole(String username);
	
	
}