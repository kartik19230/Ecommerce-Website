<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
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
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem;
    background-image:
      linear-gradient(rgba(0,240,255,0.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(0,240,255,0.03) 1px, transparent 1px);
    background-size: 40px 40px;
  }

  /* ── Card ─────────────────────────────── */

  .container {
    width: 100%;
    max-width: 420px;
    background: #0d1929;
    border: 1px solid rgba(0,240,255,0.25);
    border-radius: 12px;
    padding: 2.2rem 2rem 1.8rem;
    position: relative;
    overflow: hidden;
  }

  .container::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
    background: linear-gradient(90deg, #00f0ff, #7f77dd, #00f0ff);
  }

  /* ── Icon ─────────────────────────────── */

  .box-icon {
    text-align: center;
    font-size: 26px;
    color: rgba(0,240,255,0.22);
    margin-bottom: 1rem;
  }

  /* ── Heading ──────────────────────────── */

  .fx-heading {
    text-align: center;
    margin-bottom: 1.8rem;
  }

  h1 {
    font-size: 22px;
    font-weight: 600;
    color: #00f0ff;
    letter-spacing: 4px;
    text-transform: uppercase;
  }

  .fx-heading p {
    font-family: 'Share Tech Mono', monospace;
    font-size: 11px;
    color: rgba(0,240,255,0.4);
    letter-spacing: 2px;
    margin-top: 6px;
  }

  /* ── Form Groups ──────────────────────── */

  .form-group {
    margin-bottom: 14px;
  }

  label {
    display: block;
    font-size: 11px;
    font-weight: 600;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: rgba(0,240,255,0.7);
    margin-bottom: 7px;
  }

  input, textarea {
    width: 100%;
    padding: 10px 14px;
    background: #070b14;
    border: 1px solid rgba(0,240,255,0.2);
    border-radius: 6px;
    color: #c8d8e8;
    font-family: 'Share Tech Mono', monospace;
    font-size: 13px;
    outline: none;
    transition: border-color 0.2s;
  }

  textarea {
    resize: none;
    height: 90px;
  }

  input::placeholder, textarea::placeholder {
    color: rgba(140,170,190,0.3);
  }

  input:focus, textarea:focus {
    border-color: #00f0ff;
  }

  /* ── Two Column Grid ──────────────────── */

  .two-col {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
  }

  /* ── Submit Button ────────────────────── */

  .btn {
    width: 100%;
    padding: 12px;
    background: rgba(0,240,255,0.08);
    border: 1px solid #00f0ff;
    color: #00f0ff;
    font-family: 'Rajdhani', sans-serif;
    font-size: 15px;
    font-weight: 600;
    letter-spacing: 3px;
    text-transform: uppercase;
    border-radius: 6px;
    cursor: pointer;
    margin-top: 6px;
    transition: background 0.2s;
  }

  .btn:hover {
    background: rgba(0,240,255,0.18);
  }

  /* ── Divider ──────────────────────────── */

  .divider {
    border: none;
    border-top: 1px solid rgba(0,240,255,0.1);
    margin: 1.2rem 0 1rem;
  }

  /* ── Back Link ────────────────────────── */

  .back-link {
    display: block;
    text-align: center;
    font-family: 'Rajdhani', sans-serif;
    font-size: 13px;
    color: #afa9ec;
    letter-spacing: 1px;
    text-decoration: none;
    font-weight: 600;
    transition: color 0.15s;
  }

  .back-link:hover {
    color: #7f77dd;
  }

  /* ── Error Messages ───────────────────── */

  .error-block {
    margin-top: 1rem;
  }

  .error-msg {
    display: block;
    color: #ff4d6d;
    font-family: 'Share Tech Mono', monospace;
    font-size: 11px;
    letter-spacing: 1px;
    margin-bottom: 6px;
    padding: 4px 8px;
    background: rgba(255,77,109,0.07);
    border-left: 2px solid #ff4d6d;
    border-radius: 0 4px 4px 0;
  }

</style>
</head>
<body>

<div class="container">

  <div class="box-icon">&#9711;</div>

  <div class="fx-heading">
    <h1>Add Product</h1>
    <p>NEW ENTRY // PRODUCT REGISTRY</p>
  </div>

  <form action="addProduct" method="post">

    <div class="form-group">
      <label>Product Name</label>
      <input type="text" name="name" placeholder="Enter product name" required>
    </div>

    <div class="form-group">
      <label>Description</label>
      <textarea name="description" placeholder="Enter product description" required></textarea>
    </div>

    <div class="two-col">
      <div class="form-group">
        <label>Price</label>
        <input type="number" step="0.01" name="price" placeholder="0.00" required>
      </div>
      <div class="form-group">
        <label>Stock</label>
        <input type="number" name="stock" placeholder="0" required>
      </div>
    </div>

    <button type="submit" class="btn">&#43; Add Product</button>

  </form>

  <hr class="divider">

  <a href="dashboard" class="back-link">&#8592; Back to Dashboard</a>

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

</body>
</html>
