package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.ShoppingCart;

@WebServlet("/remove-from-cart")
public class RemoveProductFromCartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String productIdStr = req.getParameter("productId");
		
		if (productIdStr == null) {
			resp.sendRedirect("cart");
			return;
		}
		
		int productId;
		try {
			productId = Integer.parseInt(productIdStr);
		} catch (NumberFormatException e) {
			resp.sendRedirect("cart");
			return;
		}
		
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			resp.sendRedirect("cart");
			return;
		}
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		
		if (cart != null) {
			cart.removeProduct(productId);
		}
		
//		session.setAttribute("cart", cart);
		
		resp.sendRedirect("cart");
		
	}
}
