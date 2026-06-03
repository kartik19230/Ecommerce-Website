package com.ecommerce.model;

import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {

	private final Map<Integer,CartItem> items;
	
	public ShoppingCart() {
		this.items = new HashMap<>();
	}
	
	public void addProduct(Product product,int quantity) {
		if (quantity < 1) {
			return;
		}
		
		if(items.containsKey(product.getId())) {
			items.get(product.getId()).incrementQuantity(quantity);
		}else {
            items.put(product.getId(), new CartItem(product, quantity));
        }
	}
}
