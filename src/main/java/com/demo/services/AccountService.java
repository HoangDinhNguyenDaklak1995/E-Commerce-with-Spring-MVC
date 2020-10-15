package com.demo.services;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Account;

public interface AccountService extends UserDetailsService {

	public Account findByUsername(String username);
	
	public Account findById(int id);
	
	public Account save(Account account);
}
