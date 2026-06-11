package com.ecommerce.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.dao.OrderDao;
import com.ecommerce.model.CartItem;
import com.ecommerce.model.Order;
import com.ecommerce.model.OrderItem;
import com.ecommerce.model.OrderStatus;
import com.ecommerce.model.PaymentStatus;
import com.ecommerce.model.ShoppingCart;
import com.ecommerce.model.Users;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		
		Users user = (Users)session.getAttribute("user");
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		
		if (user == null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		
		if (cart == null || cart.getItems().isEmpty()) {
			resp.sendRedirect("dashboard");
			return;
		}
		
		Order order  = new Order();
		
		order.setUser(user);
		order.setTotalAmount(cart.calculateTotal());
		order.setStatus(OrderStatus.PENDING);
		order.setPaymentStatus(PaymentStatus.PAID);
		
		for (CartItem cartItem : cart.getItems().values()) {
			
			OrderItem orderItem = new OrderItem();
			
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setPriceAtPurchase(cartItem.getProduct().getPrice());
			
			order.addItem(orderItem);
		}
		
		OrderDao dao = new OrderDao();
		Order saveOrder = dao.saveOrder(order);
		
		if (saveOrder == null) {
			resp.sendRedirect("cart");
			return;
		}
		
		session.removeAttribute("cart");
		
		resp.sendRedirect(req.getContextPath() + "/orders");
	}
}
