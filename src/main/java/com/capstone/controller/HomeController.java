package com.capstone.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/userhome", method = RequestMethod.GET)
	public String userhome(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		model.addAttribute("currentSessionUsername", currentSessionUsername);
		return "userhome";
	}
	
	@RequestMapping(value = "/adminhome", method = RequestMethod.GET)
	public String adminhome(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		model.addAttribute("currentSessionUsername", currentSessionUsername);
		return "adminhome";
	}
	
	@RequestMapping(value= "/about", method = RequestMethod.GET)
	public String aboutPage() {
		return "about";
	}

}
