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
<link href="<c:url value="css/app.css" />" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Register</title>
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
              <a class="nav-link" href="/login">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/registration">Register</a>
            </li>
          </ul>
        </div>
      </nav><br/>
      <div class = "container register-container"><br/>
        <h3 class = "register-header">Register Customer</h3>
        <h6 class = "register-instructions">Please fill in your information below:</h6><br/><br/>
        <h5 class = "register-header">Basic Info</h5>
        <form:form modelAttribute="form" class="form" action="registration" method="post" role="form" autocomplete="off">
            <fieldset>
                <form:label for="name" path="name" class="mb-0 register-form-field">Name</form:label>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <form:input type="text" path="name" name="name" id="name" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="email" path="email" class="mb-0 register-form-field">Email</form:label>
                <div class = "form-error">${emailExistsMsg}</div>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <form:input type="text" path="email" name="email" id="email" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="phoneNumber" path="phoneNumber" class="mb-0 register-form-field">Phone</form:label>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <form:input type="number" path="phoneNumber" name="phoneNumber" id="phoneNumber" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="username" path="username" class="mb-0 register-form-field">Username</form:label>
                <div class = "form-error">${usernameExistsMsg}</div>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <form:input type="text" path="username" name="username" id="username" class="form-control" required=""/>
                    </div>
                </div><br/>
                <form:label for="password" path="password" class="mb-0 register-form-field">Password</form:label>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <form:input type="password" path="password" name="password" id="password" class="form-control" required=""/>
                    </div>
                </div><br/><br/>
                <h5 class = "register-header">Billing Address</h5>
                <label for="streetName" class="mb-0 register-form-field">Street Name</label>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <input type="text" name="streetName" id="streetName" class="form-control" required="">
                    </div>
                </div><br/>
                <label for="apartmentNo" class="mb-0 register-form-field">Apartment No.</label>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <input type="number" name="apartmentNo" id="apartmentNo" class="form-control">
                    </div>
                </div><br/>
                <label for="city" class="mb-0 register-form-field">City</label>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <input type="text" name="city" id="city" class="form-control" required="">
                    </div>
                </div><br/>
                <label for="state" class="mb-0 register-form-field">State</label>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <input type="text" name="state" id="state" class="form-control" required="">
                    </div>
                </div><br/>
                <label for="country" class="mb-0 register-form-field">Country</label>
                <div class="row mb-1">
                    <div class="col-lg-11">
                        <input type="text" name="country" id="country" class="form-control" required="">
                    </div>
                </div><br/>

                <button type="submit" class="btn btn-primary btn-sm">Submit</button>
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