package com.dbms.model;

import java.sql.Date;

import javax.validation.constraints.NotNull;
public class customer {
private String customer_id;

private String name;

private String type;

private Date dob;

private String address;

private long phone;

private String detail;

public customer()
{
	
}

public customer(String customer_id, String name, String type, Date dob, String address, long phone, String detail) {
	this.customer_id = customer_id;
	this.name = name;
	this.type = type;
	this.dob = dob;
	this.address = address;
	this.phone = phone;
	this.detail = detail;
}

public String getCustomer_id() {
	return customer_id;
}

public void setCustomer_id(String customer_id) {
	this.customer_id = customer_id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public Date getDob() {
	return dob;
}

public void setDob(Date dob) {
	this.dob = dob;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public long getPhone() {
	return phone;
}

public void setPhone(long phone) {
	this.phone = phone;
}

public String getDetail() {
	return detail;
}

public void setDetail(String detail) {
	this.detail = detail;
}

}
