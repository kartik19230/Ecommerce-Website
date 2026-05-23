package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.dao.UserDao;
import com.ecommerce.model.Users;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			System.out.println("Login Servlet Called");
			
			Users user = new UserDao().login(email, password);
			
			if (user != null) {
				
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				
				resp.sendRedirect("dashboard.jsp");
			}else {
				
				resp.getWriter().print("Invalid Email or Password");
			}
	}
}
