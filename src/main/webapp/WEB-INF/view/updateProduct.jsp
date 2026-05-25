<%@page import="java.util.List"%>
<%@page import="com.ecommerce.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>

  *, *::before, *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'Inter', sans-serif;
    background: #f1f3f6;
    min-height: 100vh;
    padding: 0;
  }

  /* ── Top Nav ──────────────────────────── */

  .topbar {
    background: #2874f0;
    padding: 0 2rem;
    height: 56px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0 2px 8px rgba(0,0,0,0.15);
  }

  .topbar-logo {
    font-size: 20px;
    font-weight: 700;
    font-style: italic;
    color: #fff;
    text-decoration: none;
    letter-spacing: -0.5px;
  }

  .topbar-logo span { color: #ffe500; }

  .topbar-back {
    color: #fff;
    font-size: 13px;
    font-weight: 500;
    text-decoration: none;
    border: 1px solid rgba(255,255,255,0.45);
    padding: 6px 14px;
    border-radius: 3px;
    transition: background 0.15s;
  }

  .topbar-back:hover {
    background: rgba(255,255,255,0.12);
  }

  /* ── Page Wrapper ─────────────────────── */

  .page-wrap {
    max-width: 560px;
    margin: 2rem auto;
    padding: 0 1rem;
  }

  /* ── Breadcrumb ───────────────────────── */

  .breadcrumb {
    font-size: 12px;
    color: #9e9e9e;
    margin-bottom: 1rem;
  }

  .breadcrumb a {
    color: #2874f0;
    text-decoration: none;
  }

  .breadcrumb a:hover { text-decoration: underline; }

  /* ── Card ─────────────────────────────── */

  .container {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    padding: 2rem;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  }

  /* ── Heading + ID Badge ───────────────── */

  .heading-row {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    margin-bottom: 4px;
  }

  .page-heading {
    font-size: 20px;
    font-weight: 700;
    color: #212121;
  }

  .id-badge {
    font-size: 11px;
    font-weight: 600;
    color: #2874f0;
    background: #e8f0fe;
    border: 1px solid #c5d8fd;
    border-radius: 3px;
    padding: 3px 9px;
    white-space: nowrap;
  }

  .page-sub {
    font-size: 13px;
    color: #9e9e9e;
    margin-bottom: 1.6rem;
  }

  /* ── Divider ──────────────────────────── */

  .section-divider {
    border: none;
    border-top: 1px solid #f0f0f0;
    margin: 1.4rem 0;
  }

  /* ── Error Messages ───────────────────── */

  .error-block {
    margin-bottom: 1.2rem;
  }

  .error {
    display: block;
    color: #d32f2f;
    font-size: 12px;
    margin-bottom: 6px;
    padding: 8px 10px;
    background: #fdecea;
    border-left: 3px solid #f44336;
    border-radius: 0 3px 3px 0;
  }

  /* ── Form Groups ──────────────────────── */

  .form-group {
    margin-bottom: 16px;
  }

  label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #212121;
    margin-bottom: 6px;
  }

  input, textarea {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #c8c8c8;
    border-radius: 3px;
    font-size: 14px;
    font-family: 'Inter', sans-serif;
    color: #212121;
    outline: none;
    transition: border-color 0.15s, box-shadow 0.15s;
  }

  textarea {
    resize: none;
    height: 90px;
  }

  input:focus, textarea:focus {
    border-color: #2874f0;
    box-shadow: 0 0 0 3px rgba(40,116,240,0.1);
  }

  /* ── Two Column Grid ──────────────────── */

  .two-col {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
  }

  /* ── Submit Button ────────────────────── */

  button {
    width: 100%;
    padding: 11px;
    background: #2874f0;
    color: #fff;
    border: none;
    border-radius: 3px;
    font-size: 14px;
    font-weight: 600;
    font-family: 'Inter', sans-serif;
    cursor: pointer;
    transition: background 0.15s;
    letter-spacing: 0.3px;
  }

  button:hover {
    background: #1a5dc8;
  }

</style>
</head>
<body>

<!-- Top Nav -->
<div class="topbar">
  <a href="dashboard" class="topbar-logo">Shop<span>Admin</span></a>
  <a href="dashboard" class="topbar-back">&larr; Back to Dashboard</a>
</div>

<!-- Page Content -->
<div class="page-wrap">

  <div class="breadcrumb">
    <a href="dashboard">Dashboard</a> &rsaquo; Update Product
  </div>

<%
List<String> errors =
(List<String>) request.getAttribute("errors");

if(errors != null){
%>
  <div class="error-block">
<%
  for(String error : errors){
%>
    <span class="error">&#9888; <%= error %></span>
<%
  }
%>
  </div>
<%
}
%>

<%
Product product =
(Product) request.getAttribute("product");

String id = "";
String name = "";
String description = "";
String price = "";
String stock = "";

if(product != null){

id = String.valueOf(product.getId());
name = product.getName();
description = product.getDescription();
price = String.valueOf(product.getPrice());
stock = String.valueOf(product.getStock());
}

if(request.getAttribute("id") != null){
id = request.getAttribute("id").toString();
}

if(request.getAttribute("name") != null){
name = request.getAttribute("name").toString();
}

if(request.getAttribute("description") != null){
description =
request.getAttribute("description").toString();
}

if(request.getAttribute("price") != null){
price = request.getAttribute("price").toString();
}

if(request.getAttribute("stock") != null){
stock = request.getAttribute("stock").toString();
}
%>

  <div class="container">

    <div class="heading-row">
      <div class="page-heading">Update Product</div>
      <div class="id-badge">ID #<%= id.isEmpty() ? "---" : String.format("%03d", Integer.parseInt(id.isEmpty() ? "0" : id)) %></div>
    </div>
    <div class="page-sub">Edit the fields below and save your changes.</div>

    <hr class="section-divider">

    <form action="updateProduct" method="post">

      <input type="hidden" name="id" value="<%= id %>">

      <div class="form-group">
        <label>Product Name</label>
        <input type="text" name="name" value="<%= name %>">
      </div>

      <div class="form-group">
        <label>Description</label>
        <textarea name="description"><%= description %></textarea>
      </div>

      <div class="two-col">
        <div class="form-group">
          <label>Price (&#8377;)</label>
          <input type="text" name="price" value="<%= price %>">
        </div>
        <div class="form-group">
          <label>Stock Units</label>
          <input type="text" name="stock" value="<%= stock %>">
        </div>
      </div>

      <hr class="section-divider">

      <button type="submit">Save Changes</button>

    </form>

  </div>
</div>

</body>
</html>
