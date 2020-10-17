package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.models.Invoice;
import com.demo.services.InvoiceService;

@Controller
@RequestMapping("/admin/invoices")
public class InvoicesAdminController {

	@Autowired
	private InvoiceService invoiceService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String category(ModelMap modelMap) {
		modelMap.put("invoices", invoiceService.findAllInvoiceswithOrder());
		return "admin.invoices.index";
	}
	
	@RequestMapping(value = "details/{id}",method = RequestMethod.GET)
	public String details(@PathVariable("id") int id,ModelMap modelMap) {
		modelMap.put("invoice", invoiceService.findByid(id));
		return "admin.invoices.details";
	}
	
	@RequestMapping(value = "update/{id}",method = RequestMethod.GET)
	public String Update(@PathVariable("id") int id,ModelMap modelMap) {
		Invoice invoice = invoiceService.findByid(id);
		invoice.setStatus("Done");
		invoiceService.Save(invoice);
		return "redirect:/admin/invoices";
	}
}
