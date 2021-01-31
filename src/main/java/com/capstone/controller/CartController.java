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

import com.capstone.entity.BillingAddress;
import com.capstone.entity.Order;
import com.capstone.entity.OrderDetails;
import com.capstone.entity.Product;
import com.capstone.entity.User;
import com.capstone.service.BillingAddressService;
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
	
	@Autowired
	BillingAddressService billingAddressService;
	
	
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
				return mv;
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
	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkoutCustDetails() {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String currentSessionUsername = auth.getName();
			User currentSessionUser = userService.getUserbyUsername(currentSessionUsername);
			BillingAddress currentUserBillingAddress = billingAddressService.getBillingAddress(currentSessionUser.getBillingId());
			ModelAndView mv = new ModelAndView("confirmcustdetails", "form", currentSessionUser);
			mv.addObject("form2", currentUserBillingAddress);
			mv.addObject("currentSessionUsername", currentSessionUsername);
			return mv;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public RedirectView orderReceiptConfirmPage(User user, BillingAddress billingAddress) {
		userService.updateUser(user);
		billingAddress.setUser(user);
		billingAddressService.updateBillingAddress(billingAddress);
		return new RedirectView("/orderreceipt");
	}
	
	@RequestMapping(value = "/orderreceipt", method = RequestMethod.GET)
	public ModelAndView orderReceipt() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		User currentSessionUser = userService.getUserbyUsername(currentSessionUsername);
		try {
			if(currentSessionUser.getOrderId() == 0) {
				BillingAddress currentSessionBillingAddress = billingAddressService.getBillingAddress(currentSessionUser.getBillingId());
				ModelAndView mv = new ModelAndView("orderreceipt", "currentSessionBillingAddress", currentSessionBillingAddress);
				mv.addObject("currentSessionUsername", currentSessionUsername);
				mv.addObject("totalPrice", 0);
				return mv;
			}else {
				List<OrderDetails> listOrderDetails = orderDetailsService.getOrderDetailsByOrderId(currentSessionUser.getOrderId());
				ModelAndView mv = new ModelAndView("orderreceipt", "listOrderDetails", listOrderDetails);
				mv.addObject("currentSessionUsername", currentSessionUsername);
				long totalPrice = listOrderDetails.stream()
						.map(x -> x.getQprice())
						.collect(Collectors.summingLong(Long::longValue));
				mv.addObject("totalPrice", totalPrice);
				BillingAddress currentSessionBillingAddress = billingAddressService.getBillingAddress(currentSessionUser.getBillingId());
				mv.addObject("currentSessionBillingAddress", currentSessionBillingAddress);
				return mv;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
}
