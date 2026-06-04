<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
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

  .topbar-continue {
    color: #fff;
    font-size: 13px;
    font-weight: 500;
    text-decoration: none;
    border: 1px solid rgba(255,255,255,0.45);
    padding: 6px 14px;
    border-radius: 3px;
    transition: background 0.15s;
  }

  .topbar-continue:hover { background: rgba(255,255,255,0.12); }

  .page-wrap {
    max-width: 1060px;
    margin: 2rem auto;
    padding: 0 1.5rem;
    display: grid;
    grid-template-columns: 1fr 300px;
    gap: 1.2rem;
    align-items: start;
  }

  .breadcrumb {
    font-size: 12px;
    color: #9e9e9e;
    margin-bottom: 1rem;
    grid-column: 1 / -1;
  }

  .breadcrumb a { color: #2874f0; text-decoration: none; }
  .breadcrumb a:hover { text-decoration: underline; }

  .section-title {
    font-size: 18px;
    font-weight: 700;
    color: #212121;
    padding-bottom: 6px;
    border-bottom: 3px solid #2874f0;
    display: inline-block;
    margin-bottom: 1.2rem;
  }

  .section-title span {
    font-size: 13px;
    font-weight: 400;
    color: #9e9e9e;
    border: none;
    padding-bottom: 0;
  }

  .cart-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    margin-bottom: 10px;
    padding: 1.2rem 1.5rem;
    display: grid;
    grid-template-columns: auto 1fr auto;
    gap: 1.2rem;
    align-items: center;
    box-shadow: 0 1px 4px rgba(0,0,0,0.05);
    transition: box-shadow 0.2s;
  }

  .cart-card:hover { box-shadow: 0 3px 12px rgba(0,0,0,0.1); }

  .cart-img {
    width: 80px;
    height: 80px;
    background: #f1f3f6;
    border-radius: 4px;
    border: 1px solid #e0e0e0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 13px;
    font-weight: 700;
    color: #2874f0;
    letter-spacing: 1px;
    flex-shrink: 0;
    text-transform: uppercase;
  }

  .cart-name {
    font-size: 15px;
    font-weight: 700;
    color: #212121;
    margin-bottom: 4px;
    line-height: 1.3;
  }

  .cart-category {
    font-size: 12px;
    color: #9e9e9e;
    margin-bottom: 6px;
  }

  .cart-unit-price {
    font-size: 13px;
    color: #616161;
  }

  .cart-unit-price strong { color: #212121; }

  .cart-right {
    text-align: right;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    gap: 10px;
    min-width: 130px;
  }

  .cart-subtotal {
    font-size: 18px;
    font-weight: 700;
    color: #212121;
  }

  .qty-control {
    display: flex;
    align-items: center;
    border: 1px solid #e0e0e0;
    border-radius: 3px;
    overflow: hidden;
  }

  .qty-btn {
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    font-weight: 700;
    color: #2874f0;
    text-decoration: none;
    background: #f1f3f6;
    transition: background 0.15s;
    flex-shrink: 0;
    line-height: 1;
  }

  .qty-btn:hover { background: #e8f0fe; }

  .qty-num {
    width: 36px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 14px;
    font-weight: 600;
    color: #212121;
    border-left: 1px solid #e0e0e0;
    border-right: 1px solid #e0e0e0;
  }

  .btn-remove {
    font-size: 12px;
    color: #f44336;
    font-weight: 600;
    text-decoration: none;
    padding: 4px 10px;
    border: 1px solid #f44336;
    border-radius: 3px;
    transition: all 0.15s;
  }

  .btn-remove:hover { background: #f44336; color: #fff; }

  .empty-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    padding: 4rem 2rem;
    text-align: center;
    box-shadow: 0 1px 4px rgba(0,0,0,0.05);
    grid-column: 1 / -1;
  }

  .empty-icon {
    font-size: 52px;
    margin-bottom: 1rem;
    color: #bdbdbd;
  }

  .empty-card h2 {
    font-size: 20px;
    color: #212121;
    font-weight: 700;
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

  .summary-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    padding: 1.5rem;
    box-shadow: 0 1px 4px rgba(0,0,0,0.05);
    position: sticky;
    top: 72px;
  }

  .summary-title {
    font-size: 13px;
    font-weight: 700;
    color: #9e9e9e;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 1.2rem;
    padding-bottom: 10px;
    border-bottom: 1px solid #f0f0f0;
  }

  .summary-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
    color: #616161;
    margin-bottom: 10px;
  }

  .summary-row .val { font-weight: 600; color: #212121; }
  .summary-row.discount .val { color: #388e3c; }

  .summary-row.total {
    font-size: 16px;
    font-weight: 700;
    color: #212121;
    padding-top: 10px;
    border-top: 1px solid #f0f0f0;
    margin-top: 4px;
    margin-bottom: 0;
  }

  .summary-row.total .val {
    color: #2874f0;
    font-size: 20px;
  }

  .btn-checkout {
    display: block;
    width: 100%;
    padding: 12px;
    background: #ff9f00;
    color: #fff;
    border: none;
    border-radius: 3px;
    font-size: 15px;
    font-weight: 700;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    transition: background 0.15s;
    margin-top: 1.2rem;
    font-family: 'Inter', sans-serif;
  }

  .btn-checkout:hover { background: #e8900a; }

  .safe-note {
    text-align: center;
    font-size: 11px;
    color: #9e9e9e;
    margin-top: 10px;
  }

  .sys-footer {
    text-align: center;
    padding: 1rem;
    font-size: 11px;
    color: #bdbdbd;
    letter-spacing: 0.5px;
    background: #fff;
    border-top: 1px solid #e0e0e0;
    margin-top: 2rem;
    grid-column: 1 / -1;
  }

  @media (max-width: 720px) {
    .page-wrap { grid-template-columns: 1fr; }
    .summary-card { position: static; }
    .cart-card { grid-template-columns: 1fr; }
    .cart-right { align-items: flex-start; flex-direction: row; flex-wrap: wrap; }
  }

</style>
</head>
<body>

<div class="topbar">
  <a href="dashboard" class="topbar-logo">Shop<span>Admin</span></a>
  <a href="dashboard" class="topbar-continue">&larr; Continue Shopping</a>
</div>

<div class="page-wrap">

  <div class="breadcrumb">
    <a href="dashboard">Dashboard</a> &rsaquo; Shopping Cart
  </div>

  <c:choose>
    <c:when test="${empty cart.items}">
      <div class="empty-card">
        <div class="empty-icon">&#128722;</div>
        <h2>Your Cart is Empty</h2>
        <p>Looks like you haven't added anything yet. Start shopping!</p>
        <a href="dashboard" class="btn-shop">Browse Products</a>
      </div>
    </c:when>
    <c:otherwise>
      <div class="cart-left">
        <div class="section-title">
          Shopping Cart <span>(${cart.totalItems} items)</span>
        </div>
        <c:forEach var="item" items="${cart.items.values()}">
          <div class="cart-card">
            <div class="cart-img">${item.product.name.substring(0,2)}</div>
            <div class="cart-info">
              <div class="cart-name">${item.product.name}</div>
              <div class="cart-category">
                <c:choose>
                  <c:when test="${item.product.category != null}">${item.product.category.name}</c:when>
                  <c:otherwise>N/A</c:otherwise>
                </c:choose>
              </div>
              <div class="cart-unit-price">Unit price: <strong>&#8377;${item.product.price}</strong></div>
            </div>
            <div class="cart-right">
              <div class="cart-subtotal">&#8377;${item.totalPrice}</div>
              <div class="qty-control">
                <a href="decrease-quantity?productId=${item.product.id}" class="qty-btn">&#8722;</a>
                <div class="qty-num">${item.quantity}</div>
                <a href="increase-quantity?productId=${item.product.id}" class="qty-btn">&#43;</a>
              </div>
              <a href="remove-from-cart?productId=${item.product.id}" class="btn-remove">Remove</a>
            </div>
          </div>
        </c:forEach>
      </div>
      <div class="summary-card">
        <div class="summary-title">Order Summary</div>
        <div class="summary-row">
          <span>Items (${cart.totalItems})</span>
          <span class="val">&#8377;${cart.calculateTotal()}</span>
        </div>
        <div class="summary-row discount">
          <span>Discount</span>
          <span class="val">&#8722; &#8377;0</span>
        </div>
        <div class="summary-row">
          <span>Delivery</span>
          <span class="val" style="color:#388e3c">FREE</span>
        </div>
        <div class="summary-row total">
          <span>Total</span>
          <span class="val">&#8377;${cart.calculateTotal()}</span>
        </div>
        <a href="checkout" class="btn-checkout">Place Order &rarr;</a>
        <div class="safe-note">&#128274; Safe and secure checkout</div>
      </div>
    </c:otherwise>
  </c:choose>

  <div class="sys-footer">
    ECOMMERCE ADMIN PANEL &bull; ALL RIGHTS RESERVED
  </div>

</div>

</body>
</html>
