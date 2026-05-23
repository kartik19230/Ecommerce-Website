package com.ecommerce.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.mindrot.jbcrypt.BCrypt;

import com.ecommerce.model.Users;
import com.ecommerce.util.HibernateUtil;

public class UserDao {

	public Users saveUser(Users user) {
		
		try {
			EntityManager em = HibernateUtil.getEMF().createEntityManager();
			EntityTransaction et = em.getTransaction();
			
			et.begin();
			em.persist(user);
			et.commit();
			em.close();
			
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Users login(String email, String password) {
		
		System.out.println("Login DAO Called");

		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			String hql =
					"SELECT u FROM Users u WHERE u.email = :email";

			TypedQuery<Users> query =
					em.createQuery(hql, Users.class);

			query.setParameter("email", email);

			Users user = query.getSingleResult();
			
			String pwd = user.getPassword();
			
			if(BCrypt.checkpw(password, pwd)) {
				
				return query.getSingleResult();
				
			}else {
				
				return null;
			}	

		} catch (NoResultException e) {

			return null;

		} catch (Exception e) {

			e.printStackTrace();
			return null;

		} finally {

			if(em != null) {
				em.close();
			}
		}
	}
}
