<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
    max-width: 400px;
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

  /* ── Lock Icon ────────────────────────── */

  .lock-icon {
    text-align: center;
    font-size: 28px;
    color: rgba(0,240,255,0.25);
    margin-bottom: 1rem;
  }

  /* ── Heading ──────────────────────────── */

  .fx-heading {
    text-align: center;
    margin-bottom: 1.8rem;
  }

  h2 {
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

  button:hover {
    background: rgba(0,240,255,0.18);
  }

  /* ── Divider ──────────────────────────── */

  .divider {
    border: none;
    border-top: 1px solid rgba(0,240,255,0.1);
    margin: 1.4rem 0 1.1rem;
  }

  /* ── Register Link ────────────────────── */

  .register-link {
    text-align: center;
    font-size: 13px;
    color: rgba(140,170,190,0.6);
    letter-spacing: 1px;
  }

  .register-link a {
    color: #afa9ec;
    text-decoration: none;
    font-weight: 600;
    transition: color 0.15s;
  }

  .register-link a:hover {
    color: #7f77dd;
  }

</style>
</head>
<body>

<div class="container">

  <div class="lock-icon">&#128274;</div>

  <div class="fx-heading">
    <h2>User Login</h2>
    <p>AUTHENTICATE // SECURE ACCESS PORTAL</p>
  </div>

  <form action="login" method="post">

    <div class="form-group">
      <label>Email</label>
      <input type="email"
        name="email"
        placeholder="Enter your email"
        required>
    </div>

    <div class="form-group">
      <label>Password</label>
      <input type="password"
        name="password"
        placeholder="Enter your password"
        required>
    </div>

    <button type="submit">&#9655; Login</button>

  </form>

  <hr class="divider">

  <div class="register-link">
    Don't have an account?
    <a href="index.jsp">Register</a>
  </div>

</div>

</body>
</html>
