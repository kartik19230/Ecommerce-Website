package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.dao.OrderDao;
import com.ecommerce.model.Order;
import com.ecommerce.model.Users;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idStr = req.getParameter("id");
		
		if(idStr == null) {
			resp.sendRedirect("orders");
			return;
		}
		
		long id;
		
		try {
			id = Long.parseLong(idStr);
		} catch (NumberFormatException e) {
			resp.sendRedirect("orders");
			return;
		}
		
		OrderDao dao = new OrderDao();
		
		Order order = dao.findById(id);
		
		if (order == null) {
			resp.sendRedirect("orders");
			return;
		}
		
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		
		Users loggedInUser = (Users)session.getAttribute("user");
		
		if (loggedInUser == null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		
		if(order.getUser().getId() != loggedInUser.getId()) {
		    resp.sendRedirect("orders");
		    return;
		}
		
		req.setAttribute("order", order);
		
		req.getRequestDispatcher("/WEB-INF/view/order-details.jsp").forward(req, resp);
		
	}
}
