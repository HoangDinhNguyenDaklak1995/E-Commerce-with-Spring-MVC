package com.demo.services;

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
}
