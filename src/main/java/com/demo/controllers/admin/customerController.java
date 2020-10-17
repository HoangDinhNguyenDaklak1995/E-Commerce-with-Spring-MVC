package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.services.AccountService;
import com.demo.services.InvoiceService;

@Controller
@RequestMapping("/admin/customer")
public class customerController {

	@Autowired
	private AccountService accputService;
	
	@Autowired
	private InvoiceService invoiceService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String category(ModelMap modelMap) {
		modelMap.put("customers", accputService.findAllCustomer());
		return "admin.customer.index";
	}
	
	@RequestMapping(value = "invoices/{username}",method = RequestMethod.GET)
	public String invoices(@PathVariable("username") String username,ModelMap modelMap) {
		modelMap.put("invoices", invoiceService.findAllwithOrder(username));
		return "admin.customer.invoices";
	}
}
