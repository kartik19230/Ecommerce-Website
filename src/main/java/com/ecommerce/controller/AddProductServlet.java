package com.ecommerce.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;
import com.ecommerce.validator.ProductValidation;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		String priceStr = req.getParameter("price");
		String stockStr = req.getParameter("stock");
		
		List<String> errors = ProductValidation.validate(name, description, priceStr, stockStr);
		
		if (!errors.isEmpty()) {
			
			req.setAttribute("errors", errors);
			req.setAttribute("name", name);
			req.setAttribute("description", description);
			req.setAttribute("price", priceStr);
			req.setAttribute("stock", stockStr);
			
			req.getRequestDispatcher("addProduct.jsp").forward(req, resp);
			return;
		}
		
		Product product = new Product(name,description,Double.parseDouble(priceStr),Integer.parseInt(stockStr));
		
		ProductDao dao = new ProductDao();
		Product p = dao.saveProduct(product);
		
		if (p != null) {
			resp.sendRedirect("dashboard");
		}else {
			resp.getWriter().print("Unsuccessful Operation");;
		}
		
	}
}
