package com.demo.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Product;
import com.demo.repositories.ProductsRepository;

@Transactional
@Service("productService")
public class ProductRepositoryImpl implements ProductService {

	@Autowired
	private ProductsRepository productRepository;
	
	@Override
	public Iterable<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}

	@Override
	public void delete(int id) {
		 productRepository.deleteById(id);
	}

	@Override
	public Product find(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public List<Product> latesListProduct(boolean status, int n) {
		return productRepository.latesListProduct(status, n);
	}

	@Override
	public List<Product> featuredProducts(boolean status, int n, boolean featured) {
		return productRepository.featuredProducts(status, n, featured);
	}

	@Override
	public List<Product> categoryProducts(boolean status, int categoryId, int id, int n) {
		return productRepository.categoryProducts(status, categoryId, id, n);
	}

	@Override
	public List<Product> searchAll(boolean status, String keyword) {
		return productRepository.searchAll(status, keyword);
	}

	@Override
	public List<Product> searchbyCategories(boolean status, String keyword, int categoryId) {
		return productRepository.searchbyCategories(status, keyword, categoryId);
	}

	@Override
	public long count() {
		return productRepository.count();
	}
}
