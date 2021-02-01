package com.capstone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.capstone.entity.Product;
import com.capstone.entity.User;
import com.capstone.service.ProductService;
import com.capstone.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	
	
	@RequestMapping(value = "/admindashboard", method = RequestMethod.GET)
	public ModelAndView adminDashboard() {
		List<Product> productList = productService.getAllProducts();
		return new ModelAndView("admindashboard", "productList", productList);
		
	}
	
	@RequestMapping(value = "/addproduct", method = RequestMethod.GET)
	public ModelAndView adminAddProduct() {		
		try {
			Product product = new Product();
			return new ModelAndView("addproductform", "form", product);
		}catch(Exception e) {
			
		}
		return null;
		
	}
	
	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public RedirectView addminAddProductRe(Product product) {
		try {
			productService.addProduct(product);
			return new RedirectView("/productmanagment");
		}catch(Exception e) {
			
		}
		return null;
	}
	
	@RequestMapping(value ="/productmanagment", method = RequestMethod.GET)
	public ModelAndView productManagementPage() {
		List<Product> productList = productService.getAllProducts();
		return new ModelAndView("productmanagement", "productList", productList);
	}
	
	@RequestMapping(value = "/deleteproduct/{productId}", method = RequestMethod.GET)
	public RedirectView deleteProduct(@PathVariable("productId") long productId) {
		try {
		productService.deleteProduct(productId);
		return new RedirectView("/productmanagment");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/editproduct/{productId}", method = RequestMethod.GET)
	public ModelAndView editProduct(@PathVariable("productId") long productId) {
		return new ModelAndView("editproduct", "form", productService.getProductDetails(productId));
	}
	
	@RequestMapping(value = "/editproduct/{productId}", method = RequestMethod.POST)
	public RedirectView editProductSubmit(Product product) {
		try {
			productService.updateProduct(product);
			return new RedirectView("/productmanagment");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/customermanagment", method = RequestMethod.GET)
	public ModelAndView customerManagementPage() {
		List<User> userList = userService.getAllUsers();
		return new ModelAndView("customermanagement", "userList", userList);
	}

}
