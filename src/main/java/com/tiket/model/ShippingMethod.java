package com.tiket.model;

import java.util.List;

public class ShippingMethod {

	Integer shippingMethodID;
	String shippingMethod;
	
	List<Order> orders;
	
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public Integer getShippingMethodID() {
		return shippingMethodID;
	}
	public void setShippingMethodID(Integer shippingMethodID) {
		this.shippingMethodID = shippingMethodID;
	}
	public String getShippingMethod() {
		return shippingMethod;
	}
	public void setShippingMethod(String shippingMethod) {
		this.shippingMethod = shippingMethod;
	}
	
	
}

