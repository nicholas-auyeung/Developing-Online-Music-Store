package com.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.OrderDAO;
import com.capstone.entity.Order;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public void createOrder(Order order) {
		try {
			orderDAO.createOrder(order);
		}catch(Exception e) {
			
		}
		
	}

}
