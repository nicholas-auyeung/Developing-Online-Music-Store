package com.capstone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.entity.Order;
import com.capstone.repository.OrderRepository;

@Service
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	OrderRepository orderRepository;

	@Override
	public void createOrder(Order order) {
		
		try {
			orderRepository.save(order);
		}catch(Exception e) {
			throw e;
		}
		
	}

}
