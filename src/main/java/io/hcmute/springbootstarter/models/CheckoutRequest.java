package io.hcmute.springbootstarter.models;

import java.util.List;

public class CheckoutRequest {
	List<CartItem> cartItems;
	String note;
	
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
