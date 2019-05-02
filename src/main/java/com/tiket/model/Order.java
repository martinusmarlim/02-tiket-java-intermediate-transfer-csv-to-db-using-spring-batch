package com.tiket.model;

import java.util.Date;
import java.util.List;

public class Order {

	Integer orderID;
	Integer customerID;
	Integer employeeID;
	Date orderDate;
	String purchaseOrderNumber;
	Date shipDate;
	Integer shippingMethodID;
	Integer freightCharge;
	Integer taxes;
	String paymentReceived;
	String comment;
	
	Customer customer; 
	Employee employee;
	ShippingMethod shippingMethod;
	List<OrderDetail> orderDetails;
	
	
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getCustomerID() {
		return customerID;
	}
	public void setCustomerID(Integer customerID) {
		this.customerID = customerID;
	}
	public Integer getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(Integer employeeID) {
		this.employeeID = employeeID;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getPurchaseOrderNumber() {
		return purchaseOrderNumber;
	}
	public void setPurchaseOrderNumber(String purchaseOrderNumber) {
		this.purchaseOrderNumber = purchaseOrderNumber;
	}
	public Date getShipDate() {
		return shipDate;
	}
	public void setShipDate(Date shipDate) {
		this.shipDate = shipDate;
	}
	public Integer getShippingMethodID() {
		return shippingMethodID;
	}
	public void setShippingMethodID(Integer shippingMethodID) {
		this.shippingMethodID = shippingMethodID;
	}
	public Integer getFreightCharge() {
		return freightCharge;
	}
	public void setFreightCharge(Integer freightCharge) {
		this.freightCharge = freightCharge;
	}
	public Integer getTaxes() {
		return taxes;
	}
	public void setTaxes(Integer taxes) {
		this.taxes = taxes;
	}
	public String getPaymentReceived() {
		return paymentReceived;
	}
	public void setPaymentReceived(String paymentReceived) {
		this.paymentReceived = paymentReceived;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}

