<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Web Của Bạn</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css' />" />
</head>
<body>

<nav>
    <div>
        <a href="/admin" >ADMIN SITE</a>
    </div>
    <div sec:authorize="isAuthenticated()">
        <a href="/logout">LOGOUT</a>
    </div>
    <div class="user">
        <span><c:out value="${pageContext.request.userPrincipal.name}" /></span>
    </div>
</nav>

<header>
    <h1>ADMIN SITE</h1>
    <img src="https://cdn.dribbble.com/users/1018473/screenshots/5804080/attachments/1251433/data-ms-illustration.jpg" alt="Ảnh lớn">
</header>

<main>
    <div class="box">
        <i class='bx bxs-coffee-togo'></i>

        <p>PRODUCT MANAGEMENT</p>
        <a class="h2" href="/admin/products">
            <button>CLICK</button>
        </a>
    </div>

    <div class="box">
        <i class='bx bxs-food-menu'></i>
        <p>CATEGORY MANAGEMENT </p>
        <a class="h2" href="/admin/categories">
            <button>CLICK</button>
        </a>
    </div>

    <div class="box">
        <i class='bx bxs-user-pin'></i>
        <p>USER MANAGEMENT</p>
        <a class="h2" href="/admin/users">
            <button>CLICK</button>
        </a>
    </div>

    <div class="box">
        <i class='bx bx-cart-download' ></i>
        <p>ORDER MANAGEMENT</p>
        <a class="h2" href="/admin/orders">
            <button>CLICK</button>
        </a>
    </div>

</main>

<footer>
    © 2023 Trang Web Của Bạn. All rights reserved.
</footer>

</body>
</html>
