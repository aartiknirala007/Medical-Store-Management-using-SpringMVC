package com.dbms;

import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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

import com.dbms.dao.Medicinedao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.Sellerdao;
import com.dbms.model.seller;
import com.dbms.model.store;
import com.dbms.model.cart;
import com.dbms.model.medicine;
import com.dbms.model.order;

@Controller
@RequestMapping(value = "/inventory")
public class InventoryController {

	@Autowired
	public Sellerdao sellerdao;
	@Autowired
	public Medicinedao medicinedao;
	@Autowired
	public Orderdao orderdao;
	@RequestMapping(value="")
	public String invent(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Welcome to the invetory page");
		
		return "inventory";
	}
	@RequestMapping(value="/newseller" ,method=RequestMethod.GET)
	public String newsell(Model model)
	{
		seller user = new seller();
		model.addAttribute("user",user);
		return "newseller";
		
	}
	
	@RequestMapping(value="/newseller",method=RequestMethod.POST)
	public String registerProcess(@Valid @ModelAttribute("user") seller user,BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "newseller";
		}
		else {
			
			if(sellerdao.getUser(user.getRegno())!=null) {
				model.addAttribute("error", "username exists");
				return "newseller";
			}
			model.addAttribute("user",user);
			sellerdao.saveOrUpdateSeller(user);
			return "seller_success";
		}
	}
	
	@RequestMapping(value="/newmedicine" ,method=RequestMethod.GET)
	public String newmed(Model model)
	{
		medicine user = new medicine();
		model.addAttribute("user",user);
		return "newmedicine";
		
	}
	
	@RequestMapping(value="/newmedicine",method=RequestMethod.POST)
	public String medProcess(@Valid @ModelAttribute("user") medicine user,BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "newmedicine";
		}
		else {
			
			if(medicinedao.getName(user.getName())!=null) {
				model.addAttribute("error", " exists");
				return "newmedicine";
			}
			model.addAttribute("user",user);
			medicinedao.insertMedicine(user);
			return "medicine_success";
		}
	}
	
	@RequestMapping(value="/newstock" ,method=RequestMethod.GET)
	public String newstock(Model model)
	{
		store user = new store();
		model.addAttribute("user",user);
		List<seller> seller = sellerdao.getSeller();
		model.addAttribute("seller",seller);
		List<medicine> medname = medicinedao.getMedicine();
		model.addAttribute("medname",medname);
		return "newstock";
		
	}
	
	@RequestMapping(value="/newstock",method=RequestMethod.POST)
	public String newstocks(@Valid @ModelAttribute("user") store user,BindingResult result,Model model,Principal principal) {
		if(result.hasErrors()) {
			List<seller> seller = sellerdao.getSeller();
			model.addAttribute("seller",seller);
			List<medicine> medname = medicinedao.getMedicine();
			model.addAttribute("medname",medname);
			return "newstock";
		}
		else {
			
			if(medicinedao.getBatch(user.getBatch_number())!=null) {
				model.addAttribute("error", " exists");
				List<seller> seller = sellerdao.getSeller();
				model.addAttribute("seller",seller);
				List<medicine> medname = medicinedao.getMedicine();
				model.addAttribute("medname",medname);
				return "newstock";
			}
			
			Calendar currenttime = Calendar.getInstance();
		    Date sqldate = new Date((currenttime.getTime()).getTime());
		    
		    DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		     

			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDate localDate = LocalDate.now();
			String c=dtf.format(localDate);
//			String d = dtf.format(user.getExpiry());
		    String d = df.format(user.getExpiry());
		    int x = d.compareTo(c);
		    System.out.println(c);
		    System.out.println(d);
		    
			if(x<0)
			{
				model.addAttribute("error", "Expiry Date cannot be in past");
				List<seller> seller = sellerdao.getSeller();
				model.addAttribute("seller",seller);
				List<medicine> medname = medicinedao.getMedicine();
				model.addAttribute("medname",medname);
				return "newstock";
			}
			
			model.addAttribute("user",user);
			medicinedao.insertstock(user,principal);
			return "stock_success";
		}
	}
	@RequestMapping(value="/viewstock",method=RequestMethod.GET)
	public String viewstoc(Model model)
	{
		List<store> viewstock=medicinedao.getallStock();
		model.addAttribute("med",viewstock);
		model.addAttribute("name","");
		return "viewstock";
	}
	
	@RequestMapping(value="/viewstock",method=RequestMethod.POST)
	public String viewstock(@RequestParam("name") String name,Model model)
	{
		List<store> viewstock=medicinedao.getmedbyquery(name);
		model.addAttribute("med",viewstock);
		model.addAttribute("name",name);
		return "viewstock";
	}
	
	@RequestMapping(value="/viewmedicine/{name}")
	public String viewmedicine(@PathVariable("name") String name,Model model)
	{
		List<store> viewstock=medicinedao.getStock(name);
		model.addAttribute("med",viewstock);
		model.addAttribute("name",name);
		return "viewstockres";
	}
	@RequestMapping(value="/updatestock",method=RequestMethod.GET)
	public String updatestock(Model model)
	{
		List<store> batch=medicinedao.getBatch();
		model.addAttribute("batch",batch);
		store store=new store();
		model.addAttribute("store",store);
		return "updatestock";
	}
	
	@RequestMapping(value="/updatestock",method=RequestMethod.POST)
	public String updatestock(@ModelAttribute("batch") store batch,Model model)
	{
		store str=medicinedao.getBatch(batch.getBatch_number());
		if(str.getQuantity()+batch.getQuantity()<0)
		{
			model.addAttribute("error","Value to be decreased cannot be greater than"+str.getQuantity());
			List<store> batc=medicinedao.getBatch();
			model.addAttribute("batch",batc);
			store store=new store();
			model.addAttribute("store",store);
			return "updatestock";
		}
		medicinedao.updatestock(batch);
		
		return "update_success";
	}
	
	@RequestMapping(value="/deletestock",method=RequestMethod.GET)
	public String deletestock(Model model)
	{
		List<store> batch=medicinedao.getBatch();
		model.addAttribute("batch",batch);
		store store=new store();
		model.addAttribute("store",store);
		return "deletestock";
	}
	
	@RequestMapping(value="/deletestock",method=RequestMethod.POST)
	public String deletestock(@ModelAttribute("batch") store batch,Model model)
	{
		order	 c=orderdao.GetOrderbyBatch(batch.getBatch_number());
		if(c==null)
		{
		medicinedao.deletestock(batch.getBatch_number());
		}
		else
		{
		medicinedao.deleteStock(batch.getBatch_number());}
		
		return "delete_success";
	}
	
	@RequestMapping(value="/outofstock",method=RequestMethod.GET)
	public String outofstock(Model model)
	{
		List<store> med = medicinedao.outofstock();
		model.addAttribute("med",med);
		return "outofstock";
	}
	@RequestMapping(value="/delete_expired",method=RequestMethod.GET)
	public String delete_expired(Model model)
	{
		medicinedao.delete_expired();
		
		return "inventory";
	}
	
}
