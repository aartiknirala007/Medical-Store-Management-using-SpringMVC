package com.dbms.model;

import java.sql.Date;

public class order {

	private int order_id;
	
	private String reception;
	
	private String customer_id;
	
	private float amount;
	
	private Date order_date;
	
	private String cancelled;

	public order(int order_id, String reception, String customer_id, float amount, Date order_date, String cancelled) {
		this.order_id = order_id;
		this.reception = reception;
		this.customer_id = customer_id;
		this.amount = amount;
		this.order_date = order_date;
		this.cancelled = cancelled;
	}
	public order()
	{
		
	}
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getReception() {
		return reception;
	}

	public void setReception(String reception) {
		this.reception = reception;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getCancelled() {
		return cancelled;
	}

	public void setCancelled(String cancelled) {
		this.cancelled = cancelled;
	}
	
	
}
