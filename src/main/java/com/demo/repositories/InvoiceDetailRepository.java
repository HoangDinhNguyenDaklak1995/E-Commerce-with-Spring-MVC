package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.models.InvoiceDetails;
import com.demo.models.InvoiceDetailsId;

@Repository("InvoiceDetailRepository")
public interface InvoiceDetailRepository extends CrudRepository<InvoiceDetails, InvoiceDetailsId> {
}
