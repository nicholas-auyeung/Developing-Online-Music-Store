package com.capstone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.capstone.entity.Product;
import com.capstone.service.ProductService;

@Controller
public class AdminController {
	
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
			return new RedirectView("/admindashboard");
		}catch(Exception e) {
			
		}
		return null;
	}

}
