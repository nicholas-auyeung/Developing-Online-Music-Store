package com.capstone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.entity.Role;
import com.capstone.entity.User;
import com.capstone.repository.RoleRepository;
import com.capstone.repository.UserRepository;

@Service
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	UserRepository userRepository;

	@Override
	public void addUser(User user) {
		
		userRepository.save(user);
		
	}

	@Override
	public void updateUser(User user) {
		
		userRepository.save(user);
		
	}

	@Override
	public User getUserbyUsername(String userName) {
		
		return userRepository.findByUsername(userName);
	}

	@Override
	public User getUserbyEmail(String email) {
		
		return userRepository.findByEmail(email);
	}

}
