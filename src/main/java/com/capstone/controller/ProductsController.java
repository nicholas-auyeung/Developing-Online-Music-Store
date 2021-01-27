package com.capstone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.entity.Product;
import com.capstone.service.ProductService;

@Controller
public class ProductsController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView productsPage() {
		List<Product> productList = productService.getAllProducts();
		return new ModelAndView("products", "productList", productList);
	}
	
	
	@RequestMapping(value = "/productdetails", method = RequestMethod.GET)
	public ModelAndView productDetailsPage() {
		
	}

}
