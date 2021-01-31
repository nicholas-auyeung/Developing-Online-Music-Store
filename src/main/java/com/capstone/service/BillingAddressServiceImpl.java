package com.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.BillingAddressDAO;
import com.capstone.entity.BillingAddress;

@Service
public class BillingAddressServiceImpl implements BillingAddressService{
	
	@Autowired
	BillingAddressDAO billingAddressDAO;

	@Override
	public void addBillingAddress(BillingAddress billingAddress) {
		try {
			billingAddressDAO.addBillingAddress(billingAddress);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public BillingAddress getBillingAddress(long id) {
		try {
			return billingAddressDAO.getBillingAddress(id);
		}catch(Exception e) {
			throw e;
		}
	}

	@Override
	public void updateBillingAddress(BillingAddress billingAddress) {
		try {
			billingAddressDAO.updateBillingAddress(billingAddress);
		}catch(Exception e) {
			throw e;
		}
		
	}

	@Override
	public BillingAddress findByUserId(long userId) {
		try {
			return billingAddressDAO.findByUserId(userId);
		}catch(Exception e) {
			throw e;
		}
	}
	

}
