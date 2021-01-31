package com.capstone.dao;

import java.util.List;

import com.capstone.entity.OrderDetails;


public interface OrderDetailsDAO {
	
	public void addOrderDetails(OrderDetails orderDetails);
	public List<OrderDetails> getOrderDetailsByOrderId(long orderId);
	public void updateOrderDetails(OrderDetails orderDetails);
	public void deleteOrderDetails(long orderDetailId);
	public OrderDetails getOrderDetails(long orderDetailId);
}
