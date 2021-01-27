package com.capstone.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.capstone.entity.Order;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long>{
}
