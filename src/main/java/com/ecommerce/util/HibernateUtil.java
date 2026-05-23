package com.ecommerce.util;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class HibernateUtil {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");
	
	public static EntityManagerFactory getEMF() {
		return emf;
	}
}
