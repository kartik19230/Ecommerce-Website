package com.ecommerce.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.Role;
import com.ecommerce.model.Users;

@WebFilter({
	"/dashboard",
	"/cart",
	"/checkout",
	"/orders",
	"/order-details"
})
public class CustomerFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request,
			ServletResponse response,
			FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req =
				(HttpServletRequest) request;

		HttpServletResponse resp =
				(HttpServletResponse) response;

		HttpSession session =
				req.getSession(false);

		if(session == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		Users user =
				(Users) session.getAttribute("user");

		if(user == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		if(user.getRole() == Role.CUSTOMER) {

			chain.doFilter(request, response);

		} else {

			resp.sendRedirect("access-denied.jsp");
		}
	}
}