package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		double price = Double.parseDouble(req.getParameter("price"));
		int stock = Integer.parseInt(req.getParameter("stock"));
		
		Product product = new Product();
		
		product.setId(id);
		product.setDescription(description);
		product.setName(name);
		product.setPrice(price);
		product.setStock(stock);
		
		ProductDao dao = new ProductDao();
		
		dao.updateProduct(product);
		
		resp.sendRedirect("dashboard");
		
	}
}
