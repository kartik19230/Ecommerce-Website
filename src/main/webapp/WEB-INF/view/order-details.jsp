<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
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
    position: sticky;
    top: 0;
    z-index: 100;
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

  .topbar-btn {
    color: #fff;
    font-size: 13px;
    font-weight: 500;
    text-decoration: none;
    border: 1px solid rgba(255,255,255,0.45);
    padding: 6px 14px;
    border-radius: 3px;
    transition: background 0.15s;
  }

  .topbar-btn:hover { background: rgba(255,255,255,0.12); }

  /* ── Page Wrapper ─────────────────────── */

  .page-wrap {
    max-width: 900px;
    margin: 2rem auto;
    padding: 0 1.5rem;
  }

  /* ── Breadcrumb ───────────────────────── */

  .breadcrumb {
    font-size: 12px;
    color: #9e9e9e;
    margin-bottom: 1rem;
  }

  .breadcrumb a { color: #2874f0; text-decoration: none; }
  .breadcrumb a:hover { text-decoration: underline; }

  /* ── Order Header Card ────────────────── */

  .order-header-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    padding: 1.5rem 2rem;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    margin-bottom: 1.2rem;
    position: relative;
    overflow: hidden;
  }

  .order-header-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 3px;
    background: #2874f0;
  }

  .order-title-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 1.2rem;
  }

  .order-title {
    font-size: 20px;
    font-weight: 700;
    color: #212121;
  }

  .order-id-badge {
    font-family: monospace;
    font-size: 13px;
    font-weight: 700;
    color: #2874f0;
    background: #e8f0fe;
    border: 1px solid #c5d8fd;
    padding: 4px 12px;
    border-radius: 3px;
  }

  .info-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
  }

  .info-label {
    font-size: 11px;
    color: #9e9e9e;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
    margin-bottom: 4px;
  }

  .info-value {
    font-size: 14px;
    color: #212121;
    font-weight: 500;
  }

  .total-value {
    font-size: 18px;
    font-weight: 700;
    color: #212121;
  }

  /* ── Status Badges ────────────────────── */

  .badge {
    display: inline-block;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.5px;
    text-transform: uppercase;
  }

  .badge-pending    { background: #fff8e1; color: #f57f17; border: 1px solid #ffe082; }
  .badge-processing { background: #e3f2fd; color: #1565c0; border: 1px solid #90caf9; }
  .badge-shipped    { background: #e8eaf6; color: #283593; border: 1px solid #9fa8da; }
  .badge-delivered  { background: #e8f5e9; color: #1b5e20; border: 1px solid #66bb6a; }
  .badge-cancelled  { background: #fdecea; color: #c62828; border: 1px solid #ef9a9a; }
  .badge-paid       { background: #e8f5e9; color: #2e7d32; border: 1px solid #a5d6a7; }
  .badge-unpaid     { background: #fdecea; color: #c62828; border: 1px solid #ef9a9a; }
  .badge-default    { background: #f5f5f5; color: #616161; border: 1px solid #e0e0e0; }

  /* ── Items Table Card ─────────────────── */

  .table-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    margin-bottom: 1.2rem;
  }

  .table-card-title {
    padding: 1rem 1.5rem;
    font-size: 13px;
    font-weight: 700;
    color: #9e9e9e;
    text-transform: uppercase;
    letter-spacing: 1px;
    border-bottom: 1px solid #f0f0f0;
    background: #f9fafc;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 14px;
  }

  thead th {
    padding: 12px 16px;
    text-align: left;
    font-size: 11px;
    font-weight: 700;
    color: #9e9e9e;
    text-transform: uppercase;
    letter-spacing: 1px;
    border-bottom: 1px solid #e0e0e0;
  }

  tbody tr {
    border-bottom: 1px solid #f0f0f0;
    transition: background 0.15s;
  }

  tbody tr:last-child { border-bottom: none; }
  tbody tr:hover { background: #f9fafc; }

  tbody td {
    padding: 13px 16px;
    color: #212121;
    vertical-align: middle;
  }

  .td-pid {
    font-family: monospace;
    font-size: 12px;
    color: #9e9e9e;
  }

  .td-name { font-weight: 600; color: #212121; }

  .td-price, .td-subtotal {
    font-family: monospace;
    font-size: 13px;
  }

  .td-subtotal { font-weight: 700; color: #212121; }
  .td-qty { font-weight: 600; text-align: center; }

  /* ── Grand Total Card ─────────────────── */

  .total-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    padding: 1.2rem 1.5rem;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.2rem;
  }

  .total-label {
    font-size: 15px;
    font-weight: 600;
    color: #616161;
  }

  .total-amount {
    font-size: 24px;
    font-weight: 700;
    color: #2874f0;
  }

  /* ── Footer ───────────────────────────── */

  .sys-footer {
    text-align: center;
    padding: 1rem;
    font-size: 11px;
    color: #bdbdbd;
    letter-spacing: 0.5px;
    background: #fff;
    border-top: 1px solid #e0e0e0;
    margin-top: 2rem;
  }

  @media (max-width: 600px) {
    .info-grid { grid-template-columns: 1fr; }
    .order-title-row { flex-direction: column; gap: 8px; }
  }

</style>
</head>
<body>

<%-- Build URLs cleanly with c:url to avoid Eclipse validator errors --%>
<c:url var="ordersUrl"    value="/orders" />
<c:url var="dashboardUrl" value="/dashboard" />

<!-- Top Nav -->
<div class="topbar">
  <a href="${ordersUrl}" class="topbar-logo">Shop<span>Admin</span></a>
  <a href="${ordersUrl}" class="topbar-btn">&larr; Back to Orders</a>
</div>

<!-- Page Content -->
<div class="page-wrap">

  <div class="breadcrumb">
    <a href="${dashboardUrl}">Dashboard</a> &rsaquo;
    <a href="${ordersUrl}">My Orders</a> &rsaquo;
    Order Details
  </div>

  <!-- Order Info Card -->
  <div class="order-header-card">

    <div class="order-title-row">
      <div class="order-title">Order Details</div>
      <span class="order-id-badge">#<c:out value="${order.id}" /></span>
    </div>

    <div class="info-grid">

      <div>
        <div class="info-label">Order Date</div>
        <div class="info-value"><c:out value="${order.orderDate}" /></div>
      </div>

      <div>
        <div class="info-label">Order Status</div>
        <div class="info-value">
          <c:choose>
            <c:when test="${order.status.toString() eq 'PENDING'}">
              <span class="badge badge-pending">Pending</span>
            </c:when>
            <c:when test="${order.status.toString() eq 'PROCESSING'}">
              <span class="badge badge-processing">Processing</span>
            </c:when>
            <c:when test="${order.status.toString() eq 'SHIPPED'}">
              <span class="badge badge-shipped">Shipped</span>
            </c:when>
            <c:when test="${order.status.toString() eq 'DELIVERED'}">
              <span class="badge badge-delivered">Delivered</span>
            </c:when>
            <c:when test="${order.status.toString() eq 'CANCELLED'}">
              <span class="badge badge-cancelled">Cancelled</span>
            </c:when>
            <c:otherwise>
              <span class="badge badge-default"><c:out value="${order.status}" /></span>
            </c:otherwise>
          </c:choose>
        </div>
      </div>

      <div>
        <div class="info-label">Payment Status</div>
        <div class="info-value">
          <c:choose>
            <c:when test="${order.paymentStatus.toString() eq 'PAID'}">
              <span class="badge badge-paid">Paid</span>
            </c:when>
            <c:when test="${order.paymentStatus.toString() eq 'UNPAID'}">
              <span class="badge badge-unpaid">Unpaid</span>
            </c:when>
            <c:otherwise>
              <span class="badge badge-default"><c:out value="${order.paymentStatus}" /></span>
            </c:otherwise>
          </c:choose>
        </div>
      </div>

      <div>
        <div class="info-label">Total Amount</div>
        <div class="info-value total-value">&#8377;<c:out value="${order.totalAmount}" /></div>
      </div>

    </div>
  </div>

  <!-- Purchased Items Table -->
  <div class="table-card">
    <div class="table-card-title">Purchased Items</div>
    <table>
      <thead>
        <tr>
          <th>Product ID</th>
          <th>Product Name</th>
          <th>Price at Purchase</th>
          <th style="text-align:center">Qty</th>
          <th>Subtotal</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${order.items}">
          <tr>
            <td class="td-pid">#<c:out value="${item.product.id}" /></td>
            <td class="td-name"><c:out value="${item.product.name}" /></td>
            <td class="td-price">&#8377;<c:out value="${item.priceAtPurchase}" /></td>
            <td class="td-qty"><c:out value="${item.quantity}" /></td>
            <td class="td-subtotal">&#8377;${item.priceAtPurchase * item.quantity}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Grand Total -->
  <div class="total-card">
    <span class="total-label">Grand Total</span>
    <span class="total-amount">&#8377;<c:out value="${order.totalAmount}" /></span>
  </div>

</div>

<!-- Footer -->
<div class="sys-footer">ECOMMERCE ADMIN PANEL &bull; ALL RIGHTS RESERVED</div>

</body>
</html>
