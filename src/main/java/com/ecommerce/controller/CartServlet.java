package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.ShoppingCart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		ShoppingCart cart = null;
		
		if (session != null) {
			cart = (ShoppingCart) session.getAttribute("cart");
		}
		
		if (cart == null) {
			cart = new ShoppingCart();
		}
		
		req.setAttribute("cart", cart);
		
		req.getRequestDispatcher("/WEB-INF/view/cart.jsp").forward(req, resp);
		
	}
}
