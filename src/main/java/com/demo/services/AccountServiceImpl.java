package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Account;
import com.demo.repositories.AccountRepository;

@Service("AccountService")
public class AccountServiceImpl implements AccountService{

	@Autowired
	private AccountRepository accountrepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountrepository.findByUsername(username);
		if(account == null) {
			throw new UsernameNotFoundException("Username not found for " +username);
		}
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		grantedAuthorities.add(new SimpleGrantedAuthority(account.getRole().getName()));
		return new  User(account.getUsername(),account.getPassword(),grantedAuthorities);
	}

	@Override
	public Account findByUsername(String username) {
		return accountrepository.findByUsername(username);
	}

	@Override
	public Account findById(int id) {
		// TODO Auto-generated method stub
		return accountrepository.findById(id).get();
	}

	@Override
	public Account save(Account account) {
		return accountrepository.save(account);
	}
}
