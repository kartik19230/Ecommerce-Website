package com.ecommerce.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String keyword = req.getParameter("keyword");
				
		ProductDao dao = new ProductDao();
		
		List<Product> products;
		
		if (keyword != null && !keyword.trim().isEmpty()) {
			products = dao.searchProduct(keyword);
		}else {
			products = dao.getAllProducts();
		}
		
		req.setAttribute("products", products);
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/dashboard.jsp");
		
		rd.forward(req, resp);
		
	}
	
}
