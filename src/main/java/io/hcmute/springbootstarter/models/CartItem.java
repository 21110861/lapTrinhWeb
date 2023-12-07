package io.hcmute.springbootstarter.models;

public class CartItem {
	Product product;
	int quantity;
	public CartItem(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}
	public CartItem() {
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
