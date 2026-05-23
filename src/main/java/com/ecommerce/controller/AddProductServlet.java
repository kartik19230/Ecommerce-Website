package com.ecommerce.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		double price = Double.parseDouble(req.getParameter("price"));
		int stock = Integer.parseInt(req.getParameter("stock"));
		
		Product product = new Product(name,description,price,stock);
		
		ProductDao dao = new ProductDao();
		Product p = dao.saveProduct(product);
		
		if (p != null) {
			resp.sendRedirect("dashboard.jsp");
		}else {
			resp.getWriter().print("Unsuccessful Operation");;
		}
		
	}
}
