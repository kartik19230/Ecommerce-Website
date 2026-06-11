<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
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
    max-width: 1000px;
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

  /* ── Page Header ──────────────────────── */

  .page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
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

  .order-count {
    font-size: 13px;
    color: #9e9e9e;
  }

  /* ── Table Card ───────────────────────── */

  .table-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 14px;
  }

  thead { background: #f9fafc; }

  thead th {
    padding: 13px 16px;
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
    padding: 14px 16px;
    color: #212121;
    vertical-align: middle;
  }

  .order-id {
    font-family: monospace;
    font-size: 13px;
    font-weight: 700;
    color: #2874f0;
  }

  .order-date {
    font-size: 13px;
    color: #616161;
  }

  .order-amount {
    font-size: 15px;
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

  /* ── View Button ──────────────────────── */

  .btn-view {
    display: inline-block;
    font-size: 12px;
    font-weight: 600;
    color: #2874f0;
    text-decoration: none;
    padding: 5px 12px;
    border: 1px solid #2874f0;
    border-radius: 3px;
    transition: all 0.15s;
    white-space: nowrap;
  }

  .btn-view:hover { background: #2874f0; color: #fff; }

  /* ── Empty State ──────────────────────── */

  .empty-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    padding: 4rem 2rem;
    text-align: center;
    box-shadow: 0 1px 4px rgba(0,0,0,0.05);
  }

  .empty-icon {
    font-size: 48px;
    margin-bottom: 1rem;
    color: #bdbdbd;
  }

  .empty-card h3 {
    font-size: 18px;
    font-weight: 700;
    color: #212121;
    margin-bottom: 8px;
  }

  .empty-card p {
    font-size: 14px;
    color: #9e9e9e;
    margin-bottom: 1.5rem;
  }

  .btn-shop {
    display: inline-block;
    background: #2874f0;
    color: #fff;
    padding: 10px 24px;
    border-radius: 3px;
    font-size: 14px;
    font-weight: 600;
    text-decoration: none;
    transition: background 0.15s;
  }

  .btn-shop:hover { background: #1a5dc8; }

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

  /* ── Responsive ───────────────────────── */

  @media (max-width: 700px) {
    thead th:nth-child(2),
    tbody td:nth-child(2) { display: none; }
  }

</style>
</head>
<body>


<!-- Top Nav -->
<div class="topbar">
  <a href="${pageContext.request.contextPath}/dashboard" class="topbar-logo">Shop<span>Admin</span></a>
  <a href="${pageContext.request.contextPath}/dashboard" class="topbar-btn">&larr; Back to Shopping</a>
</div>


<div class="page-wrap">

  <div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a> &rsaquo; My Orders
  </div>

  <c:choose>
    <c:when test="${empty orders}">
      <div class="empty-card">
        <div class="empty-icon">&#128230;</div>
        <h3>No Orders Yet</h3>
        <p>You haven't placed any orders yet. Start shopping!</p>
        <a href="${pageContext.request.contextPath}/dashboard" class="btn-shop">Continue Shopping</a>
      </div>
    </c:when>
    <c:otherwise>
      <div class="page-header">
        <span class="section-title">My Orders</span>
        <span class="order-count">${orders.size()} order(s) found</span>
      </div>

      <div class="table-card">
        <table>
          <thead>
            <tr>
              <th>Order ID</th>
              <th>Order Date</th>
              <th>Total Amount</th>
              <th>Order Status</th>
              <th>Payment Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="order" items="${orders}">
              <tr>
                <td><span class="order-id">#${order.id}</span></td>
                <td><span class="order-date">${order.orderDate}</span></td>
                <td><span class="order-amount">&#8377;${order.totalAmount}</span></td>
                <td>
                  <c:choose>
                    <c:when test="${order.status == 'PENDING'}">
                      <span class="badge badge-pending">Pending</span>
                    </c:when>
                    <c:when test="${order.status == 'PROCESSING'}">
                      <span class="badge badge-processing">Processing</span>
                    </c:when>
                    <c:when test="${order.status == 'SHIPPED'}">
                      <span class="badge badge-shipped">Shipped</span>
                    </c:when>
                    <c:when test="${order.status == 'DELIVERED'}">
                      <span class="badge badge-delivered">Delivered</span>
                    </c:when>
                    <c:when test="${order.status == 'CANCELLED'}">
                      <span class="badge badge-cancelled">Cancelled</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge badge-default">${order.status}</span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${order.paymentStatus == 'PAID'}">
                      <span class="badge badge-paid">Paid</span>
                    </c:when>
                    <c:when test="${order.paymentStatus == 'UNPAID'}">
                      <span class="badge badge-unpaid">Unpaid</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge badge-default">${order.paymentStatus}</span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <a class="btn-view"
                    href="${pageContext.request.contextPath}/order-details?id=${order.id}">
                    View Details
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </c:otherwise>
  </c:choose>

</div>

<!-- Footer -->
<div class="sys-footer">ECOMMERCE ADMIN PANEL &bull; ALL RIGHTS RESERVED</div>

</body>
</html>
