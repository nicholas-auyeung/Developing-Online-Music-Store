<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
</head>
<body>
	
	<h1>Product Details</h1>
	<h3>${productDetails.name}</h3>
	<form action="/productdetails/${productDetails.id}" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Add to Cart" />
	</form>
</body>
</html>