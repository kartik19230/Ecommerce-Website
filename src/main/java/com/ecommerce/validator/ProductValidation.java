package com.ecommerce.validator;

import java.util.ArrayList;
import java.util.List;

public class ProductValidation {

	public static List<String> validate(String name,String description,String priceStr,String stockStr){
		
		List<String> errors = new ArrayList<>();
		
		name = name != null ? name.trim() : "";
		description = description != null ? description.trim() : "";
		priceStr = priceStr != null ? priceStr.trim() : "";
		stockStr = stockStr != null ? stockStr.trim() : "";
		
		if (name.isEmpty()) {
			errors.add("Enter a valid name");
		}
		if(description.isEmpty()) {
			errors.add("Need to add description");
		}else if(description.length() < 30 || description.length() > 200) {
			errors.add("Should contain 30 to 200 characters");
		}
		
		if (priceStr.isEmpty() ) {
			errors.add("Invalid Price");
		}else {
			try {
				double price = Double.parseDouble(priceStr);
				
				if (price <= 0) {
					errors.add("Price can't be negative or 0");
				}
			} catch (NumberFormatException  e) {
				errors.add("Invalid input");
			}
		}
		
		if (stockStr.isEmpty()) {
			errors.add("Enter valid stock amount");
		}else {
			try {
				int stock = Integer.parseInt(stockStr);		
				
				if (stock < 0) {
					errors.add("Stock can't be negative");
				}
			} catch (NumberFormatException  e) {
				errors.add("Invalid input");
			}
		}
		
		
		return errors;
	}
}
