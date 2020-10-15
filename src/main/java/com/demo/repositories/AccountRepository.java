package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;

@Repository("AccountRepository")
public interface AccountRepository extends CrudRepository<Account, Integer> {

	public Account findByUsername(String username);
}
