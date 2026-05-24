package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		ProductDao dao = new ProductDao();
		
		Product product = dao.findProductById(id);
		
		req.setAttribute("product", product);
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/updateProduct.jsp");
		
		rd.forward(req, resp);
		
	}
}
