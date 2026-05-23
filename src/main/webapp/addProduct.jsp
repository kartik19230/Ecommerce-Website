<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>

<style>

    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
        font-family:Arial, sans-serif;
    }

    body{
        background-color:#f4f6f9;
        display:flex;
        justify-content:center;
        align-items:center;
        height:100vh;
    }

    .container{
        background:white;
        width:400px;
        padding:30px;
        border-radius:10px;
        box-shadow:0 0 10px rgba(0,0,0,0.1);
    }

    h1{
        text-align:center;
        margin-bottom:25px;
        color:#333;
    }

    .form-group{
        margin-bottom:18px;
    }

    label{
        display:block;
        margin-bottom:6px;
        font-weight:bold;
        color:#555;
    }

    input, textarea{
        width:100%;
        padding:10px;
        border:1px solid #ccc;
        border-radius:5px;
        font-size:14px;
    }

    textarea{
        resize:none;
        height:100px;
    }

    .btn{
        width:100%;
        padding:12px;
        background-color:#007bff;
        color:white;
        border:none;
        border-radius:5px;
        font-size:16px;
        cursor:pointer;
    }

    .btn:hover{
        background-color:#0056b3;
    }

    .back-link{
        display:block;
        text-align:center;
        margin-top:15px;
        text-decoration:none;
        color:#007bff;
    }

    .back-link:hover{
        text-decoration:underline;
    }

</style>

</head>
<body>

    <div class="container">

        <h1>Add Product</h1>

        <form action="addProduct" method="post">

            <div class="form-group">
                <label>Product Name</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea name="description" required></textarea>
            </div>

            <div class="form-group">
                <label>Price</label>
                <input type="number" step="0.01" name="price" required>
            </div>

            <div class="form-group">
                <label>Stock</label>
                <input type="number" name="stock" required>
            </div>

            <button type="submit" class="btn">
                Add Product
            </button>

        </form>

        <a href="dashboard.jsp" class="back-link">
            Back to Dashboard
        </a>

    </div>

</body>
</html>