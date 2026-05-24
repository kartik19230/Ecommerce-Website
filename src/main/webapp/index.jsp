<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
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

  /* ── Heading ──────────────────────────── */

  .fx-heading {
    text-align: center;
    margin-bottom: 1.8rem;
  }

  .fx-heading h2 {
    font-size: 24px;
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
    margin-bottom: 16px;
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

  input {
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

  input::placeholder {
    color: rgba(140,170,190,0.3);
  }

  input:focus {
    border-color: #00f0ff;
  }

  /* ── Button ───────────────────────────── */

  button {
    width: 100%;
    padding: 12px;
    background: transparent;
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

  button:hover {
    background: rgba(0,240,255,0.12);
  }

  /* ── Divider ──────────────────────────── */

  .divider {
    border: none;
    border-top: 1px solid rgba(0,240,255,0.1);
    margin: 1.4rem 0 1.1rem;
  }

  /* ── Login Link ───────────────────────── */

  .login-link {
    text-align: center;
    font-size: 13px;
    color: rgba(140,170,190,0.6);
    letter-spacing: 1px;
  }

  .login-link a {
    color: #afa9ec;
    text-decoration: none;
    font-weight: 600;
    transition: color 0.15s;
  }

  .login-link a:hover {
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
    padding-left: 4px;
    border-left: 2px solid #ff4d6d;
    padding: 4px 8px;
    background: rgba(255,77,109,0.07);
    border-radius: 0 4px 4px 0;
  }

</style>
</head>
<body>

<div class="container">

  <div class="fx-heading">
    <h2>User Registration</h2>
    <p>INITIALIZE NEW ACCOUNT // SECURE CHANNEL</p>
  </div>

  <form action="register" method="post">

    <div class="form-group">
      <label>Name</label>
      <input type="text" name="name" placeholder="Enter your name" required>
    </div>

    <div class="form-group">
      <label>Email</label>
      <input type="email" name="email" placeholder="Enter your email" required>
    </div>

    <div class="form-group">
      <label>Password</label>
      <input type="password" name="password" placeholder="Enter your password" required>
    </div>

    <button type="submit">&#9655; Register</button>

  </form>

  <hr class="divider">

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

</body>
</html>
