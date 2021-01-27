package com.capstone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.entity.Product;
import com.capstone.repository.ProductRepository;

@Service
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public void addProduct(Product product) {
		try {
			productRepository.save(product);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public void updateProduct(Product product) {
		try {
			productRepository.save(product);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public void deleteProduct(long productId) {
		try {
			productRepository.deleteById(productId);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public void getAllProducts() {
		try {
			productRepository.findAll();
		}catch(Exception e) {
			
		}
		
	}

}
