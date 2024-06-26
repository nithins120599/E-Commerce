<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logged Out</title>
<!-- Link Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<!-- Custom CSS -->
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .header {
        background-color: #343a40;
        color: #fff;
        padding: 20px;
        text-align: center;
    }
    .cart-icon {
        font-size: 36px;
        margin-right: 10px;
    }
    .success-message {
        color: green;
        text-align: center;
        margin-top: 50px;
    }
    .btn-back {
        margin-top: 20px;
        
    }
</style>
</head>
<body>

<header class="header">
    <div>
        <i class="fas fa-shopping-cart cart-icon"></i>
    </div>
    <h1>E-commerce</h1>
</header>

<%
    session.invalidate();
%>

<div class="container text-center">
    <h2 class="success-message">You have been successfully logged out</h2>
    <button type="button" class="btn btn-outline-success btn-back"
        onclick="window.location.href='Index.jsp'">Back to Index page</button>
</div>

<!-- Scripts -->
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
