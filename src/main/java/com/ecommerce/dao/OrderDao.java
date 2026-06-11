package com.ecommerce.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.ecommerce.model.Order;
import com.ecommerce.util.HibernateUtil;

public class OrderDao {

	public Order saveOrder(Order order) {
		
		EntityManager em = null;
		EntityTransaction et = null;
		
		try {
			em = HibernateUtil.getEMF().createEntityManager();
			et = em.getTransaction();
			
			
			et.begin();
			em.persist(order);
			et.commit();

			System.out.println("Data added");
			return order;

		} catch (Exception e) {

			if (et != null && et.isActive()) {
				et.rollback();
			}

			e.printStackTrace();

		} finally {

			if (em != null && em.isOpen()) {
				em.close();
			}
		}

		return null;
	}
	
	public Order findById(Long id) {

	    EntityManager em = null;

	    try {

	        em = HibernateUtil.getEMF().createEntityManager();

	        String jpql =
	                "SELECT DISTINCT o " +
	                "FROM Order o " +
	                "LEFT JOIN FETCH o.items i " +
	                "LEFT JOIN FETCH i.product " +
	                "WHERE o.id = :id";

	        return em.createQuery(jpql, Order.class)
	                 .setParameter("id", id)
	                 .getSingleResult();

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (em != null && em.isOpen()) {
	            em.close();
	        }
	    }

	    return null;
	}
	
	public List<Order> findOrdersByUser(int userId) {
		
		EntityManager em = null;
		
		try {
			 em = HibernateUtil.getEMF().createEntityManager();
			 
			String hql ="SELECT o FROM Order o " +
						"WHERE o.user.id = :id " +
				    	 "ORDER BY o.orderDate DESC";;
			
			TypedQuery<Order> query = em.createQuery(hql,Order.class);
			
			query.setParameter("id", userId);
			
			return query.getResultList();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		
		return Collections.emptyList();
	}
}
