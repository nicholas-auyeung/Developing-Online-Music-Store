<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Home</title>
</head>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #808080;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Le's Music Store</a>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item px-3">
        <a class="nav-link active navbarlink" aria-current="page" href="index.html">Home</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link active navbarlink" aria-current="page" href="menu.html">Products</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link active navbarlink" aria-current="page" href="locations.html">About</a>
      </li>
      <li class="nav-item px-3 navbarlink">
        <a class="nav-link active" aria-current="page" href="contact.html">Login</a>
      </li>
      <li class="nav-item px-3 navbarlink">
        <a class="nav-link active" aria-current="page" href="contact.html">Register</a>
      </li>
    </ul>
  </div>
</nav>
<body>

<a href="/dashboard">Dashboard</a>
<a href="/admindashboard">Admin Dashboard</a>
<a href="/logout" th:href="@{/logout}"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
</body>
</html>