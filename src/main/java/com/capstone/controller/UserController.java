package com.capstone.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String addUser(User user, Model model) {
		try {
			System.out.println("USERNAME");
			System.out.println(userService.getUserbyUsername(user.getUsername()));
			System.out.println("EMAIL");
			System.out.println((userService.getUserbyEmail(user.getEmail())));
			if(userService.getUserbyUsername(user.getUsername()) != null) {
				model.addAttribute("usernameExistsMsg", "Username already exists.");
				return "register";
			}else if(userService.getUserbyEmail(user.getEmail()) != null) {
				model.addAttribute("emailExistsMsg", "Email already exists.");
				return "register";
			}
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginRouter(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentSessionUsername = auth.getName();
		User currentSessionUser = userService.getUserbyUsername(currentSessionUsername);
		for (Role role : currentSessionUser.getRoles())
		{
			if(role.getName().compareTo("ROLE_ADMIN") == 0) {
				model.addAttribute("currentSessionUsername", currentSessionUsername);
				return "adminhome";
			}else if(role.getName().compareTo("ROLE_USER") == 0){
				model.addAttribute("currentSessionUsername", currentSessionUsername);
				return "userhome";
			}
	    }
		return "403";
	}
	
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessdenied() {
		return "403";
	}
	
}
