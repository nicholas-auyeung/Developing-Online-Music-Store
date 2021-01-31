package com.capstone.service;

import com.capstone.entity.BillingAddress;

public interface BillingAddressService {
	
	public void addBillingAddress(BillingAddress billingAddress);
	public BillingAddress getBillingAddress(long id);
	public void updateBillingAddress(BillingAddress billingAddress);
	public BillingAddress findByUserId(long userId);

}
