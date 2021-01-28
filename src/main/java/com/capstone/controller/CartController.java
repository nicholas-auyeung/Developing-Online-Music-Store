package com.capstone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.entity.Order;
import com.capstone.entity.Product;
import com.capstone.entity.User;
import com.capstone.service.OrderService;

@Controller
public class CartController {
	
	@Autowired
	OrderService orderService;
	
	/*
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView getCart() {
		User currentSessionUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Order order = orderService.getOrder(currentSessionUser.getOrderId());
		//List<OrderDetails> orderDetailsList = 
		//List<Product> productList = productService.getAllProducts();
		//return new ModelAndView("products", "productList", productList);
	}*/
	
}
