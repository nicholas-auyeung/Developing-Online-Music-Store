package com.capstone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.entity.User;
import com.capstone.repository.UserRepository;

@Service
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	UserRepository userRepository;

	@Override
	public void addUser(User user) {
		try {
			userRepository.save(user);
		}catch(Exception e) {
			throw e;
		}
	}

}
