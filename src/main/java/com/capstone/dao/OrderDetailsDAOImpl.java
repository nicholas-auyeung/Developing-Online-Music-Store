package com.capstone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.entity.OrderDetails;
import com.capstone.repository.OrderDetailsRepository;

@Service
public class OrderDetailsDAOImpl implements OrderDetailsDAO{
	
	@Autowired
	OrderDetailsRepository orderDetailsRepository;

	@Override
	public void addOrderDetails(OrderDetails orderDetails) {
		
		try {
			orderDetailsRepository.save(orderDetails);
		}catch(Exception e) {
			throw e;
		}
		
	}

}
