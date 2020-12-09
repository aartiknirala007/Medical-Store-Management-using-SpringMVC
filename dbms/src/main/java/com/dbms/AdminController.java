package com.dbms;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbms.dao.Userdao;
import com.dbms.model.User;
import com.dbms.model.store;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	public Userdao userdao;
	
	@RequestMapping(value="")
	public String admin(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Spring Security Custom Login Demo");
		model.addAttribute("description", "Protected page !");
		return "admin";
	}
	@RequestMapping(value= "/newemployee" ,method=RequestMethod.GET)
	public String newrep(Model model)
	{
		User user = new User();
		model.addAttribute("user", user);

		
		return "addreception";
	}
	@RequestMapping(value="/newemployee",method=RequestMethod.POST)
	public String registerProcess(@Valid @ModelAttribute("user") User user,BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "addreception";
		}
		else {
			if(!user.getPassword().equals(user.getMpassword())) {
				model.addAttribute("error","passwords dont match");
				return "addreception";
			}
			if(userdao.getUser(user.getUsername())!=null) {
				model.addAttribute("error", "username exists");
				return "addreception";
			}
			model.addAttribute("user",user);
			userdao.saveOrUpdate(user);
			return "registration_success";
		}
	}
	@RequestMapping(value="/viewemployee")
	public String viewemployee(Model model)
	{
		List<User> employee=userdao.getEmployee();
		model.addAttribute("employee",employee);
		return "viewemployee";
	}
}
