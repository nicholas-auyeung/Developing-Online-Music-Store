package com.capstone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.entity.BillingAddress;
import com.capstone.repository.BillingAddressRepository;

@Service
public class BillingAddressDAOImpl implements BillingAddressDAO{
	
	@Autowired
	BillingAddressRepository billingAddressRepository;

	@Override
	public void addBillingAddress(BillingAddress billingAddress) {
		
		try {
			billingAddressRepository.save(billingAddress);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public BillingAddress getBillingAddress(long id) {
		
		try {
			return billingAddressRepository.findById(id).get();
		}catch(Exception e) {
			throw e;
		}
	}

}
