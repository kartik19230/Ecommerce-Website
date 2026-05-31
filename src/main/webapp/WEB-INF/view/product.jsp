<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Inter',sans-serif;
    background:#f1f3f6;
    padding:40px;
}

.container{
    max-width:800px;
    margin:auto;
}

.card{
    background:#fff;
    padding:30px;
    border-radius:8px;
    box-shadow:0 4px 20px rgba(0,0,0,0.08);
}

.title{
    font-size:32px;
    font-weight:700;
    color:#212121;
    margin-bottom:20px;
}

.section{
    margin-bottom:20px;
}

.label{
    font-size:12px;
    color:#888;
    text-transform:uppercase;
    letter-spacing:1px;
    margin-bottom:6px;
}

.value{
    font-size:18px;
    color:#212121;
}

.price{
    font-size:28px;
    font-weight:700;
    color:#2874f0;
}

.stock{
    font-size:18px;
    font-weight:600;
    color:#388e3c;
}

.description{
    line-height:1.7;
    color:#555;
}

.back-btn{
    display:inline-block;
    margin-top:20px;
    text-decoration:none;
    background:#2874f0;
    color:white;
    padding:10px 18px;
    border-radius:4px;
    font-weight:600;
}

.back-btn:hover{
    background:#1a5dc8;
}

</style>

</head>
<body>

<div class="container">

    <div class="card">

        <h1 class="title">${product.name}</h1>

        <div class="section">
            <div class="label">Product ID</div>
            <div class="value">#${product.id}</div>
        </div>

        <div class="section">
            <div class="label">Category</div>
            <div class="value">
                ${product.category.name}
            </div>
        </div>

        <div class="section">
            <div class="label">Price</div>
            <div class="price">
                ₹${product.price}
            </div>
        </div>

        <div class="section">
            <div class="label">Stock Available</div>
            <div class="stock">
                ${product.stock} Units
            </div>
        </div>

        <div class="section">
            <div class="label">Description</div>
            <div class="description">
                ${product.description}
            </div>
        </div>

        <a href="dashboard" class="back-btn">
            ← Back to Dashboard
        </a>

    </div>

</div>

</body>
</html>