package com.ecommerce.validator;

import java.util.ArrayList;
import java.util.List;

public class UserValidation {

	public static List<String> validate(String name,String email,String password){
		
		List<String> errors = new ArrayList<>();
		
		name = name != null ? name.trim() : "";
		email = email != null ? email.trim() : "";
		password = password != null ? password.trim() : "";
		
		
		if (name.isEmpty()) {
			errors.add("Enter a valid name");
		}
		if(email.isEmpty() || !email.contains("@") || !email.contains(".")) {
			errors.add("Enter a valid email");
		}
		if(password.isEmpty() || password.length() < 6) {
			errors.add("Password must be at least 6 characters");
		}

		return errors;
		
	}
}
