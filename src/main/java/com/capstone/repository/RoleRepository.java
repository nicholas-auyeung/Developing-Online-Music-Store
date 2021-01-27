package com.capstone.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.capstone.entity.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long>{
	
	Role findByName(String name);

}
