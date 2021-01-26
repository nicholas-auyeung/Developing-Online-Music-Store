package com.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.capstone.dao.UserDAO;
import com.capstone.entity.User;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public void addUser(User user) {
		try {
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			userDAO.addUser(user);
		}catch(Exception e) {
			throw e;
		}
	}

}
