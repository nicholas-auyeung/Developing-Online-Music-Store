<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/app.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Product Details</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light navbar-login">
        <div class="navbar-collapse collapse" id="navbarSupportedContent">
            <a class="navbar-brand" href="#">Le's Music Store</a>
          <ul class="navbar-nav mr-auto" id="text">
            <li class="nav-item active">
              <a class="nav-link" href="/home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/products">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/about">About</a>
              </li>
          </ul>
          <ul class="navbar-nav ml-auto" id="text">
          	<li class="nav-item active">
                <a class="nav-link" href="/userdashboard">Welcome ${currentSessionUsername}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout" th:href="@{/logout}">Logout</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/cart">Cart</a>
            </li>
            </li>
          </ul>
        </div>
      </nav>
      <div class = "container product-banner">
        <h3 class = "product-detail-banner-text">Product Detail</h3>
        <h6 class = "product-detail-banner-text">Here is the detail information of the product!</h6>
      </div>
      <div class = "container product-details-container">
        <div class="card mb-3 product-details-card">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="${productDetails.image}" alt="product details image" class = "product-details-image">
              </div>
              <div class="col-md-3">
                <div class="card-body">
                  <h5 class="card-title">${productDetails.name}</h5>
                  <p class="card-text">Manufacturer: ${productDetails.manufacturer}</p>
                  <p class="card-text">Category: ${productDetails.category}</p>
                  <p class="card-text">Condition: ${productDetails.pcondition}</p>
                  <p class="card-text">${productDetails.price}</p>
                  <form action="/userproductdetails/${productDetails.id}" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<a class="btn inline product-detail-back" href="/userproducts" role="button"> Back</a>
					<input type="submit" class="btn inline product-detail-order-now"  value="Order Now">
				</form>
                </div>
              </div>
            </div>
          </div>
      </div>
<footer class="bg-light text-center text-lg-start footer">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
      © 2021 Copyright:
      <a class="text-dark" href="#">Le's Music Store</a>
    </div>
</footer>
</body>
</html>