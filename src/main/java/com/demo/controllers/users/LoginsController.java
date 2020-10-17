package com.demo.controllers.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Role;
import com.demo.services.AccountService;
import com.demo.services.InvoiceService;

@Controller
@RequestMapping("customer-panel")
public class LoginsController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private InvoiceService invoiceService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String admin() {
		return "redirect:/customer-panel/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String process(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
		if (error != null) {
			modelMap.put("msg", "Invalid username or password");
		}
		if (logout != null) {
			modelMap.put("msg", "Logout Successfully");
		}
		return "customer.login.index";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(ModelMap modelMap) {
		modelMap.put("msg", "Logout successfully");
		return "redirect:/customer-panel/login?logout";
	}

	@RequestMapping(value = "accessDenied", method = RequestMethod.GET)
	public String accessDenined(Authentication authentication, ModelMap modelMap) {
		if (authentication != null) {
			modelMap.put("msg", "Hi " + authentication.getName() + " you do not have permission");
		} else {
			modelMap.put("msg", "You do not have permission to access this page!");
		}
		return "customer.login.accessDenied";
	}

	@RequestMapping(value = "welcome", method = RequestMethod.GET)
	public String welcome() {
		return "redirect:/";
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("customer", new Account());
		return "customer.register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("customer") Account account, ModelMap modelMap) {
		try {
			String hash = new BCryptPasswordEncoder().encode(account.getPassword());
			account.setPassword(hash);
			account.setStatus(true);
			account.setRole(new Role(2));
			accountService.save(account);
			return "redirect:/customer-panel";
		} catch (Exception e) {
			modelMap.put("err", e.getMessage());
			return "customer.register";
		}
	}

	@RequestMapping(value = "dashboard", method = RequestMethod.GET)
	public String dashboard(Authentication authentication, ModelMap map) {
		map.put("customer", accountService.findByUsername(authentication.getName()));
		return "customer.login.dashboard";
	}

	@RequestMapping(value = "dashboard", method = RequestMethod.POST)
	public String dashboard(@ModelAttribute("customer") Account account, ModelMap modelMap) {
		try {
			Account currentAccount = accountService.findById(account.getId());
			if (!account.getPassword().isEmpty()) {
				String hash = new BCryptPasswordEncoder().encode(account.getPassword());
				currentAccount.setPassword(hash);
			}
			currentAccount.setAddress(account.getAddress());
			currentAccount.setEmail(account.getEmail());
			currentAccount.setFullName(account.getFullName());
			currentAccount.setPhone(account.getPhone());
			accountService.save(currentAccount);
			return "redirect:/customer-panel/dashboard";
		} catch (Exception e) {
			modelMap.put("err", e.getMessage());
			return "customer.login.dashboard";
		}
	}

	@RequestMapping(value = "history", method = RequestMethod.GET)
	public String history(Authentication authentication, ModelMap modelMap) {
		modelMap.put("invoices", invoiceService.findAllwithOrder(authentication.getName()));
		return "customer.login.history";
	}
	
	@RequestMapping(value = "invoice_details/{id}", method = RequestMethod.GET)
	public String invoice_details(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("invoice", invoiceService.findByid(id));
		return "customer.login.invoice_details";
	}
}
