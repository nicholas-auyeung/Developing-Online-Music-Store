package com.capstone.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.capstone.entity.OrderDetails;


@Repository
public interface OrderDetailsRepository extends CrudRepository<OrderDetails, Long>{
	
	List<OrderDetails> findAllByOrderId(Long orderId);

}
