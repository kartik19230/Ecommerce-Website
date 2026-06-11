<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>

<style>
body {
	font-family: Arial, sans-serif;
	background: #f5f5f5;
	margin: 0;
	padding: 0;
}

.container {
	width: 90%;
	max-width: 1000px;
	margin: 40px auto;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.header h1 {
	margin: 0;
}

.btn {
	text-decoration: none;
	background: #2874f0;
	color: white;
	padding: 10px 16px;
	border-radius: 5px;
}

.cart-table {
	width: 100%;
	border-collapse: collapse;
	background: white;
}

.cart-table th, .cart-table td {
	padding: 15px;
	border: 1px solid #ddd;
	text-align: left;
}

.cart-table th {
	background: #2874f0;
	color: white;
}

.total-section {
	margin-top: 20px;
	background: white;
	padding: 20px;
	text-align: right;
	border: 1px solid #ddd;
}

.total-price {
	font-size: 24px;
	font-weight: bold;
	color: #2874f0;
}

.empty-cart {
	background: white;
	padding: 50px;
	text-align: center;
	border: 1px solid #ddd;
}

.category {
	color: #666;
	font-size: 14px;
}
</style>

</head>
<body>

	<div class="container">

		<div class="header">
			<h1>Shopping Cart</h1>

			<a href="dashboard" class="btn"> Continue Shopping </a>
			<a href="checkout" class="btn"> Checkout </a>
		</div>

		<c:choose>

			<c:when test="${empty cart.items}">

				<div class="empty-cart">

					<h2>Your Cart Is Empty</h2>

					<p>Add some products to get started.</p>

				</div>

			</c:when>

			<c:otherwise>

				<table class="cart-table">

					<thead>
						<tr>
							<th>Product</th>
							<th>Category</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Subtotal</th>
							<th>Action</th>
						</tr>
					</thead>

					<tbody>

						<c:forEach var="item" items="${cart.items.values()}">

							<tr>

								<td>${item.product.name}</td>

								<td><c:choose>

										<c:when test="${item.product.category != null}">
                                        ${item.product.category.name}
                                    </c:when>

										<c:otherwise>
                                        N/A
                                    </c:otherwise>

									</c:choose></td>

								<td>₹${item.product.price}</td>

								<td>${item.quantity}</td>

								<td>₹${item.totalPrice}</td>

								<td><a href="remove-from-cart?productId=${item.product.id}">Remove</a>
								</td>

								<td><a
									href="decrease-quantity?productId=${item.product.id}"> - </a>

									${item.quantity} <a
									href="increase-quantity?productId=${item.product.id}"> + </a></td>

							</tr>

						</c:forEach>

					</tbody>

				</table>

				<div class="total-section">

					<h3>Total Items: ${cart.totalItems}</h3>

					<div class="total-price">₹${cart.calculateTotal()}</div>

				</div>

			</c:otherwise>

		</c:choose>

	</div>

</body>
</html>