package com.capstone.dao;

import java.util.List;

import com.capstone.entity.User;

public interface UserDAO {
	
	public void addUser(User user);
	public void updateUser(User user);
	public User getUserbyUsername(String userName);
	public User getUserbyEmail(String email);
	public List<User> getAllUsers();

}
