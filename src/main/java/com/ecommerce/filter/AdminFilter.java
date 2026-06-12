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
	"/home",
	"/add-product",
	"/addProduct",
	"/deleteProduct",
	"/editProduct",
	"/updateProduct",
	"/addCategory"
})
public class AdminFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		
		HttpSession session = req.getSession(false);
		
		if(session == null) {
		    ((HttpServletResponse)response)
		        .sendRedirect("login.jsp");
		    return;
		}
		
		Users user = (Users) session.getAttribute("user");
		
		if (user.getRole() == Role.ADMIN) {
			chain.doFilter(request, response);
		}else {
			HttpServletResponse resp = (HttpServletResponse) response;
			
			resp.sendRedirect("access-denied.jsp");
		}
	}

}
