package com.demo.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Invoice;
import com.demo.repositories.InvoiceRepository;

@Transactional
@Service("InvoiceService")
public class InvoiceServiceImpl implements InvoiceService{

	@Autowired
	private InvoiceRepository invoiceRepository;

	@Override
	public Invoice Save(Invoice invoice) {
		return invoiceRepository.save(invoice);
	}

	@Override
	public List<Invoice> findAllwithOrder(String username) {
		return invoiceRepository.findAllwithOrder(username);
	}

	@Override
	public Invoice findByid(int id) {
		return invoiceRepository.findById(id).get();
	}

	@Override
	public List<Invoice> findAllInvoiceswithOrder() {
		return invoiceRepository.findAllInvoiceswithOrder();
	}

	@Override
	public Long countNewInvoices(String status) {
		return invoiceRepository.countNewInvoices(status);
	}
}
