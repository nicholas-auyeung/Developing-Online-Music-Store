package com.capstone.entity;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "orderdetails")
@Entity
public class OrderDetails {
	
	
	private long id;
	private String name;
	private long price;
	
	@ManyToMany
	@JoinTable(name = "user_order_details", joinColumns = @JoinColumn(name = "order_detail_id"), inverseJoinColumns = @JoinColumn(name = "order_id"))
	private Set<Order> orders;

}
