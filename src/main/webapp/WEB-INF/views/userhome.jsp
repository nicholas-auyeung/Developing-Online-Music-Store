<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<link href="<c:url value="css/app.css" />" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light navbar-home">
        <div class="navbar-collapse collapse" id="navbarSupportedContent">
            <a class="navbar-brand" href="#">Le's Music Store</a>
          <ul class="navbar-nav mr-auto" id="text">
            <li class="nav-item active">
              <a class="nav-link" href="/userhome">Home</a>
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
      <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
          <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"></li>
          <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></li>
          <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="https://images.creativemarket.com/0.1.0/ps/519548/300/200/m2/fpe/wm0/h9ztnazutzwe50vstcoltsyabeyrlqdrmx7jwpxdhhinpihcwsd5wbffvtayv6ma-.jpg?1433966432&s=5ccaa455a0c4b9e5c77539afb3d631cd" class="d-block w-100" alt="headphones and piano">
            <div class="carousel-caption d-none d-md-block">
              <h5>It's A Jazz Affair</h5>
              <p>Through ups and downs, Somehow I manage to survive in life.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="https://www.mural-wallpaper.com/wp-content/uploads/2019/06/A-M25.jpeg" class="d-block w-100" alt="instruments">
            <div class="carousel-caption d-none d-md-block">
              <h5>Let's make some music</h5>
              <p>Variety of instruments to make a variety of sounds.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="https://www.grammy.com/sites/com/files/styles/news_detail_header/public/turntable-1328823_1280.jpg?itok=CpFKZ2EO" class="d-block w-100" alt="turn table">
            <div class="carousel-caption d-none d-md-block">
              <h5>Save it</h5>
              <p>Never forget the sounds you hear.</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </a>
      </div>
      <div class="row row-cols-1 row-cols-md-3 g-4 card-group ">
        <div class="col">
        <div class = "col-md-7">
          <div class="card h-100">
            <img src="https://images.all-free-download.com/images/graphiclarge/black_symbols_musical_instruments_312550.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Instruments</h5>
              <p class="card-text">We got all the instruments you can think of.</p>
            </div>
          </div>
        </div>
        </div>
        <div class="col">
        <div class = "col-md-7">
          <div class="card h-100">
            <img src="https://images.fineartamerica.com/images-medium-large-5/vinyl-record-on-white-background-tetra-images.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Vinyl Records</h5>
              <p class="card-text">Check out the wide selection we got.</p>
            </div>
          </div>
        </div>
        </div>
        <div class="col">
        <div class = "col-md-7">
          <div class="card h-100">
            <img src="https://ae01.alicdn.com/kf/HTB1dkUUO3HqK1RjSZFPq6AwapXaB.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Accessories</h5>
              <p class="card-text">Think of an accessory, we got it.</p>
            </div>
          </div>
          </div>
        </div>
      </div>
<footer class="bg-light text-center text-lg-start footer">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
      © 2021 Copyright:
      <a class="text-dark" href="#">Le's Music Store</a>
    </div>
</footer>
</body>
</html>