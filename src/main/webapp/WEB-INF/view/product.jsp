<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
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
    max-width: 860px;
    margin: 2rem auto;
    padding: 0 1.5rem;
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

  /* ── Two-Column Layout ────────────────── */

  .product-layout {
    display: grid;
    grid-template-columns: 1fr 320px;
    gap: 1.2rem;
    align-items: start;
  }

  /* ── Shared Card Base ─────────────────── */

  .card-main,
  .card-side {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  }

  /* ── Left Card ────────────────────────── */

  .card-main {
    padding: 2rem;
  }

  .product-title {
    font-size: 24px;
    font-weight: 700;
    color: #212121;
    line-height: 1.3;
    margin-bottom: 6px;
  }

  .product-id {
    font-size: 11px;
    color: #9e9e9e;
    font-family: monospace;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    margin-bottom: 1rem;
  }

  .category-tag {
    display: inline-block;
    background: #e8f0fe;
    color: #2874f0;
    font-size: 12px;
    font-weight: 600;
    padding: 3px 10px;
    border-radius: 3px;
    border: 1px solid #c5d8fd;
    margin-bottom: 1.4rem;
  }

  .section-divider {
    border: none;
    border-top: 1px solid #f0f0f0;
    margin: 1.2rem 0;
  }

  .field-label {
    font-size: 11px;
    color: #9e9e9e;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
    margin-bottom: 5px;
  }

  .field-value {
    font-size: 15px;
    color: #212121;
  }

  .desc-text {
    font-size: 14px;
    color: #616161;
    line-height: 1.8;
  }

  .meta-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
  }

  /* ── Right Card ───────────────────────── */

  .card-side {
    padding: 1.5rem;
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  .side-divider {
    border: none;
    border-top: 1px solid #f0f0f0;
  }

  .side-label {
    font-size: 11px;
    color: #9e9e9e;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
    margin-bottom: 4px;
  }

  /* ── Price ────────────────────────────── */

  .price-big {
    font-size: 32px;
    font-weight: 700;
    color: #212121;
  }

  .price-currency {
    font-size: 16px;
    font-weight: 500;
    vertical-align: super;
  }

  /* ── Stock ────────────────────────────── */

  .stock-badge {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    font-size: 13px;
    font-weight: 600;
    color: #388e3c;
  }

  .stock-badge::before {
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

  .stock-units {
    font-size: 12px;
    color: #9e9e9e;
    margin-top: 3px;
  }

  .delivery-note {
    font-size: 12px;
    color: #388e3c;
    font-weight: 500;
  }

  /* ── Side Buttons ─────────────────────── */

  .btn-primary {
    display: block;
    width: 100%;
    padding: 11px;
    background: #ff9f00;
    color: #fff;
    border: none;
    border-radius: 3px;
    font-size: 14px;
    font-weight: 700;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    transition: background 0.15s;
    font-family: 'Inter', sans-serif;
  }

  .btn-primary:hover { background: #e8900a; }

  .btn-secondary {
    display: block;
    width: 100%;
    padding: 10px;
    background: #fff;
    color: #2874f0;
    border: 1px solid #2874f0;
    border-radius: 3px;
    font-size: 14px;
    font-weight: 600;
    text-align: center;
    text-decoration: none;
    transition: background 0.15s;
    font-family: 'Inter', sans-serif;
  }

  .btn-secondary:hover { background: #e8f0fe; }

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

  @media (max-width: 680px) {
    .product-layout {
      grid-template-columns: 1fr;
    }
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
    <a href="dashboard">Dashboard</a> &rsaquo; Product Details
  </div>

  <div class="product-layout">

    <!-- ── Left: Main Info ─────────────── -->
    <div class="card-main">

      <div class="product-title">${product.name}</div>
      <div class="product-id">PRODUCT ID &nbsp;#${product.id}</div>
      <div><span class="category-tag">${product.category.name}</span></div>

      <hr class="section-divider">

      <div class="field-label">Description</div>
      <div class="desc-text">${product.description}</div>

      <hr class="section-divider">

      <div class="meta-grid">
        <div>
          <div class="field-label">Product ID</div>
          <div class="field-value" style="font-family:monospace">#${product.id}</div>
        </div>
        <div>
          <div class="field-label">Category</div>
          <div class="field-value">${product.category.name}</div>
        </div>
      </div>

    </div>

    <!-- ── Right: Price / Stock / Actions ─ -->
    <div class="card-side">

      <div>
        <div class="side-label">Price</div>
        <div class="price-big"><span class="price-currency">&#8377;</span>${product.price}</div>
      </div>

      <hr class="side-divider">

      <div>
        <div class="side-label">Availability</div>
        <div class="stock-badge">In Stock</div>
        <div class="stock-units">${product.stock} units available</div>
      </div>

      <hr class="side-divider">

      <div class="delivery-note">&#10003; Free delivery available</div>

      <a href="editProduct?id=${product.id}" class="btn-primary">&#9998; Edit Product</a>
      <a href="dashboard" class="btn-secondary">&larr; Back to Dashboard</a>

    </div>
    
    <form action="add-to-cart" method="post">
    <input type="hidden"
           name="productId"
           value="${product.id}">

    <button type="submit">
        Add To Cart
    </button>
</form>

  </div>
</div>

<!-- Footer -->
<div class="sys-footer">
  ECOMMERCE ADMIN PANEL &bull; 
</div>

</body>
</html>
