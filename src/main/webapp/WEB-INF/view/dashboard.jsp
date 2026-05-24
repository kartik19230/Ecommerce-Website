<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@400;500;600&family=Share+Tech+Mono&display=swap" rel="stylesheet">
<style>

  *, *::before, *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'Rajdhani', sans-serif;
    background: #040810;
    color: #c8d8e8;
    min-height: 100vh;
    padding: 2rem;
    background-image:
      linear-gradient(rgba(0,240,255,0.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(0,240,255,0.03) 1px, transparent 1px);
    background-size: 40px 40px;
  }

  /* ── Top Bar ──────────────────────────── */

  .dash-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 2rem;
    padding-bottom: 1.2rem;
    border-bottom: 1px solid rgba(0,240,255,0.2);
  }

  .header-title {
    font-size: 26px;
    font-weight: 600;
    color: #00f0ff;
    letter-spacing: 4px;
    text-transform: uppercase;
  }

  .header-sub {
    font-size: 12px;
    color: rgba(255,255,255,0.3);
    letter-spacing: 2px;
    margin-top: 4px;
  }

  .status-dot {
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #00f0ff;
    margin-right: 8px;
    animation: blink 2s infinite;
  }

  @keyframes blink {
    0%, 100% { opacity: 1; }
    50%       { opacity: 0.2; }
  }

  /* ── Stat Cards ───────────────────────── */

  .stats-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 14px;
    margin-bottom: 1.8rem;
  }

  .stat-card {
    background: #0d1929;
    border: 1px solid rgba(0,240,255,0.2);
    border-radius: 8px;
    padding: 14px 18px;
    position: relative;
    overflow: hidden;
  }

  .stat-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
    background: linear-gradient(90deg, #00f0ff, #7f77dd);
  }

  .stat-label {
    font-size: 11px;
    color: rgba(0,240,255,0.6);
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-bottom: 6px;
  }

  .stat-value {
    font-family: 'Share Tech Mono', monospace;
    font-size: 26px;
    color: #ffffff;
  }

  /* ── Add Button ───────────────────────── */

  .btn-add {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: transparent;
    border: 1px solid #00f0ff;
    color: #00f0ff;
    border-radius: 6px;
    padding: 9px 18px;
    font-family: 'Rajdhani', sans-serif;
    font-size: 13px;
    font-weight: 600;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-decoration: none;
    transition: background 0.2s;
  }

  .btn-add:hover {
    background: rgba(0,240,255,0.12);
  }

  /* ── Table ────────────────────────────── */

  .table-wrap {
    border: 1px solid rgba(0,240,255,0.15);
    border-radius: 10px;
    overflow: hidden;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
  }

  thead {
    background: #0d1929;
  }

  thead th {
    padding: 12px 16px;
    text-align: left;
    color: #00f0ff;
    font-size: 11px;
    font-weight: 600;
    letter-spacing: 2px;
    text-transform: uppercase;
    border-bottom: 1px solid rgba(0,240,255,0.2);
  }

  tbody tr {
    border-bottom: 1px solid rgba(255,255,255,0.05);
    transition: background 0.15s;
  }

  tbody tr:last-child {
    border-bottom: none;
  }

  tbody tr:hover {
    background: rgba(0,240,255,0.05);
  }

  tbody td {
    padding: 12px 16px;
    font-family: 'Share Tech Mono', monospace;
    font-size: 12px;
    color: #8aaabb;
    vertical-align: middle;
  }

  .td-name {
    color: #ffffff;
    font-family: 'Rajdhani', sans-serif;
    font-size: 14px;
    font-weight: 600;
    letter-spacing: 1px;
  }

  .td-desc {
    color: rgba(140,170,190,0.7);
    font-family: 'Rajdhani', sans-serif;
    font-size: 13px;
  }

  .badge-price {
    display: inline-block;
    background: rgba(0,240,255,0.1);
    color: #00f0ff;
    border: 1px solid rgba(0,240,255,0.35);
    padding: 3px 9px;
    border-radius: 4px;
    font-size: 12px;
    font-family: 'Share Tech Mono', monospace;
  }

  .badge-stock {
    display: inline-block;
    background: rgba(127,119,221,0.1);
    color: #afa9ec;
    border: 1px solid rgba(127,119,221,0.35);
    padding: 3px 9px;
    border-radius: 4px;
    font-size: 12px;
    font-family: 'Share Tech Mono', monospace;
  }

  /* ── Action Buttons ───────────────────── */

  .actions {
    display: flex;
    gap: 8px;
  }

  .btn-update {
    display: inline-block;
    color: #00f0ff;
    font-size: 11px;
    font-weight: 600;
    font-family: 'Rajdhani', sans-serif;
    letter-spacing: 1px;
    text-transform: uppercase;
    text-decoration: none;
    padding: 4px 11px;
    border: 1px solid rgba(0,240,255,0.4);
    border-radius: 4px;
    transition: background 0.15s;
  }

  .btn-update:hover {
    background: rgba(0,240,255,0.15);
  }

  .btn-delete {
    display: inline-block;
    color: #ff4d6d;
    font-size: 11px;
    font-weight: 600;
    font-family: 'Rajdhani', sans-serif;
    letter-spacing: 1px;
    text-transform: uppercase;
    text-decoration: none;
    padding: 4px 11px;
    border: 1px solid rgba(255,77,109,0.4);
    border-radius: 4px;
    transition: background 0.15s;
  }

  .btn-delete:hover {
    background: rgba(255,77,109,0.15);
  }

  /* ── Footer ───────────────────────────── */

  .dash-footer {
    margin-top: 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .sys-status {
    font-family: 'Share Tech Mono', monospace;
    font-size: 11px;
    color: rgba(0,240,255,0.4);
    letter-spacing: 2px;
  }

  .btn-logout {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: #ff4d6d;
    font-size: 12px;
    font-weight: 600;
    font-family: 'Rajdhani', sans-serif;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-decoration: none;
    padding: 7px 16px;
    border: 1px solid rgba(255,77,109,0.35);
    border-radius: 6px;
    transition: background 0.15s;
  }

  .btn-logout:hover {
    background: rgba(255,77,109,0.12);
  }

</style>
</head>
<body>

<%
List<Product> products =
(List<Product>) request.getAttribute("products");
%>

<!-- Header -->
<div class="dash-header">
  <div>
    <div class="header-title">
      <span class="status-dot"></span>Product Control Panel
    </div>
    <div class="header-sub">ECOMMERCE MANAGEMENT SYSTEM // DASHBOARD</div>
  </div>
  <a href="addProduct.jsp" class="btn-add">&#43; New Product</a>
</div>

<!-- Stat Cards -->
<div class="stats-grid">
  <div class="stat-card">
    <div class="stat-label">Total Products</div>
    <div class="stat-value"><%= products != null ? String.format("%03d", products.size()) : "000" %></div>
  </div>
  <div class="stat-card">
    <div class="stat-label">Records Loaded</div>
    <div class="stat-value"><%= products != null ? String.format("%03d", products.size()) : "000" %></div>
  </div>
  <div class="stat-card" style="border-color: rgba(127,119,221,0.25);">
    <div class="stat-label" style="color: rgba(175,169,236,0.7);">System Status</div>
    <div class="stat-value" style="color: #afa9ec; font-size: 16px; padding-top: 6px;">ONLINE &#9679;</div>
  </div>
</div>

<!-- Product Table -->
<div class="table-wrap">
<table>

<thead>
<tr>
  <th>ID</th>
  <th>Name</th>
  <th>Description</th>
  <th>Price</th>
  <th>Stock</th>
  <th>Actions</th>
</tr>
</thead>

<tbody>
<%
for(Product p : products){
%>
<tr>
  <td>#<%= String.format("%03d", p.getId()) %></td>
  <td class="td-name"><%= p.getName() %></td>
  <td class="td-desc"><%= p.getDescription() %></td>
  <td><span class="badge-price"><%= p.getPrice() %></span></td>
  <td><span class="badge-stock"><%= p.getStock() %></span></td>
  <td>
    <div class="actions">
      <a href="editProduct?id=<%= p.getId() %>" class="btn-update">Update</a>
      <a href="deleteProduct?id=<%= p.getId() %>" class="btn-delete">Delete</a>
    </div>
  </td>
</tr>
<%
}
%>
</tbody>

</table>
</div>

<!-- Footer -->
<div class="dash-footer">
  <span class="sys-status">SYS::READY &mdash; <%= products != null ? products.size() : 0 %> RECORDS LOADED</span>
  <a href="logout" class="btn-logout">&#8594; Logout</a>
</div>

</body>
</html>
