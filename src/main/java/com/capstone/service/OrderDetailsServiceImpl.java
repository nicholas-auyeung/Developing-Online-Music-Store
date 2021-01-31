package com.capstone.service;

import java.util.List;

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

	@Override
	public List<OrderDetails> getOrderDetailsByOrderId(long orderId) {
		try {
			return orderDetailsDAO.getOrderDetailsByOrderId(orderId);
		}catch(Exception e) {
			throw e;
		}
	}

	@Override
	public void updateOrderDetails(OrderDetails orderDetails) {
		try {
			orderDetailsDAO.updateOrderDetails(orderDetails);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public void deleteOrderDetails(long orderDetailId) {
		try {
			orderDetailsDAO.deleteOrderDetails(orderDetailId);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public OrderDetails getOrderDetails(long orderDetailId) {
		try {
			return orderDetailsDAO.getOrderDetails(orderDetailId);
		}catch(Exception e) {
			throw e;
		}
	}

}
