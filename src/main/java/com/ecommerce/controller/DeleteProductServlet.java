package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.ProductDao;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		ProductDao dao = new ProductDao();
		
		boolean result = dao.deleteProduct(id);
		
		dao.deleteProduct(id);
		
		resp.sendRedirect("dashboard");
	}
}
