package com.dbms.dao;

import java.util.List;


import com.dbms.model.seller;

public interface Sellerdao{
	
	
	public void delete(String username);
	public seller getUser(String username);
	//public seller getCustomer(String username);
	public void saveOrUpdateSeller(seller user);
	public List<seller> getSeller();
	
	
}