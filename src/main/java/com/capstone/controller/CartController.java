package com.capstone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.entity.Order;
import com.capstone.entity.OrderDetails;
import com.capstone.entity.Product;
import com.capstone.entity.User;
import com.capstone.service.OrderDetailsService;
import com.capstone.service.OrderService;
import com.capstone.service.UserService;

@Controller
public class CartController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	OrderDetailsService orderDetailsService;
	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView getCart() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		User currentSessionUser = userService.getUserbyUsername(currentSessionUsername);
		try {
			if(currentSessionUser.getOrderId() == 0) {
				return new ModelAndView("cart");
			}else {
				List<OrderDetails> listOrderDetails = orderDetailsService.getOrderDetailsByOrderId(currentSessionUser.getOrderId());
				//stream list to get total
				return new ModelAndView("cart", "listOrderDetails", listOrderDetails);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
