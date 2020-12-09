package com.dbms.dao;

import java.security.Principal;
import java.util.List;

import com.dbms.model.medicine;
import com.dbms.model.store;

public interface Medicinedao {

	public void delete(String username);
	public medicine getName(String username);
	//public seller getCustomer(String username);
	public void insertMedicine(medicine user);
	public store getBatch(String username);
	public void insertstock(store user,Principal principal);
	public List<medicine> getMedicine();
	public List<store> getStock(String name);
	public List<store> getmedbyquery(String name);
	public List<store> getallStock();
	public List<store> getBatch();
	public void updatestock(store batch);
	public void deletestock(String batch);
	public int countmedicine(String name);
	public void updateorder(String batch,int q);
	public List<store> outofstock();
	public void delete_expired();
	public void deleteStock(String batch);
}
