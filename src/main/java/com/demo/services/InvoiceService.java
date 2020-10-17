package com.demo.services;

import java.util.List;

import com.demo.models.Invoice;

public interface InvoiceService {

	public Invoice Save(Invoice invoice);
	
	public List<Invoice> findAllwithOrder(String username);
	
	public Invoice findByid (int id);
	
	public List<Invoice> findAllInvoiceswithOrder();
}
