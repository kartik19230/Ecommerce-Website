<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
</head>
<body>

<%
Product product =
(Product) request.getAttribute("product");
%>

<h1>Update Product</h1>

<form action="updateProduct" method="post">

    <input type="hidden"
           name="id"
           value="<%= product.getId() %>">

    <label>Name:</label>
    <input type="text"
           name="name"
           value="<%= product.getName() %>">

    <br><br>

    <label>Description:</label>
    <input type="text"
           name="description"
           value="<%= product.getDescription() %>">

    <br><br>

    <label>Price:</label>
    <input type="number"
           name="price"
           value="<%= product.getPrice() %>">

    <br><br>

    <label>Stock:</label>
    <input type="number"
           name="stock"
           value="<%= product.getStock() %>">

    <br><br>

    <input type="submit" value="Update Product">

</form>

</body>
</html>