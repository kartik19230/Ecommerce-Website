<%@page import="java.util.List"%>
<%@page import="com.ecommerce.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
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
    max-width: 440px;
    background: #0d1929;
    border: 1px solid rgba(127,119,221,0.3);
    border-radius: 12px;
    padding: 2.2rem 2rem 1.8rem;
    position: relative;
    overflow: hidden;
  }

  /* purple-led top bar to distinguish from Add (cyan) */
  .container::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
    background: linear-gradient(90deg, #7f77dd, #00f0ff, #7f77dd);
  }

  /* ── Edit Icon ────────────────────────── */

  .edit-icon {
    text-align: center;
    font-size: 24px;
    color: rgba(127,119,221,0.35);
    margin-bottom: 1rem;
  }

  /* ── Heading ──────────────────────────── */

  .fx-heading {
    text-align: center;
    margin-bottom: 1.4rem;
  }

  h2 {
    font-size: 22px;
    font-weight: 600;
    color: #afa9ec;
    letter-spacing: 4px;
    text-transform: uppercase;
  }

  .fx-heading p {
    font-family: 'Share Tech Mono', monospace;
    font-size: 11px;
    color: rgba(175,169,236,0.4);
    letter-spacing: 2px;
    margin-top: 6px;
  }

  /* ── Record ID Badge ──────────────────── */

  .id-badge {
    font-family: 'Share Tech Mono', monospace;
    font-size: 11px;
    color: rgba(127,119,221,0.5);
    text-align: center;
    margin-bottom: 1.4rem;
    letter-spacing: 2px;
  }

  /* ── Error Messages ───────────────────── */

  .error-block {
    margin-bottom: 1.2rem;
  }

  .error {
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
    color: rgba(175,169,236,0.7);
    margin-bottom: 7px;
  }

  input,
  textarea {
    width: 100%;
    padding: 10px 14px;
    background: #070b14;
    border: 1px solid rgba(127,119,221,0.25);
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

  input:focus,
  textarea:focus {
    border-color: #afa9ec;
  }

  /* ── Two Column Grid ──────────────────── */

  .two-col {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
  }

  /* ── Submit Button ────────────────────── */

  button {
    width: 100%;
    padding: 12px;
    background: rgba(127,119,221,0.1);
    border: 1px solid #7f77dd;
    color: #afa9ec;
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

  button:hover {
    background: rgba(127,119,221,0.22);
  }

  /* ── Divider ──────────────────────────── */

  .divider {
    border: none;
    border-top: 1px solid rgba(127,119,221,0.12);
    margin: 1.2rem 0 1rem;
  }

  /* ── Back Link ────────────────────────── */

  .back-link {
    display: block;
    text-align: center;
    font-family: 'Rajdhani', sans-serif;
    font-size: 13px;
    color: rgba(0,240,255,0.5);
    letter-spacing: 1px;
    text-decoration: none;
    font-weight: 600;
    transition: color 0.15s;
  }

  .back-link:hover {
    color: #00f0ff;
  }

</style>
</head>
<body>

<div class="container">

  <div class="edit-icon">&#9998;</div>

  <div class="fx-heading">
    <h2>Update Product</h2>
    <p>MODIFY ENTRY // PRODUCT REGISTRY</p>
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

  <div class="id-badge">RECORD ID :: #<%= id.isEmpty() ? "---" : String.format("%03d", Integer.parseInt(id.isEmpty() ? "0" : id)) %></div>

  <form action="updateProduct" method="post">

    <input type="hidden" name="id" value="<%= id %>">

    <div class="form-group">
      <label>Name</label>
      <input type="text" name="name" value="<%= name %>">
    </div>

    <div class="form-group">
      <label>Description</label>
      <textarea name="description"><%= description %></textarea>
    </div>

    <div class="two-col">
      <div class="form-group">
        <label>Price</label>
        <input type="text" name="price" value="<%= price %>">
      </div>
      <div class="form-group">
        <label>Stock</label>
        <input type="text" name="stock" value="<%= stock %>">
      </div>
    </div>

    <button type="submit">&#9998; Update Product</button>

  </form>

  <hr class="divider">

  <a href="dashboard" class="back-link">&#8592; Back to Dashboard</a>

</div>

</body>
</html>
