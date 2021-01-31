<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Cart</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light navbar-login">
        <div class="navbar-collapse collapse" id="navbarSupportedContent">
            <a class="navbar-brand" href="#">Le's Music Store</a>
          <ul class="navbar-nav mr-auto" id="text">
            <li class="nav-item active">
              <a class="nav-link" href="/userhome">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/userproducts">Products</a>
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
          </ul>
        </div>
      </nav>
      <div class = "container cart-banner">

        <h1 class = "cart-banner-text">Cart</h1>
        <h6 class = "cart-banner-text">All the selected products in your shopping cart</h6>

      </div>
      <a class="btn btn-outline-danger remove-all-order-details-button inline" href="/deleteallorderdetails" role="button"><i class="fa fa-times-circle"></i>Clear Cart</a>
      <a class="btn btn-outline-success checkout-order-details inline" href="/checkout" role="button"><i class="fa fa-shopping-cart"></i>Check out</a>
      <div class = "container cart-table-container">
 <table id="myTable" class="table cart-table">
     <thead class = "cart-table-thead">
       <th scope = "col">Product</th>
       <th scope = "col">Unit Price</th>
       <th scope = "col">Quantity</th>
       <th scope = "col">Price</th>
       <th scope = "col">Action</th>
         </thead>
       <c:forEach items="${listOrderDetails}" var="orderDetails">
         <tr>
           <th scope ="row">${orderDetails.name}</th>
           <td>${orderDetails.price}</td>
           <td>${orderDetails.quantity}</td>
           <td>${product.qprice}</td>
           <td><a class="btn btn-outline-danger remove-order-details-button" href="/deleteorderdetails/${orderDetails.id}" role="button"><i class="fa fa-times"></i>remove</a></td>
       </c:forEach>
 </table>
 <a class="cart-grand-total-price inline">${totalPrice}</a><a class="cart-grand-total inline">Grand Total</a>
 </div><br/>
 <a class="btn continue-shopping-button" href="/userproducts" role="button">Continue Shopping</a>
<footer class="bg-light text-center text-lg-start footer">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
      © 2021 Copyright:
      <a class="text-dark" href="#">Le's Music Store</a>
    </div>
</footer>
</body>
</html>