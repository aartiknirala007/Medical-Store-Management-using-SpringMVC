package com.dbms.dao;

import java.util.List;

import com.dbms.model.customer;

public interface Customerdao {

public customer getCustomer(String cust_id);
public void InsertCustomer(customer cust);
public List<customer> GetAllCustomer();

}
