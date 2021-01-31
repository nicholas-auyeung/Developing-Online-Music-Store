package com.capstone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.capstone.service.ProductService;
import com.capstone.service.UserService;

@Controller
public class ProductsController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderDetailsService orderDetailsService;
	
	boolean orderDetailDuplicate = false;
	
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView productsPage() {
		List<Product> productList = productService.getAllProducts();
		return new ModelAndView("products", "productList", productList);
	}
	
	@RequestMapping(value = "/userproducts", method = RequestMethod.GET)
	public ModelAndView userProductsPage() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		List<Product> productList = productService.getAllProducts();
		ModelAndView mv = new ModelAndView("userproducts", "productList", productList);
		mv.addObject("currentSessionUsername", currentSessionUsername);
		return mv;
	}

	@RequestMapping(value = "/productdetails/{productId}", method = RequestMethod.GET)
	public ModelAndView productDetailsPage(@PathVariable("productId") long productId) {
		Product productDetails = productService.getProductDetails(productId);
		return new ModelAndView("productdetails", "productDetails", productDetails);
	}
	
	
	@RequestMapping(value = "/userproductdetails/{productId}", method = RequestMethod.GET)
	public ModelAndView userProductDetailsPage(@PathVariable("productId") long productId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		Product productDetails = productService.getProductDetails(productId);
		ModelAndView mv = new ModelAndView("userproductdetails", "productDetails", productDetails);
		mv.addObject("currentSessionUsername", currentSessionUsername);
		return mv;
	}
	
	
	@RequestMapping(value = "/userproductdetails/{productId}", method = RequestMethod.POST)
	public RedirectView addToShoppingCart(@PathVariable("productId") long productId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		User currentSessionUser = userService.getUserbyUsername(currentSessionUsername);
		try {
			if(currentSessionUser.getOrderId() == 0) {
				Order newOrder = new Order();
				newOrder.setOrderStatus(true);
				newOrder.setUser(currentSessionUser);
				orderService.createOrder(newOrder);
				currentSessionUser.setOrderId(newOrder.getId());
				userService.updateUser(currentSessionUser);
				OrderDetails item = new OrderDetails();
				item.setName(productService.getProductDetails(productId).getName());
				item.setPrice(productService.getProductDetails(productId).getPrice());
				item.setQprice(item.getPrice() * item.getQuantity());
				item.setProductId(productId);
				item.setOrder(newOrder);
				orderDetailsService.addOrderDetails(item);
				return new RedirectView("/userproductdetails/"+productId);
			}else {
				Order order = orderService.getOrder(currentSessionUser.getOrderId());
				List<OrderDetails> listOrderDetails = orderDetailsService.getOrderDetailsByOrderId(order.getId());
				listOrderDetails.stream().filter(orderDetails -> orderDetails.getName().equals(productService.getProductDetails(productId).getName())).findAny()
				.ifPresent(orderDetails -> {
					if(orderDetails.getProductId() == productId) {
						orderDetails.setQuantity(orderDetails.getQuantity() + 1);
						orderDetails.setQprice(orderDetails.getPrice() * orderDetails.getQuantity());
						orderDetailsService.updateOrderDetails(orderDetails);
						orderDetailDuplicate = true;
					}
				});
				if(!orderDetailDuplicate) {
					OrderDetails item = new OrderDetails();
					item.setName(productService.getProductDetails(productId).getName());
					item.setPrice(productService.getProductDetails(productId).getPrice());
					item.setQprice(item.getPrice() * item.getQuantity());
					item.setProductId(productId);
					item.setOrder(order);
					orderDetailsService.addOrderDetails(item);
					return new RedirectView("/userproductdetails/"+productId);
				}else {
					orderDetailDuplicate = false;
					return new RedirectView("/userproductdetails/"+productId);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
