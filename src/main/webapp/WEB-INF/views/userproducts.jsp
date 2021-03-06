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
<link href="<c:url value="css/app.css" />" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Products</title>
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
      <div class = "container product-banner">

        <h3 class = "product-banner-text">All Products</h3>
        <h6 class = "product-banner-text">Checkout all the awesome products available now!</h6>

      </div>
      <div class = "container product-table-container">
        <input class = "product-search" type="text" id="myInput" onkeyup="searchProducts()" placeholder="" title="Search Products"><a class ="search-caption">Search:</a> <br/><br/>
<table id="myTable" class="table product-table">
		<thead class = "product-table-thead">
			<th scope = "col">Photo Thumb</th>
			<th scope = "col">Product Name</th>
			<th scope = "col">Category</th>
			<th scope = "col">Condition</th>
			<th scope = "col">Price</th>
			<th scope = "col"></th>
        </thead>
			<c:forEach items="${productList}" var="product">
				<tr>
					<th scope ="row"><img src="${product.image}" alt="product image" class = "product-table-image"></th>
					<td>${product.name}</td>
					<td>${product.category}</td>
					<td>${product.pcondition}</td>
					<td>${product.price}</td>
					<td><a href="/userproductdetails/${product.id}"><i class="fa fa-info-circle"></i></a></td>
			</c:forEach>
</table>
</div>
<footer class="bg-light text-center text-lg-start footer">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
      © 2021 Copyright:
      <a class="text-dark" href="#">Le's Music Store</a>
    </div>
</footer>
<script src="js/product.js"></script>
</body>
</html>