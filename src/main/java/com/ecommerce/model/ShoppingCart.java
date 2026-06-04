package com.ecommerce.model;

import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {

	private Map<Integer, CartItem> items;

	public ShoppingCart() {
		this.items = new HashMap<>();
	}

	public Map<Integer, CartItem> getItems() {
		return items;
	}

	public void addProduct(Product product, int quantity) {
		
		if (quantity < 1) {
			return;
		}
		if (quantity > product.getStock()) {
			return; 
		}
		items.merge(product.getId(), new CartItem(product, quantity), (existingItem, newItem) -> {
			existingItem.incrementQuantity(quantity);
			return existingItem;
		});
	}

	public void removeProduct(int productId) {
		
		items.remove(productId);
	}

	public void incrementProduct(int productId, int quantity) {
		if (quantity <= 0)
			return;

		items.computeIfPresent(productId, (id, existingItem) -> {
			int totalRequestedQuantity = existingItem.getQuantity() + quantity;
			if (totalRequestedQuantity > existingItem.getProduct().getStock()) {
				return existingItem;
			}
			existingItem.incrementQuantity(quantity);
			return existingItem;
		});
	}
	
	public void decrementProduct(int productId, int quantity) {
		
		if (quantity <= 0) {
			return;
		}
		items.computeIfPresent(productId, (id, existingItem) ->{
			
			int remainingQuantity = existingItem.getQuantity() - quantity;
			if(remainingQuantity <= 0) {
				return null;
			}
			existingItem.decrementQuantity(quantity);
			return existingItem;
		});
	}

	public void clearCart() {
		items.clear();
	}

	public double calculateTotal() {

		double total = 0;
		for (CartItem item : items.values()) {
			total += item.getTotalPrice();
		}
 
		return total;
	}

	public int getTotalItems() {

		int total = 0;
		for (CartItem item : items.values()) {
			total += item.getQuantity();
		}

		return total;
	}
}
