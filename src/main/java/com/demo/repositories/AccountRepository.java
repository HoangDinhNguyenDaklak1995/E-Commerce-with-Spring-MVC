package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;

@Repository("AccountRepository")
public interface AccountRepository extends CrudRepository<Account, Integer> {

	public Account findByUsername(String username);
	
	@Query("from Account where role.id = :roleId")
	public List<Account> findAllCustomer(@Param("roleId") int roleId);
}
