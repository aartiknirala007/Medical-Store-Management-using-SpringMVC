package com.dbms.model;

import java.util.Date; 
public class User{
	
	private String username;

	private String password;
	
	private String mpassword;
	
	private String name;
	
	private String address;
	
	private Long salary;
	
	private String role;
	
	
	private String mail;
	
	private Date joining_date;
	public User() {
		
	}
	
	public User(String uname,String pass,String mpass,String name,String address,Long salary,String role,String mail, Date joining ) {
		this.username=uname;
		this.password=pass;
		this.mpassword=mpass;
		this.name=name;
		this.address=address;
		this.salary=salary;
		this.role=role;
		
		this.mail=mail;
		this.joining_date=joining;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getSalary() {
		return salary;
	}

	public void setSalary(Long salary) {
		this.salary = salary;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}



	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	


	public User(String uname,String pass) {
		this.username=uname;
		this.password=pass;
		
	}

	public Date getJoining_date() {
		return joining_date;
	}

	public void setJoining_date(Date joining_date) {
		this.joining_date = joining_date;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMpassword() {
		return mpassword;
	}

	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	
	
}