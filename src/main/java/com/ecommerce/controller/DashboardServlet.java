package com.ecommerce.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.CategoryDao;
import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Category;
import com.ecommerce.model.Product;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String keyword = req.getParameter("keyword");
		String pageParam = req.getParameter("page");
		
		ProductDao dao = new ProductDao();
		
		int currentPage = 1;
		int pageSize = 6;
		
		int totalPages = 1;

		
		if (pageParam != null) {
			try {
				currentPage = Integer.parseInt(pageParam);
			} catch (NumberFormatException e) {
				currentPage = 1;
			}
			
		}
		
		List<Product> products;
		
		if (keyword != null && !keyword.trim().isEmpty()) {
			
			products = dao.searchProductWithPagination(keyword, currentPage, pageSize);
			totalPages = (int) Math.ceil((double)dao.getTotalSearchProductsCount(keyword)/pageSize);
		}
		else {
			products = dao.getProuductsWithPagination(currentPage, pageSize);
			totalPages = (int)Math.ceil((double)dao.getTotalProductsCount()/pageSize);
		}
		

		if (currentPage > totalPages) {
			currentPage = totalPages;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}
		
		
		req.setAttribute("products", products);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPages", totalPages);
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/dashboard.jsp");
		
		rd.forward(req, resp);
		
	}
	
}
