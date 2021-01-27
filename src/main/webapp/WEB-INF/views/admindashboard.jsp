<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>

	<h1>Admin Dashboard</h1>
	
	<table class="table">
		<thead>
			<th scope = "col">Product ID</th>
			<th scope = "col">Photo Thumb</th>
			<th scope = "col">Product Name</th>
			<th scope = "col">Category</th>
			<th scope = "col">Condition</th>
			<th scope = "col">Price</th>
			<th scope = "col"></th>
			<th scope = "col"></th>
			<c:forEach items="${productList}" var="product">
				<tr>
					<th scope ="row">${product.id}</th>
					<td>${product.image}</td>
					<td>${product.name}</td>
					<td>${product.category}</td>
					<td>${product.image}</td>
					<td><button type="button">Delete</button></td>
			</c:forEach>
		</thead>
	
	</table>
			<a class="btn btn-outline-primary" href="/addproduct" role="button">Add Product</a>
</body>
</html>