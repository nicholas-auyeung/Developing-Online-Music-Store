package com.capstone.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.capstone.entity.Role;
import com.capstone.entity.User;
import com.capstone.repository.RoleRepository;
import com.capstone.service.RoleService;
import com.capstone.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleRepository roleRepository;
	
	
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public ModelAndView register() {
		User user = new User();
		return new ModelAndView("register", "form", user);
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String addUser(User user) {
		try {
			
			userService.addUser(user);
			
		}catch(Exception e) {
			
		}
		return "login";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login?logout";
	}
	
	@RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	
	@RequestMapping(value = "/admindashboard", method = RequestMethod.GET)
	public String adminDashboard() {
		return "admindashboard";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard() {
		return "dashboard";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessdenied() {
		return "403";
	}
	
}
