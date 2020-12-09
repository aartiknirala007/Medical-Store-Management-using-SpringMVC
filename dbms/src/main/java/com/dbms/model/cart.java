package com.dbms.model;


public class cart {
 private String reception;
 
 private String customer;
 
 private String medicine_name;
 
 private String batch_number;
 
 private int quantity;
 
 private String available;

public String getReception() {
	return reception;
}

public void setReception(String reception) {
	this.reception = reception;
}

public String getCustomer() {
	return customer;
}

public void setCustomer(String customer) {
	this.customer = customer;
}

public String getMedicine_name() {
	return medicine_name;
}

public void setMedicine_name(String medicine_name) {
	this.medicine_name = medicine_name;
}

public String getBatch_number() {
	return batch_number;
}

public void setBatch_number(String batch_name) {
	this.batch_number = batch_name;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public String getAvailable() {
	return available;
}

public void setAvailable(String available) {
	this.available = available;
}

public cart(String reception, String customer, String medicine_name, String batch_name, int quantity,
		String available) {
	this.reception = reception;
	this.customer = customer;
	this.medicine_name = medicine_name;
	this.batch_number = batch_name;
	this.quantity = quantity;
	this.available = available;
}
 
 public cart()
 {
	 
 }
 
}
