package com.capstone.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.capstone.dao.UserDAO;
import com.capstone.entity.Role;
import com.capstone.entity.User;
import com.capstone.repository.RoleRepository;


@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public void addUser(User user) {
			try {	
				
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			Role userRole = roleRepository.findByName("ROLE_USER");
			Set<Role> roles = new HashSet<Role>();
			roles.add(userRole);
			user.setRoles(roles);
			userDAO.addUser(user);
			
			}catch(Exception e) {
				e.printStackTrace();
			}
	}

	@Override
	public void updateUser(User user) {
		
		userDAO.updateUser(user);
		
	}
	

}
