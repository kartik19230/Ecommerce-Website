<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<style>

    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body{
        background-color: #f2f2f2;
    }

    .container{
        width: 400px;
        background-color: white;
        margin: 80px auto;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px gray;
    }

    h2{
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    .form-group{
        margin-bottom: 18px;
    }

    label{
        display: block;
        margin-bottom: 6px;
        font-weight: bold;
    }

    input{
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
    }

    input:focus{
        outline: none;
        border-color: #4CAF50;
    }

    button{
        width: 100%;
        padding: 12px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover{
        background-color: #45a049;
    }

    .login-link{
        text-align: center;
        margin-top: 15px;
    }

    .login-link a{
        text-decoration: none;
        color: blue;
    }

</style>

</head>
<body>

    <div class="container">

        <h2>User Registration</h2>

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

            <button type="submit">Register</button>

        </form>

        <div class="login-link">
            Already have an account?
            <a href="login.jsp">Login</a>
        </div>

    </div>

</body>
</html>