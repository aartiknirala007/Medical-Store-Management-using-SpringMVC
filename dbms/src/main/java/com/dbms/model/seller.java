package com.dbms.model;


public class seller {
	private String name;
	private String regno;
	
	private String location;
	
	private long phone_number;
	
	
	


public seller () {
	
}

public seller (String name,String reg,String location,long phone)
{
	this.name=name;
	this.regno=reg;
	this.location=location;
	this.phone_number=phone;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getRegno() {
	return regno;
}

public void setRegno(String regno) {
	this.regno = regno;
}

public String getLocation() {
	return location;
}

public void setLocation(String location) {
	this.location = location;
}

public long getPhone_number() {
	return phone_number;
}

public void setPhone_number(long phone_number) {
	this.phone_number = phone_number;
}
}