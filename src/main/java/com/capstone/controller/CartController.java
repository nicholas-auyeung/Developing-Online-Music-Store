package com.capstone.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

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
	OrderService orderService;
	
	@Autowired
	OrderDetailsService orderDetailsService;
	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView getCart() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		User currentSessionUser = userService.getUserbyUsername(currentSessionUsername);
		try {
			if(currentSessionUser.getOrderId() == 0) {
				ModelAndView mv = new ModelAndView("cart");
				mv.addObject("currentSessionUsername", currentSessionUsername);
				mv.addObject("totalPrice", 0);
			}else {
				List<OrderDetails> listOrderDetails = orderDetailsService.getOrderDetailsByOrderId(currentSessionUser.getOrderId());
				ModelAndView mv = new ModelAndView("cart", "listOrderDetails", listOrderDetails);
				mv.addObject("currentSessionUsername", currentSessionUsername);
				long totalPrice = listOrderDetails.stream()
						.map(x -> x.getQprice())
						.collect(Collectors.summingLong(Long::longValue));
				mv.addObject("totalPrice", totalPrice);
				return mv;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping(value ="/deleteallorderdetails", method = RequestMethod.GET)
	public String clearCart() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		User currentSessionUser = userService.getUserbyUsername(currentSessionUsername);
		Order currentOrder = orderService.getOrder(currentSessionUser.getOrderId());
		currentOrder.setOrderStatus(false);
		currentSessionUser.setOrderId(0);
		userService.updateUser(currentSessionUser);
		return "cart";
	}
	
	@RequestMapping(value ="/deleteorderdetails/{orderDetailsId}", method = RequestMethod.GET)
	public RedirectView deleteCartItem(@PathVariable("orderDetailsId") long orderDetailsId) {
		try {
			OrderDetails deleteItem = orderDetailsService.getOrderDetails(orderDetailsId);
			if(deleteItem.getQuantity() > 1) {
				deleteItem.setQuantity(deleteItem.getQuantity() - 1);
				orderDetailsService.updateOrderDetails(deleteItem);
				return new RedirectView("/cart");
			}else {
				orderDetailsService.deleteOrderDetails(orderDetailsId);
				return new RedirectView("/cart");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
