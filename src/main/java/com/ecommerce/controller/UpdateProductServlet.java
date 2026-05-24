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

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
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
			req.setAttribute("id", id);

			req.getRequestDispatcher("/WEB-INF/view/updateProduct.jsp").forward(req, resp);
			return;
		}

		Product product = new Product();

		product.setId(id);
		product.setDescription(description);
		product.setName(name);
		product.setPrice(Double.parseDouble(priceStr));
		product.setStock(Integer.parseInt(stockStr));

		ProductDao dao = new ProductDao();

		dao.updateProduct(product);

		resp.sendRedirect("dashboard");

	}
}
