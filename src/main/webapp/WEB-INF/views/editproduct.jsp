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
<title>Edit Product</title>
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
      <div class = "container customer-banner">
        <h1 class = "customer-banner-text">Product</h1>
        <h6 class = "customer-banner-text">Product details</h6>
      </div>
      <h5 class = "customer-header">Product Details</h5>
      <div class = "container customer-container"><br/>
        <form:form modelAttribute="form" class="form" action="editproduct" method="post" role="form" autocomplete="off">
            <fieldset>
            	<form:hidden path="id" />
                <form:label for="name" path="name" class="mb-0 customer-form-field">Name</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="name" name="name" id="name" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="manufacturer" path="manufacturer" class="mb-0 customer-form-field">Manufacturer</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="manufacturer" name="manufacturer" id="manufacturer" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="category" path="category" class="mb-0 customer-form-field">Category</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="category" name="category" id="category" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="pcondition" path="pcondition" class="mb-0 customer-form-field">Condition</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="pcondition" name="pcondition" id="pcondition" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="image" path="image" class="mb-0 customer-form-field">Image</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="image" name="image" id="image" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="price" path="price" class="mb-0 customer-form-field">Price</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="number" path="price" name="price" id="price" class="form-control" required=""/>
                    </div>
                </div><br/>
                
                <button type="submit" class="btn btn-primary btn-sm inline">Submit</button>
                <a class="btn btn-sm customer-cancel" href="/productmanagment" role="button">Cancel</a>
        </form:form>
      </div><br/>
<footer class="bg-light text-center text-lg-start footer">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
      © 2021 Copyright:
      <a class="text-dark" href="#">Le's Music Store</a>
    </div>
</footer>
</body>
</html>