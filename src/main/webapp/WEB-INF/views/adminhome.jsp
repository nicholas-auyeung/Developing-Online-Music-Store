<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Admin Home</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light navbar-login">
        <div class="navbar-collapse collapse" id="navbarSupportedContent">
            <a class="navbar-brand" href="#">Le's Music Store</a>
          <ul class="navbar-nav mr-auto" id="text">
            <li class="nav-item active">
              <a class="nav-link" href="/adminhome">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/adminproducts">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/about">About</a>
              </li>
          </ul>
          <ul class="navbar-nav ml-auto" id="text">
          	<li class="nav-item active">
                <a class="nav-link" href="/admindashboard">Welcome ${currentSessionUsername}</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/logout" th:href="@{/logout}">Logout</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/adminhome">Admin</a>
          </li>
          </ul>
        </div>
      </nav>
      <div class = "container admin-banner">
        <h1 class = "admin-banner-text">Administrator page</h1>
        <h6 class = "admin-banner-text">This is the administrator page!</h6>
      </div>
      <div class = "container admin-container"><br/>
        <h3 class="inline">Welcome: admin |</h3><a class="inline admin-logout" href="/logout" th:href="@{/logout}">Logout</a>
        <br/><a class="product-inventory" href="/productmanagment">Product Inventory</a>
        <br/><a>Here you can view, check, and modify the product inventory!</a>
        <br/><a class="customer-managment" href="/customermanagment">Customer Management</a>
        <br/><a>Here you can manage customer information!</a>
      </div><br/>
    
<br/><footer class="bg-light text-center text-lg-start footer">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
      © 2021 Copyright:
      <a class="text-dark" href="#">Le's Music Store</a>
    </div>
</footer>
</body>
</html>