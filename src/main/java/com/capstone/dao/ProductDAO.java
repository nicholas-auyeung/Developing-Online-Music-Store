package com.capstone.dao;

import com.capstone.entity.Product;

public interface ProductDAO {
	
	public void addProduct(Product product);
	public void updateProduct(Product product);
	public void deleteProduct(long productId);
	public void getAllProducts();
	
}
