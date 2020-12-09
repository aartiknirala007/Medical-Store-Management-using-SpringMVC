package com.dbms.dao;

import java.util.List;

import com.dbms.model.cart;
import com.dbms.model.order;

public interface Orderdao {

	public cart GetCartbyReception(String name);
	public List<cart> getCartofUser(String name);
	public void deleteCart(String name);
	public void InsertintoCart(cart newcart);
	public cart GetCartbyBatch(String name);
	public int CreateOrder(String name);
	public void updateorder_detail(cart cart,int id);
	public int countmedicine(String name,String name1);
	public cart checkbyname(String name,String name1);
	public cart checkbybatch(String name,String name1);
	public int countbatch(String name,String name1);
	public void CancelOrder(int name,String name1);
	public order GetOrderbyBatch(String name);
	public order getOrderbyOrderId(int id);
	public cart GetCartbyBatch1(String name,String name1);
	public void updateavailable();
	public List<order> getallOrder();
	public List<order> getorderbyquery(String name,String name1,String name2);
	public List<cart> getCartbyOrderId(int name);
}
