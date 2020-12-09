package com.dbms;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbms.dao.Userdao;
import com.dbms.model.User;

@Controller
public class LoginController {

	@Autowired
	public Userdao userdao;
	
	@RequestMapping(value = "")
	public String welcome(Model model) {
		model.addAttribute("name", "Home Page");
		model.addAttribute("description", "unsecured page !");
		return "home";

	}

	@RequestMapping(value = "/")
	public String welcome1(Model model) {
		model.addAttribute("name", "Home Page");
		model.addAttribute("description", "unsecured page !");
		return "home";

	}

	
	@RequestMapping("/user")
	public String user(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Spring Security USER Custom Login Demo");
		model.addAttribute("description", "Protected page for user !");
		return "user";
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {

		return "login";

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {

		model.addAttribute("message",
				"You have successfully logged off from application !");
		return "logout";

	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";

	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(Model model) {
		
		User user = new User();
		model.addAttribute("user", user);

		return "register";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerProcess(@Valid @ModelAttribute("user") User user,BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "register";
		}
		else {
			if(!user.getPassword().equals(user.getMpassword())) {
				model.addAttribute("error","passwords dont match");
				return "register";
			}
			if(userdao.getUser(user.getUsername())!=null) {
				model.addAttribute("error", "username exists");
				return "register";
			}
			userdao.saveOrUpdate(user);
			return "home";
		}
	}
	
	@RequestMapping(value="/user/products")
	public String checker(Model model,Principal principal) {
		String user = principal.getName();
		model.addAttribute("user",user);
		model.addAttribute("product","product");
		return "product";
	}
	
	@RequestMapping(value="/admin/view")
	public String admin_check(Model model) {
		
		model.addAttribute("user","hi this works");
		
		return "admin123";
	}
	@RequestMapping(value = "/update_profile", method = RequestMethod.GET)
	public String navbar(Model model,Principal principal) {
		if(principal!=null) {
		User user=userdao.getUserinfo(principal.getName());
		model.addAttribute("username",principal.getName());
		model.addAttribute("user",user);
		System.out.println(user.getMail());
		return "update_profile";}
		return "home";
	}
	
	@RequestMapping(value = "/update_profile", method = RequestMethod.POST)
	public String updat(Model model,@ModelAttribute("user") User user) {
		userdao.updateuser(user);
		String s=userdao.getrole(user.getUsername());
		if(s.equals("ROLE_RECEPTION"))
		{
			return "reception";
		}
		if(s.equals("ROLE_INVENTORY"))
		{
			return "inventory";
		}
		return "home";
	}
	
}
