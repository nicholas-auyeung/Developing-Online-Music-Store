package com.capstone.service;

import java.util.List;

import com.capstone.entity.Product;

public interface ProductService {
	
	public void addProduct(Product product);
	public void updateProduct(Product product);
	public void deleteProduct(long productId);
	public List<Product> getAllProducts();
	public Product getProductDetails(long productId);

}
