package com.capstone.dao;

import com.capstone.entity.Order;

public interface OrderDAO {
	
	public void createOrder(Order order);
	public Order getOrder(long orderId);
}
