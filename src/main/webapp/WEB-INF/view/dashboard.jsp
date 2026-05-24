<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>

<h1>Welcome to Dashboard</h1>

<a href="addProduct.jsp">Add Product</a>

<br><br>

<%
List<Product> products =
(List<Product>) request.getAttribute("products");
%>

<table border="1">

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Description</th>
    <th>Price</th>
    <th>Stock</th>
    <th>Actions</th>
</tr>

<%
for(Product p : products){
%>

<tr>

    <td><%= p.getId() %></td>
    <td><%= p.getName() %></td>
    <td><%= p.getDescription() %></td>
    <td><%= p.getPrice() %></td>
    <td><%= p.getStock() %></td>

    <td>

        <a href="editProduct?id=<%= p.getId() %>">
            Update
        </a>

        <a href="deleteProduct?id=<%= p.getId() %>">
            Delete
        </a>

    </td>

</tr>

<%
}
%>

</table>

<br><br>

<a href="logout">Logout</a>

</body>
</html>