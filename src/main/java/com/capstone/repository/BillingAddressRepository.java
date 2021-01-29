package com.capstone.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.capstone.entity.BillingAddress;

@Repository
public interface BillingAddressRepository extends CrudRepository<BillingAddress, Long>{

}
