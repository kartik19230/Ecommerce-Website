<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
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
    color: #212121;
    min-height: 100vh;
  }

  /* ── Top Navigation Bar ───────────────── */

  .topbar {
    background: #2874f0;
    padding: 0 2rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    height: 56px;
    position: sticky;
    top: 0;
    z-index: 100;
    box-shadow: 0 2px 8px rgba(0,0,0,0.15);
  }

  .topbar-logo {
    color: #fff;
    font-size: 20px;
    font-weight: 700;
    letter-spacing: -0.5px;
    white-space: nowrap;
    font-style: italic;
    text-decoration: none;
  }

  .topbar-logo span {
    color: #ffe500;
  }

  .topbar-logo small {
    font-size: 10px;
    font-style: normal;
    color: rgba(255,255,255,0.65);
    font-weight: 400;
    margin-left: 4px;
  }

  /* ── Search Bar ───────────────────────── */

  .search-wrap {
    flex: 1;
    max-width: 680px;
    display: flex;
    border-radius: 4px;
    overflow: hidden;
  }

  .search-wrap input {
    flex: 1;
    padding: 10px 14px;
    border: none;
    outline: none;
    font-size: 14px;
    color: #212121;
    font-family: 'Inter', sans-serif;
  }

  .search-wrap button {
    background: #ffe500;
    border: none;
    padding: 0 18px;
    cursor: pointer;
    font-size: 16px;
    transition: background 0.15s;
  }

  .search-wrap button:hover {
    background: #f0d800;
  }

  /* ── Top Action Buttons ───────────────── */

  .topbar-actions {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-left: auto;
  }

  .topbar-btn {
    color: #fff;
    text-decoration: none;
    font-size: 13px;
    font-weight: 500;
    padding: 7px 12px;
    border-radius: 3px;
    transition: background 0.15s;
    border: 1px solid transparent;
    font-family: 'Inter', sans-serif;
    white-space: nowrap;
  }

  .topbar-btn:hover {
    border-color: #fff;
  }

  .topbar-btn.add {
    background: #ff9f00;
    border-color: #ff9f00;
    font-weight: 600;
  }

  .topbar-btn.add:hover {
    background: #e8900a;
    border-color: #e8900a;
  }

  .topbar-btn.logout {
    border-color: rgba(255,255,255,0.45);
  }

  /* ── Stats Bar ────────────────────────── */

  .stats-bar {
    background: #fff;
    border-bottom: 1px solid #e0e0e0;
    padding: 12px 2rem;
    display: flex;
    align-items: center;
    gap: 0;
  }

  .stat-item {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 0 2rem 0 0;
  }

  .stat-item + .stat-item {
    border-left: 1px solid #e0e0e0;
    padding-left: 2rem;
  }

  .stat-num {
    font-size: 22px;
    font-weight: 700;
    color: #2874f0;
    line-height: 1;
  }

  .stat-num.green { color: #388e3c; }
  .stat-num.red   { color: #f44336; }

  .stat-lbl {
    font-size: 11px;
    color: #9e9e9e;
    text-transform: uppercase;
    letter-spacing: 1px;
    line-height: 1.3;
  }

  .sys-online {
    margin-left: auto;
    font-size: 12px;
    color: #388e3c;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 5px;
  }

  .sys-online::before {
    content: '';
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #388e3c;
    display: inline-block;
    animation: blink 2s infinite;
  }

  @keyframes blink {
    0%, 100% { opacity: 1; }
    50%       { opacity: 0.3; }
  }

  /* ── Main Content ─────────────────────── */

  .main {
    padding: 1.5rem 2rem 3rem;
  }

  .section-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 1.2rem;
  }

  .section-title {
    font-size: 18px;
    font-weight: 700;
    color: #212121;
    padding-bottom: 6px;
    border-bottom: 3px solid #2874f0;
    display: inline-block;
  }

  .record-count {
    font-size: 13px;
    color: #9e9e9e;
  }

  /* ── Product Grid ─────────────────────── */

  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
    gap: 1rem;
  }

  /* ── Product Card ─────────────────────── */

  .p-card {
    background: #fff;
    border-radius: 4px;
    padding: 1rem;
    border: 1px solid #e0e0e0;
    transition: box-shadow 0.2s;
    display: flex;
    flex-direction: column;
    gap: 8px;
    position: relative;
  }

  .p-card:hover {
    box-shadow: 0 4px 20px rgba(0,0,0,0.12);
  }

  .p-card-id {
    font-size: 10px;
    color: #bdbdbd;
    font-family: monospace;
    letter-spacing: 1px;
  }

  .p-card-name {
    font-size: 15px;
    font-weight: 700;
    color: #212121;
    line-height: 1.3;
  }

  .p-card-desc {
    font-size: 12px;
    color: #9e9e9e;
    line-height: 1.5;
    flex: 1;
  }

  .p-card-divider {
    border: none;
    border-top: 1px solid #f0f0f0;
  }

  .p-card-price {
    font-size: 20px;
    font-weight: 700;
    color: #212121;
  }

  .p-card-stock {
    font-size: 12px;
    color: #388e3c;
    font-weight: 600;
  }

  /* ── Card Action Buttons ──────────────── */

  .p-card-actions {
    display: flex;
    gap: 8px;
    margin-top: 4px;
  }

  .btn-edit {
    flex: 1;
    padding: 8px;
    background: #2874f0;
    color: #fff;
    border: none;
    border-radius: 3px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    text-align: center;
    transition: background 0.15s;
    font-family: 'Inter', sans-serif;
  }

  .btn-edit:hover {
    background: #1a5dc8;
  }

  .btn-del {
    flex: 1;
    padding: 8px;
    background: #fff;
    color: #f44336;
    border: 1px solid #f44336;
    border-radius: 3px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    text-align: center;
    transition: all 0.15s;
    font-family: 'Inter', sans-serif;
  }

  .btn-del:hover {
    background: #f44336;
    color: #fff;
  }

  /* ── Empty State ──────────────────────── */

  .empty-state {
    grid-column: 1 / -1;
    text-align: center;
    padding: 4rem 2rem;
    color: #9e9e9e;
  }

  .empty-state h3 {
    font-size: 18px;
    margin-bottom: 8px;
    color: #bdbdbd;
  }

  /* ── Footer ───────────────────────────── */

  .sys-footer {
    text-align: center;
    padding: 1rem 2rem;
    font-size: 11px;
    color: #bdbdbd;
    letter-spacing: 1px;
    background: #fff;
    border-top: 1px solid #e0e0e0;
    margin-top: 2rem;
  }

</style>
</head>
<body>

<!-- ── Top Navigation Bar ───────────────────────── -->
<div class="topbar">

  <a href="dashboard" class="topbar-logo">
    Shop<span>Admin</span><small>panel</small>
  </a>

  <form class="search-wrap" action="dashboard" method="get">
    <input type="text" name="keyword" placeholder="Search products by name..." value="${param.keyword}">
    <button type="submit">&#128269;</button>
  </form>

  <div class="topbar-actions">
    <a href="addProduct.jsp" class="topbar-btn add">+ Add Product</a>
    <a href="logout" class="topbar-btn logout">Logout &rarr;</a>
  </div>

</div>

<!-- ── Stats Bar ─────────────────────────────────── -->
<div class="stats-bar">

  <div class="stat-item">
    <div class="stat-num">${empty products ? '0' : products.size()}</div>
    <div class="stat-lbl">Total<br>Products</div>
  </div>

  <div class="stat-item">
    <div class="stat-num green">${empty products ? '0' : products.size()}</div>
    <div class="stat-lbl">Records<br>Loaded</div>
  </div>

  <div class="stat-item">
    <div class="stat-num" style="color:#ff9f00">Admin</div>
    <div class="stat-lbl">Active<br>Session</div>
  </div>

  <div class="sys-online">SYSTEM ONLINE</div>

</div>

<!-- ── Main Content ──────────────────────────────── -->
<div class="main">

  <div class="section-header">
    <span class="section-title">All Products</span>
    <span class="record-count">${empty products ? '0' : products.size()} records found</span>
  </div>

  <!-- Product Card Grid -->
  <div class="product-grid">

    <c:choose>
      <c:when test="${empty products}">
        <div class="empty-state">
          <h3>No products found</h3>
          <p>Try a different search or <a href="addProduct.jsp" style="color:#2874f0">add a new product</a>.</p>
        </div>
      </c:when>
      <c:otherwise>
        <c:forEach var="product" items="${products}">
          <div class="p-card">

            <div class="p-card-id">#${product.id}</div>
            <div class="p-card-name">${product.name}</div>
            <div class="p-card-desc">${product.description}</div>

            <hr class="p-card-divider">

            <div class="p-card-price">&#8377;${product.price}</div>
            <div class="p-card-stock">In Stock: ${product.stock} units</div>

            <div class="p-card-actions">
              <a href="editProduct?id=${product.id}" class="btn-edit">Edit</a>
              <a href="deleteProduct?id=${product.id}" class="btn-del">Delete</a>
            </div>

          </div>
        </c:forEach>
      </c:otherwise>
    </c:choose>

  </div>
</div>

<!-- ── Footer ────────────────────────────────────── -->
<div class="sys-footer">
  ECOMMERCE ADMIN PANEL &nbsp;&bull;&nbsp; ${empty products ? '0' : products.size()} RECORDS LOADED
</div>

</body>
</html>
