package com.capstone.component;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.capstone.entity.Role;
import com.capstone.entity.User;
import com.capstone.repository.RoleRepository;
import com.capstone.repository.UserRepository;

@Component
public class SetupDataLoader implements ApplicationListener<ContextRefreshedEvent>{
	
	boolean alreadySetup = false;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public void onApplicationEvent(ContextRefreshedEvent event) {
		if(alreadySetup)
			return;
		
		Set<User> adminUsers = new HashSet<User>();
		Set<User> users = new HashSet<User>();
		
		createRoleIfNotFound("ROLE_ADMIN", adminUsers);
		createRoleIfNotFound("ROLE_USER", users);
		
		Role adminRole = roleRepository.findByName("ROLE_ADMIN");
		
		Set<Role> roles = new HashSet<Role>();
		roles.add(adminRole);
		User user = new User();
		user.setUsername("admin");
		user.setPassword(passwordEncoder.encode("admin"));
		user.setName("admin");
		user.setEmail("admin@mail.com");
		user.setPhoneNumber(123);
		user.setRoles(roles);
		userRepository.save(user);
		
		alreadySetup = true;
		
	}

	@Transactional
	Role createRoleIfNotFound(String name, Set<User> users) {
		
		Role role = roleRepository.findByName(name);
		if(role == null) {
			role = new Role(name);
			roleRepository.save(role);
		}
		return role;
	}

}
