package com.dbms.model;

import java.sql.Date;


public class store {
private  String batch_number;
private Date expiry;
private int quantity;
private float price;
private String name;
private String seller_reg;
private String manager;
private float cost;





public store() {
	
}



public store(String batch_number, Date expiry, int quantity, float price, String name, String seller_reg, String manager,
		 float cost) {
	this.batch_number = batch_number;
	this.expiry = expiry;
	this.quantity = quantity;
	this.price = price;
	this.name = name;
	this.seller_reg = seller_reg;
	this.manager = manager;
	this.cost = cost;
}



public String getManager() {
	return manager;
}

public void setManager(String manager) {
	this.manager = manager;
}

public String getBatch_number() {
	return batch_number;
}

public void setBatch_number(String batch_number) {
	this.batch_number = batch_number;
}

public Date getExpiry() {
	return expiry;
}

public void setExpiry(Date expiry) {
	this.expiry = expiry;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public float getPrice() {
	return price;
}

public void setPrice(float price) {
	this.price = price;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getSeller_reg() {
	return seller_reg;
}

public void setSeller_reg(String seller_reg) {
	this.seller_reg = seller_reg;
}



public float getCost() {
	return cost;
}

public void setCost(float cost) {
	this.cost = cost;
}

}
