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
<title>Customer</title>
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
      <div class = "container customer-banner">
        <h1 class = "customer-banner-text">Customer</h1>
        <h6 class = "customer-banner-text">Customer details</h6>
      </div>
      <h5 class = "customer-header">Customer Details</h5>
      <div class = "container customer-container"><br/>
        <form:form modelAttribute="form" class="form" action="userdashboard" method="post" role="form" autocomplete="off">
            <fieldset>
            	<form:hidden path="id" />
            	<form:hidden path="billingId" />
            	<form:hidden path="username" />
            	<form:hidden path="password" />
                <form:label for="name" path="name" class="mb-0 customer-form-field">Name</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="name" name="name" id="name" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="email" path="email" class="mb-0 customer-form-field">Email</form:label>
                <div class = "form-error">${emailExistsMsg}</div>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="email" name="email" id="email" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="phoneNumber" path="phoneNumber" class="mb-0 customer-form-field">Phone</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="number" path="phoneNumber" name="phoneNumber" id="phoneNumber" class="form-control" required=""/>
                    </div>
                </div><br/>
           		<form:form modelAttribute="form2" class="form" action="registration" method="post" role="form" autocomplete="off">
           		<form:hidden path="bId" />
                <form:label for="streetName" path="streetName" class="mb-0 customer-form-field">Street Name</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="streetName" name="streetName" id="streetName" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="apartmentNo" path="apartmentNo" class="mb-0 customer-form-field">Apartment No.</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="number" path="apartmentNo" name="apartmentNo" id="apartmentNo" class="form-control"/>
                    </div>
                </div><br/>
                <form:label for="city" path="city" class="mb-0 customer-form-field">City</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="city" name="city" id="city" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="state" path="state" class="mb-0 customer-form-field">State</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="state" name="state" id="state" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="country" path="country" class="mb-0 customer-form-field">Country</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="text" path="country" name="country" id="country" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="zipCode" path="zipCode" class="mb-0 customer-form-field">Zip Code</form:label>
                <div class="row mb-1">
                    <div class="col-lg-3">
                        <form:input type="number" path="zipCode" name="zipCode" id="zipCode" class="form-control" required=""/>
                    </div>
                </div><br/>

                <button type="submit" class="btn btn-primary btn-sm inline">Submit</button>
                <a class="btn btn-sm customer-cancel" href="/userhome" role="button">Cancel</a>
        </form:form>
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