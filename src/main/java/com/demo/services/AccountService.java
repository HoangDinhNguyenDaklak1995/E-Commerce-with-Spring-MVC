package com.demo.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Account;

public interface AccountService extends UserDetailsService {

	public Account findByUsername(String username);
	
	public Account findById(int id);
	
	public Account save(Account account);
	
	public List<Account> findAllCustomer();
}
