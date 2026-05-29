package com.ecommerce.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.ecommerce.model.Category;
import com.ecommerce.util.HibernateUtil;

public class CategoryDao {
	
	public Category saveCategory(Category category) {
		
		EntityManager em = null;
		EntityTransaction et = null;
		
		try {
			
			em = HibernateUtil.getEMF().createEntityManager();
			et = em.getTransaction();
			
			et.begin();
			em.persist(category);
			et.commit();
			
			return category;
			
		} catch (Exception e) {
			if (et != null && et.isActive()) {
				et.rollback();
			}
		}finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		
		return null;
		
	}
	
	public List<Category> getAllCategories(){
		
		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			String hql = "Select c From Category c";

			TypedQuery<Category> query = em.createQuery(hql, Category.class);

			return query.getResultList();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {

			if (em != null && em.isOpen()) {
				em.close();
			}
		}

		return Collections.emptyList();
	}

	public Category findCategoryById(int id) {
		
		EntityManager em = null;
		
		try {
			em = HibernateUtil.getEMF().createEntityManager();
			
			Category category = em.find(Category.class, id);
			
			return category;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {

			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		
		return null;
	}
}
