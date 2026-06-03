<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>

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
    color:#212121;
}

.topbar{
    background:#2874f0;
    height:56px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 2rem;
}

.logo{
    color:white;
    text-decoration:none;
    font-size:20px;
    font-weight:700;
}

.logo span{
    color:#ffe500;
}

.cart-container{
    max-width:1200px;
    margin:2rem auto;
    padding:0 1rem;
}

.page-title{
    font-size:28px;
    font-weight:700;
    margin-bottom:1.5rem;
}

.cart-wrapper{
    display:grid;
    grid-template-columns: 2fr 1fr;
    gap:1.5rem;
}

.cart-items{
    background:white;
    border-radius:8px;
    overflow:hidden;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

.cart-header{
    background:#fafafa;
    padding:1rem;
    border-bottom:1px solid #eee;
    font-weight:600;
}

.cart-item{
    display:grid;
    grid-template-columns: 2fr 1fr 1fr 1fr;
    align-items:center;
    padding:1rem;
    border-bottom:1px solid #f0f0f0;
}

.cart-item:last-child{
    border-bottom:none;
}

.product-name{
    font-weight:600;
}

.price{
    color:#2874f0;
    font-weight:600;
}

.quantity{
    text-align:center;
}

.subtotal{
    font-weight:700;
}

.summary{
    background:white;
    border-radius:8px;
    padding:1.5rem;
    height:fit-content;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

.summary-title{
    font-size:18px;
    font-weight:700;
    margin-bottom:1rem;
}

.summary-row{
    display:flex;
    justify-content:space-between;
    margin-bottom:1rem;
}

.total{
    border-top:1px solid #eee;
    padding-top:1rem;
    font-size:20px;
    font-weight:700;
}

.btn{
    display:block;
    width:100%;
    padding:12px;
    border:none;
    border-radius:4px;
    font-weight:600;
    cursor:pointer;
    text-decoration:none;
    text-align:center;
    margin-top:1rem;
}

.btn-primary{
    background:#2874f0;
    color:white;
}

.btn-primary:hover{
    background:#1a5dc8;
}

.btn-secondary{
    background:#f1f3f6;
    color:#212121;
}

.btn-secondary:hover{
    background:#e0e0e0;
}

.empty-cart{
    background:white;
    padding:3rem;
    text-align:center;
    border-radius:8px;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

</style>

</head>
<body>

<div class="topbar">
    <a href="dashboard" class="logo">
        Shop<span>Admin</span>
    </a>

    <a href="dashboard" style="color:white;text-decoration:none;">
        Continue Shopping
    </a>
</div>

<div class="cart-container">

    <h1 class="page-title">Shopping Cart</h1>

    <!-- REMOVE THIS SECTION LATER WHEN JSTL IS ADDED -->

    <div class="cart-wrapper">

        <div class="cart-items">

            <div class="cart-header">
                Cart Items
            </div>

            <div class="cart-item">
                <div class="product-name">iPhone 17</div>
                <div class="price">₹120000</div>
                <div class="quantity">2</div>
                <div class="subtotal">₹240000</div>
            </div>

            <div class="cart-item">
                <div class="product-name">Sony Headphones</div>
                <div class="price">₹10000</div>
                <div class="quantity">1</div>
                <div class="subtotal">₹10000</div>
            </div>

        </div>

        <div class="summary">

            <div class="summary-title">
                Order Summary
            </div>

            <div class="summary-row">
                <span>Total Items</span>
                <span>3</span>
            </div>

            <div class="summary-row total">
                <span>Total</span>
                <span>₹250000</span>
            </div>

            <a href="dashboard" class="btn btn-secondary">
                Continue Shopping
            </a>

            <a href="#" class="btn btn-primary">
                Checkout
            </a>

        </div>

    </div>

</div>

</body>
</html>