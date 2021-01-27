package com.capstone.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.capstone.entity.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{

}
