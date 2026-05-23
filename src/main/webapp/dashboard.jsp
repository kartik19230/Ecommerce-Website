<%@page import="com.ecommerce.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	Users user = (Users) session.getAttribute("user");

	if(user == null){
		response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>

	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: Arial, sans-serif;
	}

	body{
		background-color: #f2f2f2;
	}

	/* Navbar */

	.navbar{
		width: 100%;
		height: 70px;
		background-color: #222;
		color: white;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 40px;
	}

	.logo{
		font-size: 28px;
		font-weight: bold;
		color: #4CAF50;
	}

	.nav-links a{
		text-decoration: none;
		color: white;
		margin-left: 20px;
		font-size: 16px;
	}

	.nav-links a:hover{
		color: #4CAF50;
	}

	/* Welcome Section */

	.welcome-section{
		text-align: center;
		margin-top: 40px;
	}

	.welcome-section h1{
		font-size: 40px;
		color: #333;
		margin-bottom: 10px;
	}

	.welcome-section p{
		font-size: 18px;
		color: gray;
	}

	/* Product Section */

	.product-container{
		width: 90%;
		margin: 40px auto;
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		gap: 25px;
	}

	.product-card{
		width: 250px;
		background-color: white;
		border-radius: 10px;
		padding: 20px;
		box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
		transition: 0.3s;
	}

	.product-card:hover{
		transform: scale(1.03);
	}

	.product-image{
		width: 100%;
		height: 180px;
		background-color: #ddd;
		border-radius: 8px;
		margin-bottom: 15px;
	}

	.product-name{
		font-size: 22px;
		font-weight: bold;
		margin-bottom: 10px;
		color: #333;
	}

	.product-price{
		font-size: 20px;
		color: #4CAF50;
		margin-bottom: 10px;
	}

	.product-description{
		font-size: 14px;
		color: gray;
		margin-bottom: 15px;
	}

	.buy-btn{
		width: 100%;
		padding: 10px;
		border: none;
		background-color: #4CAF50;
		color: white;
		font-size: 16px;
		border-radius: 5px;
		cursor: pointer;
	}

	.buy-btn:hover{
		background-color: #388E3C;
	}

</style>

</head>
<body>

	<!-- Navbar -->

	<div class="navbar">

		<div class="logo">
			E-Commerce
		</div>

		<div class="nav-links">
			<a href="#">Home</a>
			<a href="addProduct.jsp">Products</a>
			<a href="#">Categories</a>
			<a href="logout">Logout</a>
		</div>

	</div>

	<!-- Welcome Section -->

	<div class="welcome-section">

		<h1>
			Welcome, <%= user.getName() %>
		</h1>

		<p>
			Explore our latest products
		</p>

	</div>

	<!-- Products -->

	<div class="product-container">

		<!-- Product 1 -->

		<div class="product-card">

			<div class="product-image"></div>

			<div class="product-name">
				Laptop
			</div>

			<div class="product-price">
				₹55,000
			</div>

			<div class="product-description">
				High performance laptop for coding and gaming.
			</div>

			<button class="buy-btn">
				Buy Now
			</button>

		</div>

		<!-- Product 2 -->

		<div class="product-card">

			<div class="product-image"></div>

			<div class="product-name">
				Smartphone
			</div>

			<div class="product-price">
				₹25,000
			</div>

			<div class="product-description">
				Latest smartphone with excellent camera quality.
			</div>

			<button class="buy-btn">
				Buy Now
			</button>

		</div>

		<!-- Product 3 -->

		<div class="product-card">

			<div class="product-image"></div>

			<div class="product-name">
				Headphones
			</div>

			<div class="product-price">
				₹3,000
			</div>

			<div class="product-description">
				Noise cancellation wireless headphones.
			</div>

			<button class="buy-btn">
				Buy Now
			</button>

		</div>

	</div>

</body>
</html>