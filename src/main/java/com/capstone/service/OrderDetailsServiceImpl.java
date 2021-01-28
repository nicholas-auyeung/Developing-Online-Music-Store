package com.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.OrderDetailsDAO;
import com.capstone.entity.OrderDetails;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService{
	
	@Autowired
	OrderDetailsDAO orderDetailsDAO;

	@Override
	public void addOrderDetails(OrderDetails orderDetails) {
		try {
			orderDetailsDAO.addOrderDetails(orderDetails);
		}catch(Exception e) {
			throw e;
		}
		
	}

}
