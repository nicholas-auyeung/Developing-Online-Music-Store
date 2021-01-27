package com.capstone.dao;

import java.util.List;

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
	public List<Product> getAllProducts() {
		try {
			return (List<Product>) productRepository.findAll();
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public Product getProductDetails(long productId) {
		try {
			return productRepository.findById(productId).get();
		}catch(Exception e) {
			throw e;
		}
	}

}
