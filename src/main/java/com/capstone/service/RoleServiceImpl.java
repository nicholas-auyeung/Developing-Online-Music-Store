package com.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.RoleDAO;
import com.capstone.entity.Role;


@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	RoleDAO roleDAO;

	@Override
	public void addRole(Role role) {
		try {
			roleDAO.addRole(role);
		}catch(Exception e) {
			throw e;
		}
			
	}

}
