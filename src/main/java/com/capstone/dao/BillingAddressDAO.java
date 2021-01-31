package com.capstone.dao;

import com.capstone.entity.BillingAddress;

public interface BillingAddressDAO {
	
	public void addBillingAddress(BillingAddress billingAddress);
	public BillingAddress getBillingAddress(long id);
	public void updateBillingAddress(BillingAddress billingAddress);
	public BillingAddress findByUserId(long userId);

}
