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
<title>Receipt</title>
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
              <a class="nav-link" href="/logout" th:href="@{/logout}">Logout</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/cart">Cart</a>
          </li>
          </ul>
        </div>
      </nav>
      <div class = "container order-banner">
        <h1 class = "order-banner-text">Order</h1>
        <h6 class = "order-banner-text">Order Confirmation</h6>
      </div>
      <div class = "container order-container"><br/>
        <h2 class="receipt-header">Receipt</h2>
        <h6>Shipping Address</h6>
        ${currentSessionBillingAddress.streetName}<br/>
        ${currentSessionBillingAddress.city}
        <h6>Billing Address</h6>
        ${currentSessionBillingAddress.streetName}<br/>
        ${currentSessionBillingAddress.city}${currentSessionBillingAddress.state}<br/>
        ${currentSessionBillingAddress.country}<br/>
        <table id="myTable" class="table order-table">
            <thead class = "order-table-thead">
              <th scope = "col">Product</th>
              <th scope = "col">#</th>
              <th scope = "col">Price</th>
              <th scope = "col">Total</th>
                </thead>
              <c:forEach items="${listOrderDetails}" var="orderDetails">
                <tr>
                  <th scope ="row">${orderDetails.name}</th>
                  <td>${orderDetails.quantity}</td>
                  <td>${orderDetails.price}</td>
                  <td>${product.qprice}</td>
              </c:forEach>
        </table>
        <a class="cart-grand-total-price inline">${totalPrice}</a><a class="cart-grand-total inline">Grand Total:</a>
      </div><br/>
      <a class="btn order-back-button inline" href="/cart" role="button">back</a>
      <a class="btn btn-success submit-order-button inline" href="/submitordersuccess" role="button">Submit Order</a>
      <a class="btn order-cancel-button" href="/userhome" role="button">Cancel</a>
<br/><footer class="bg-light text-center text-lg-start footer">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
      © 2021 Copyright:
      <a class="text-dark" href="#">Le's Music Store</a>
    </div>
</footer>
</body>
</html>