<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ecommerce.model.Users"%>
<%@ page import="com.ecommerce.model.Role"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background: #f5f5f5;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	background: white;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	text-align: center;
	max-width: 500px;
	width: 90%;
}

h1 {
	color: #e53935;
	margin-bottom: 15px;
}

p {
	color: #555;
	margin-bottom: 25px;
	font-size: 16px;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	background: #2874f0;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	font-weight: bold;
}

.btn:hover {
	background: #1a5dc8;
}
</style>
</head>
<body>

	<%
	Users user = (Users) session.getAttribute("user");

	String redirectUrl = "login.jsp";
	String buttonText = "Go To Login";

	if (user != null) {

		if (user.getRole() == Role.ADMIN) {
			redirectUrl = "home";
			buttonText = "Back To Dashboard";
		} else if (user.getRole() == Role.CUSTOMER) {
			redirectUrl = "dashboard";
			buttonText = "Back To Home";
		}
	}
	%>

	<div class="container">
		<h1>Access Denied</h1>

		<p>You do not have permission to access this page.</p>

		<a href="<%= redirectUrl %>" class="btn">
	<%= buttonText %>
</a>
	</div>

</body>
</html>