package io.hcmute.springbootstarter.models;

import java.util.List;

public class CheckoutRequest {
	List<CartItem> cartItems;
	String note;
	String name;
	String address;
	String phone;
	
	public CheckoutRequest(List<CartItem> cartItems, String note, String name, String address, String phone) {
		super();
		this.cartItems = cartItems;
		this.note = note;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public CheckoutRequest(List<CartItem> cartItems, String note, String name, String address) {
		super();
		this.cartItems = cartItems;
		this.note = note;
		this.name = name;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public List<CartItem> getCartItems() {
		return cartItems;
	}
	public String getNote() {
		return note;
	}
	public CheckoutRequest(List<CartItem> cartItems, String note) {
		super();
		this.cartItems = cartItems;
		this.note = note;
	}
	public CheckoutRequest() {
	}
	public void addOrder() {
		
	}
}
