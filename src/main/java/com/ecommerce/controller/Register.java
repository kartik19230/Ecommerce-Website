package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.ecommerce.dao.UserDao;
import com.ecommerce.model.Users;

@WebServlet("/register")
public class Register extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		String hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));
		
		Users user = new Users(name,email,hashed);
		
		UserDao dao = new UserDao();
		Users savedUser = dao.saveUser(user);
		
		if (savedUser != null) {
			resp.sendRedirect("login.jsp");
		}else {
			resp.getWriter().print("Registration Unsuccesfull");
		}
	}
}
