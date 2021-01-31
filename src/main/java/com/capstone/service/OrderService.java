package com.capstone.service;

import com.capstone.entity.Order;

public interface OrderService {
	
	public void createOrder(Order order);
	public Order getOrder(long orderId);
	public void updateOrder(Order order);

}
