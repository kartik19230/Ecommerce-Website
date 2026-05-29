<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
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

  /* ── Heading ──────────────────────────── */

  .page-heading {
    font-size: 20px;
    font-weight: 700;
    color: #212121;
    margin-bottom: 4px;
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

  input::placeholder, textarea::placeholder {
    color: #bdbdbd;
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

  .btn {
    width: 100%;
    padding: 11px;
    background: #ff9f00;
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

  .btn:hover {
    background: #e8900a;
  }

  /* ── Error Messages ───────────────────── */

  .error-block {
    margin-top: 1rem;
  }

  .error-msg {
    display: block;
    color: #d32f2f;
    font-size: 12px;
    margin-bottom: 6px;
    padding: 8px 10px;
    background: #fdecea;
    border-left: 3px solid #f44336;
    border-radius: 0 3px 3px 0;
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
    <a href="dashboard">Dashboard</a> &rsaquo; Add Product
  </div>

  <div class="container">

    <div class="page-heading">Add New Product</div>
    <div class="page-sub">Fill in the details below to add a product to your catalog.</div>

    <hr class="section-divider">

    <form action="addProduct" method="post">

      <div class="form-group">
        <label>Product Name</label>
        <input type="text" name="name" placeholder="Enter product name" required>
      </div>

      <div class="form-group">
        <label>Description</label>
        <textarea name="description" placeholder="Enter product description" required></textarea>
      </div>
      
      <label>Category</label>

<select name="categoryId">

    <c:forEach items="${categories}" var="category">

        <option value="${category.id}">
            ${category.name}
        </option>

    </c:forEach>

</select>

      <div class="two-col">
        <div class="form-group">
          <label>Price (&#8377;)</label>
          <input type="number" step="0.01" name="price" placeholder="0.00" required>
        </div>
        <div class="form-group">
          <label>Stock Units</label>
          <input type="number" name="stock" placeholder="0" required>
        </div>
      </div>

      <hr class="section-divider">

      <button type="submit" class="btn">+ Add Product</button>

    </form>

<%
List<String> errors =
(List<String>) request.getAttribute("errors");

if(errors != null){
%>
  <div class="error-block">
<%
  for(String error : errors){
%>
    <span class="error-msg">&#9888; <%= error %></span>
<%
  }
%>
  </div>
<%
}
%>

  </div>
</div>

</body>
</html>
