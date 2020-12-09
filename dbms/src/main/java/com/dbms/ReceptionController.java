package com.dbms;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dbms.dao.Customerdao;
import com.dbms.dao.Medicinedao;
import com.dbms.dao.Orderdao;
import com.dbms.model.cart;
import com.dbms.model.customer;
import com.dbms.model.seller;
import com.dbms.model.store;
import com.dbms.model.order;

@Controller
@RequestMapping(value = "/reception")
public class ReceptionController {
	
	@Autowired
	public Customerdao customerdao;
	
	@Autowired
	public Orderdao orderdao;
	
	@Autowired
	public Medicinedao medicinedao;
	
	
	@RequestMapping(value="")
	public String reception(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Welcome to the invetory page");
		return "reception";
	}
	@RequestMapping(value="/newcustomer" ,method=RequestMethod.GET)
	public String newsell(Model model)
	{
		customer user = new customer();
		model.addAttribute("user",user);
		return "newcustomer";
		
	}
	
	@RequestMapping(value="/newcustomer",method=RequestMethod.POST)
	public String registerProcess(@Valid @ModelAttribute("user") customer user,BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "newcustomer";
		}
		else {
			
			if(customerdao.getCustomer(user.getCustomer_id())!=null) {
				model.addAttribute("error", "A customer with same customer Id exists");
				return "newcustomer";
			}
			model.addAttribute("user",user);
			customerdao.InsertCustomer(user);
			return "customer_success";
		}
	}
	@RequestMapping(value="/neworder",method=RequestMethod.GET)
	public String neworder(Model model,Principal principal)
	{
		cart user=orderdao.GetCartbyReception(principal.getName());
		List<store> medicine=medicinedao.getallStock();
		model.addAttribute("medicine",medicine);
		
		if(user==null)
		{
			List<customer> customer=customerdao.GetAllCustomer();
			model.addAttribute("customer",customer);
			cart cart=new cart();
			model.addAttribute("cart",cart);
			
			return "neworder";
		}
		model.addAttribute("customer",user.getCustomer());
		cart cart1=new cart();
		model.addAttribute("cart1",cart1);
		List<cart> cart=orderdao.getCartofUser(principal.getName());
		model.addAttribute("cartofuser",cart);
		return "neworder_with_cart";
	}
	
	@RequestMapping(value="/neworder",method=RequestMethod.POST)
	public String neworder1(@Valid @ModelAttribute("cart") cart newcart,BindingResult result,Model model,Principal principal)
	{
		orderdao.updateavailable();
		int c=medicinedao.countmedicine(newcart.getMedicine_name());
		if(orderdao.checkbyname(newcart.getMedicine_name(),principal.getName())!=null) {
		int d=orderdao.countmedicine(newcart.getMedicine_name(),principal.getName());
		c=c-d;}
		cart user=orderdao.GetCartbyReception(principal.getName());
		List<store> medicine=medicinedao.getallStock();
		model.addAttribute("medicine",medicine);
		
		if(c<newcart.getQuantity())
		{
			if(c<0) {
				c=0;}
			model.addAttribute("error","Max orderable quantity is "+c);
			if(user==null)
			{
				List<customer> customer=customerdao.GetAllCustomer();
				model.addAttribute("customer",customer);
				cart cart=new cart();
				model.addAttribute("cart",cart);
				
				return "neworder";
			}
			model.addAttribute("customer",user.getCustomer());
			cart cart1=new cart();
			model.addAttribute("cart1",cart1);
			List<cart> cart=orderdao.getCartofUser(principal.getName());
			model.addAttribute("cartofuser",cart);
			return "neworder_with_cart";
				
			
		}
		newcart.setReception(principal.getName());
		orderdao.InsertintoCart(newcart);
		model.addAttribute("customer",newcart.getCustomer());
		cart cart1=new cart();
		model.addAttribute("cart1",cart1);
		List<cart> cart=orderdao.getCartofUser(principal.getName());
		model.addAttribute("cartofuser",cart);
		return "neworder_with_cart";
	}
	
	@RequestMapping(value="/delete_cart")
	public String deletecart(Model model,Principal principal)
	{
		orderdao.deleteCart(principal.getName());
		List<store> medicine=medicinedao.getallStock();
		model.addAttribute("medicine",medicine);
		List<customer> customer=customerdao.GetAllCustomer();
		model.addAttribute("customer",customer);
		cart cart=new cart();
		model.addAttribute("cart",cart);
		
		return "neworder";
	}
	
	@RequestMapping(value="/order")
	public String order(Model model,Principal principal)
	{
		int name=orderdao.CreateOrder(principal.getName());
		if(name!=0) {
		List<cart> viewstock=orderdao.getCartbyOrderId(name);
		order user=orderdao.getOrderbyOrderId(name);
		model.addAttribute("user",user);
		model.addAttribute("med",viewstock);
		return "vieworderres";}
		return "reception";
	}
	@RequestMapping(value="/cancel_order",method=RequestMethod.GET)
	public String cancel(Model model)
	{
		
		return "cancel_order";
	}
	@RequestMapping(value="/cancel_order",method=RequestMethod.POST)
	public String cancel_order(@RequestParam("name") int name,Model model,Principal principal)
	{
		order c=orderdao.getOrderbyOrderId(name);
		if(c==null)
		{
			model.addAttribute("error","No such Order Id exist or order is already cancelled");
			return "cancel_order";
		}
		
		orderdao.CancelOrder(name,principal.getName());
		return "cancel_success";
	}
	@RequestMapping(value="/vieworder",method=RequestMethod.GET)
	public String viewstoc(Model model)
	{
		List<order> viewstock=orderdao.getallOrder();
		model.addAttribute("med",viewstock);
		model.addAttribute("name","");
		return "vieworder";
	}
	
	@RequestMapping(value="/vieworder",method=RequestMethod.POST)
	public String viewstock(@RequestParam("name") String name,@RequestParam("name1") String name1,@RequestParam("name2") String name2,Model model)
	{
		List<order> viewstock=orderdao.getorderbyquery(name,name1,name2);
		model.addAttribute("med",viewstock);
		model.addAttribute("name",name);
		return "vieworder";
	}
	@RequestMapping(value="/vieworder/{name}")
	public String viewmedicine(@PathVariable("name") int name,Model model)
	{
		List<cart> viewstock=orderdao.getCartbyOrderId(name);
		order user=orderdao.getOrderbyOrderId(name);
		model.addAttribute("user",user);
		model.addAttribute("med",viewstock);
		
		return "vieworderres";
	}
}
