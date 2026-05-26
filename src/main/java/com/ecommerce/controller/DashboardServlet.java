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
		String pageParam = req.getParameter("page");
		
		int currentPage = 1;
		int pageSize = 6;
		
		if (pageParam != null) {
			try {
				currentPage = Integer.parseInt(pageParam);
			} catch (NumberFormatException e) {
				
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/dashboard.jsp");
				
				rd.forward(req, resp);
			}
			
		}
				
		ProductDao dao = new ProductDao();
		
		List<Product> products;
		
		if (keyword != null && !keyword.trim().isEmpty()) {
			
			products = dao.searchProduct(keyword);
		}
		else {
			products = dao.getProuductsWithPagination(currentPage, pageSize);
		}
		
		req.setAttribute("products", products);
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/dashboard.jsp");
		
		rd.forward(req, resp);
		
	}
	
}
