package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Invoice;

@Repository("InvoiceRepository")
public interface InvoiceRepository extends CrudRepository<Invoice, Integer> {
	
	@Query("from Invoice where account.username = :username order by id asc")
	public List<Invoice> findAllwithOrder(@Param("username") String username);
	
	@Query("from Invoice  order by id asc")
	public List<Invoice> findAllInvoiceswithOrder();
}
