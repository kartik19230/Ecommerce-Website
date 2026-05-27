package com.ecommerce.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.ecommerce.model.Product;
import com.ecommerce.util.HibernateUtil;

public class ProductDao {

	public Product saveProduct(Product product) {

		EntityManager em = null;
		EntityTransaction et = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();
			et = em.getTransaction();

			et.begin();
			em.persist(product);
			et.commit();

			System.out.println("Data added");
			return product;

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

	public List<Product> getAllProducts() {

		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			String hql = "Select p From Product p";

			TypedQuery<Product> query = em.createQuery(hql, Product.class);

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

	public Product findProductById(int id) {

		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			return em.find(Product.class, id);

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}

		return null;
	}

	public Product updateProduct(Product product) {

		EntityManager em = null;
		EntityTransaction et = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();
			et = em.getTransaction();

			et.begin();

			Product p = em.find(Product.class, product.getId());

			if (p != null) {

				p.setName(product.getName());
				p.setDescription(product.getDescription());
				p.setPrice(product.getPrice());
				p.setStock(product.getStock());

				et.commit();

				return p;
			}

			et.commit();

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

	public boolean deleteProduct(int id) {

		EntityManager em = null;
		EntityTransaction et = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();
			et = em.getTransaction();

			et.begin();

			Product product = em.find(Product.class, id);

			if (product != null) {

				em.remove(product);
				et.commit();

				return true;
			}

			et.commit();

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

		return false;
	}

	public List<Product> searchProduct(String keyword) {

		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			String hql = "Select p From Product p Where Lower(p.name) Like Lower(:keyword)";

			TypedQuery<Product> query = em.createQuery(hql, Product.class);

			query.setParameter("keyword", "%" + keyword + "%");

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

	public List<Product> getProuductsWithPagination(int pageNumber, int pageSize) {

		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			String hql = "Select p From Product p";

			TypedQuery<Product> query = em.createQuery(hql, Product.class);

			int start = (pageNumber - 1) * pageSize;

			query.setFirstResult(start);
			query.setMaxResults(pageSize);

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

	public Long getTotalProductsCount() {

		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			String hql = "Select Count(p) From Product p";

			TypedQuery<Long> query = em.createQuery(hql, Long.class);

			return query.getSingleResult();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {

			if (em != null && em.isOpen()) {
				em.close();
			}
		}

		return 0L;

	}

	public Long getTotalSearchProductsCount(String keyword) {

		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			String hql = "Select Count(p) From Product p Where Lower(p.name) Like Lower(:keyword)";

			TypedQuery<Long> query = em.createQuery(hql, Long.class);

			query.setParameter("keyword", "%" + keyword + "%");

			return query.getSingleResult();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {

			if (em != null && em.isOpen()) {
				em.close();
			}
		}

		return 0L;

	}

	public List<Product> searchProductWithPagination(String keyword, int pageNumber, int pageSize) {

		EntityManager em = null;

		try {

			em = HibernateUtil.getEMF().createEntityManager();

			String hql = "Select p From Product p Where Lower(p.name) Like Lower(:keyword)";

			TypedQuery<Product> query = em.createQuery(hql, Product.class);
			
			query.setParameter("keyword", "%" + keyword + "%");

			int start = (pageNumber - 1) * pageSize;

			query.setFirstResult(start);
			query.setMaxResults(pageSize);

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
}
