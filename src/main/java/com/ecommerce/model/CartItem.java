package com.ecommerce.model;

public class CartItem {

	private Product product;
	private int quantity;

	public CartItem() {
	}

	public CartItem(Product product, int quantity) {
		if (product == null) {
			throw new IllegalArgumentException("Product Cannot be null");
		}
		if (quantity <= 0) {
			throw new IllegalArgumentException("Quantity must be positive");
		}
		this.product = product;
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void incrementQuantity(int amount) {
		if (quantity + amount > product.getStock())
			return;
		this.quantity += amount;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void decrementQuantity(int amount) {
		if (amount > quantity)
			return;
		this.quantity -= amount;
	}

	public double getTotalPrice() {
		return product.getPrice() * quantity;
	}

}
