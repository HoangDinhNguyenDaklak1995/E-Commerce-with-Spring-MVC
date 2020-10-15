package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.models.Account;
import com.demo.services.AccountService;

@Controller
@RequestMapping("admin/account")
public class accountController {
	
	@Autowired
	private AccountService accountservice;
	
	@RequestMapping(value = "profile",method =  RequestMethod.GET)
	public String adminget(Authentication authentication,ModelMap modelMap) {
		modelMap.put("account", accountservice.findByUsername(authentication.getName()));
		return "admin.account.profile";
	}
	
	@RequestMapping(value = "profile",method =  RequestMethod.POST)
	public String adminpost(@ModelAttribute("account") Account account,ModelMap modelMap) {
		Account currentAccount = accountservice.findById(account.getId());
		if(!account.getPassword().isEmpty()) {
			String hash = new BCryptPasswordEncoder().encode(account.getPassword());
			currentAccount.setPassword(hash);
		}
		currentAccount.setUsername(account.getUsername());
		currentAccount.setEmail(account.getEmail());
		currentAccount.setFullName(account.getFullName());
		currentAccount.setPhone(account.getPhone());
		accountservice.save(currentAccount);
		return "redirect:/admin/account/profile";
	}
}
