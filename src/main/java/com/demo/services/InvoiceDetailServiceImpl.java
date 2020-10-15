package com.demo.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.InvoiceDetails;
import com.demo.repositories.InvoiceDetailRepository;

@Transactional
@Service("InvoiceDetailService")
public class InvoiceDetailServiceImpl implements InvoiceDetailService{

	@Autowired
	private InvoiceDetailRepository invoiceRepository;

	@Override
	public InvoiceDetails Save(InvoiceDetails invoiceDetails) {
		return invoiceRepository.save(invoiceDetails);
	}
}
