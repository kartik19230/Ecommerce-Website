<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
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
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 2rem;
  }

  /* ── Logo Bar ─────────────────────────── */

  .site-logo {
    font-size: 24px;
    font-weight: 700;
    font-style: italic;
    color: #2874f0;
    margin-bottom: 1.5rem;
    letter-spacing: -0.5px;
  }

  .site-logo span { color: #ff9f00; }

  /* ── Card ─────────────────────────────── */

  .container {
    width: 100%;
    max-width: 420px;
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    padding: 2rem;
    box-shadow: 0 2px 8px rgba(0,0,0,0.07);
  }

  /* ── Heading ──────────────────────────── */

  .fx-heading h2 {
    font-size: 20px;
    font-weight: 700;
    color: #212121;
    margin-bottom: 1.5rem;
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

  input {
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

  input::placeholder {
    color: #bdbdbd;
  }

  input:focus {
    border-color: #2874f0;
    box-shadow: 0 0 0 3px rgba(40,116,240,0.1);
  }

  /* ── Button ───────────────────────────── */

  button {
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
    margin-top: 4px;
    transition: background 0.15s;
    letter-spacing: 0.3px;
  }

  button:hover {
    background: #e8900a;
  }

  /* ── Divider ──────────────────────────── */

  .divider {
    display: flex;
    align-items: center;
    gap: 10px;
    margin: 1.3rem 0;
    color: #9e9e9e;
    font-size: 12px;
  }

  .divider::before,
  .divider::after {
    content: '';
    flex: 1;
    border-top: 1px solid #e0e0e0;
  }

  /* ── Login Link ───────────────────────── */

  .login-link {
    text-align: center;
    font-size: 13px;
    color: #616161;
  }

  .login-link a {
    color: #2874f0;
    text-decoration: none;
    font-weight: 600;
  }

  .login-link a:hover {
    text-decoration: underline;
  }

  /* ── Error Messages ───────────────────── */

  .error-block {
    margin-top: 1rem;
  }

  .error-msg {
    display: block;
    color: #d32f2f;
    font-size: 12px;
    font-family: 'Inter', sans-serif;
    margin-bottom: 6px;
    padding: 8px 10px;
    background: #fdecea;
    border-left: 3px solid #f44336;
    border-radius: 0 3px 3px 0;
  }

  /* ── Footer ───────────────────────────── */

  .page-footer {
    margin-top: 1.5rem;
    font-size: 11px;
    color: #9e9e9e;
    text-align: center;
    letter-spacing: 0.5px;
  }

</style>
</head>
<body>

<div class="site-logo">Shop<span>Admin</span></div>

<div class="container">

  <div class="fx-heading">
    <h2>Create your account</h2>
  </div>

  <form action="register" method="post">

    <div class="form-group">
      <label>Full Name</label>
      <input type="text" name="name" placeholder="Enter your name" required>
    </div>

    <div class="form-group">
      <label>Email address</label>
      <input type="email" name="email" placeholder="Enter your email" required>
    </div>

    <div class="form-group">
      <label>Password</label>
      <input type="password" name="password" placeholder="Create a password" required>
    </div>

    <button type="submit">Create Account</button>

  </form>

  <div class="divider">or</div>

  <div class="login-link">
    Already have an account?
    <a href="login.jsp">Login</a>
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
    <span class="error-msg">&#9888; <%= error %></span>
<%
  }
%>
  </div>
<%
}
%>

</div>

<div class="page-footer">ECOMMERCE ADMIN PANEL &bull; ALL RIGHTS RESERVED</div>

</body>
</html>
