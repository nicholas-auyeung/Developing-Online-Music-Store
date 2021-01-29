package com.capstone.service;

import com.capstone.entity.User;

public interface UserService {
	
	public void addUser(User user);
	public void updateUser(User user);
	public User getUserbyUsername(String userName);
	public User getUserbyEmail(String email);
}
