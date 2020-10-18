package com.demo.services;

import java.util.List;

import com.demo.models.Product;

public interface ProductService {

	public Iterable<Product> findAll();
	
	public Product save(Product product);
	
	public void delete(int id);
	
	public Product find(int id);
	
	public List<Product> latesListProduct(boolean status, int n);
	
	public List<Product> featuredProducts(boolean status, int n, boolean featured);
	
	public List<Product> categoryProducts( boolean status,int categoryId, int id,  int n);
	
	public List<Product> searchAll(boolean status, String keyword);
	
	public List<Product> searchbyCategories(boolean status, String keyword , int categoryId);
	
	public long count();
}
