package com.ecommerce.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.dao.OrderDao;
import com.ecommerce.model.Order;
import com.ecommerce.model.Users;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		if(session == null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		
		Users user = (Users) session.getAttribute("user");
		
		if (user == null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		
		OrderDao dao = new OrderDao();
		
		List<Order> orders = dao.findOrdersByUser(user.getId());
	
		
		req.setAttribute("orders", orders);
		
		req.getRequestDispatcher("/WEB-INF/view/orders.jsp").forward(req, resp);
	}
}
