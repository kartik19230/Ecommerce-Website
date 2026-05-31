package com.ecommerce.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.CategoryDao;
import com.ecommerce.model.Category;

@WebServlet("/add-product")
public class ProductFormServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CategoryDao categoryDao = new CategoryDao();

		List<Category> categories = categoryDao.getAllCategories();

		req.setAttribute("categories", categories);

		req.getRequestDispatcher("addProduct.jsp")
		   .forward(req, resp);
		
	}
}
