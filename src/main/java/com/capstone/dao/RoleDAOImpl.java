package com.capstone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.entity.Role;
import com.capstone.repository.RoleRepository;

@Service
public class RoleDAOImpl implements RoleDAO{
	
	@Autowired
	RoleRepository roleRepository;

	@Override
	public void addRole(Role role) {
		try {
			roleRepository.save(role);
		}catch(Exception e) {
			throw e;
		}
	}

}
