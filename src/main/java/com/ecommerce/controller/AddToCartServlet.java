package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;
import com.ecommerce.model.ShoppingCart;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

	 @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {

	        String productIdStr = req.getParameter("productId");
	        String quantityStr = req.getParameter("quantity");

	        int productId;
	        int quantity;

	        try {
	            productId = Integer.parseInt(productIdStr);
	            quantity = Integer.parseInt(quantityStr);
	        } catch (NumberFormatException e) {
	            resp.sendRedirect("dashboard");
	            return;
	        }

	        if (quantity <= 0) {
	            resp.sendRedirect("dashboard");
	            return;
	        }

	        ProductDao dao = new ProductDao();
	        Product product = dao.findProductById(productId);

	        if (product == null) {
	            resp.sendRedirect("dashboard");
	            return;
	        }

	        HttpSession session = req.getSession();

	        ShoppingCart cart =
	                (ShoppingCart) session.getAttribute("cart");

	        if (cart == null) {
	            cart = new ShoppingCart();
	        }

	        cart.addProduct(product, quantity);

	        session.setAttribute("cart", cart);

	        resp.sendRedirect("cart");
	    }
}
