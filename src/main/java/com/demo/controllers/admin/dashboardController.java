package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.services.InvoiceService;
import com.demo.services.ProductService;

@Controller
@RequestMapping("admin/dardboard")
public class dashboardController {
	
	@Autowired
	private InvoiceService invoiceService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(method =  RequestMethod.GET)
	public String admin(ModelMap modelMap) {
		modelMap.put("invoice", invoiceService.countNewInvoices("Pending"));
		modelMap.put("products", productService.count());
		return "admin.index";
	}
}
