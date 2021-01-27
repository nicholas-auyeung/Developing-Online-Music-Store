package com.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.ProductDAO;
import com.capstone.entity.Product;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDAO productDAO;

	@Override
	public void addProduct(Product product) {
		try {
			productDAO.addProduct(product);
		}catch(Exception e) {
			throw e;
		}
	}

	@Override
	public void updateProduct(Product product) {
		try {
			productDAO.updateProduct(product);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public void deleteProduct(long productId) {
		try {
			productDAO.deleteProduct(productId);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public void getAllProducts() {
		try {
			productDAO.getAllProducts();
		}catch(Exception e) {
			throw e;
		}
		
	}

}
