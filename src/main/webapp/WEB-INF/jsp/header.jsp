<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="zxx">

        <head>
            <meta charset="UTF-8">
            <meta name="description" content="Cake Template">
            <meta name="keywords" content="Cake, unica, creative, html">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>thu nghiem</title>

            <!-- Google Font -->
            <link
                href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
                rel="stylesheet">
            <link
                href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
                rel="stylesheet">

            <!-- Css Styles -->
            <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/flaticon.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/barfiller.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/magnific-popup.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/font-awesome.min.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/elegant-icons.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/nice-select.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/slicknav.min.css' />" type="text/css" />
            <link rel="stylesheet" href="<c:url value='/css/style.css' />" type="text/css" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.3.2/purify.min.js"></script>

        </head>

        <body>
            <!-- Page Preloder -->
            <div id="preloder">
                <div class="loader"></div>
            </div>

            <!-- Offcanvas Menu Begin -->
            <div class="offcanvas-menu-overlay"></div>
            <div class="offcanvas-menu-wrapper">
                <div class="offcanvas__cart">
                    <div class="offcanvas__cart__links">
                        <a href="#" class="search-switch"><img src="<c:url value='/img/icon/search.png' />" alt=""></a>
                        <a href="#"><img src="<c:url value='/img/icon/heart.png' />" alt=""></a>
                    </div>
                    <div class="offcanvas__cart__item">
                        <a href="/giohang"><img src="<c:url value='/img/icon/cart.png' />" alt=""> <span
                                id="totalQuantityDisplay">0
                                món</span></a>
                        <div class="cart__price">Cart: <span class="totalQuantityDisplay">0 món</span></div>
                    </div>
                </div>
                <div class="offcanvas__logo">
                    <a href="/"><img src="<c:url value='/img/logo.png' />" alt=""></a>
                </div>
                <div id="mobile-menu-wrap"></div>
                <div class="offcanvas__option">
                    <ul>
                        <li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
                    </ul>
                </div>
            </div>
            <!-- Offcanvas Menu End -->

            <!-- Header Section Begin -->
            <header class="header">
                <div class="header__top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="header__top__inner">
                                    <div class="header__top__left">
                                        <ul>
                                            <li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
                                        </ul>
                                    </div>
                                    <div class="header__logo">
                                        <a href="/"><img src="<c:url value=" /img/logo.png" />" alt=""></a>
                                    </div>
                                    <div class="header__top__right">
                                        <div class="header__top__right__links">
                                            <a href="#" class="search-switch"><img src="<c:url value="
                                                    /img/icon/search.png" />" alt=""></a>
                                        </div>
                                        <div class="header__top__right__cart">
                                            <a href="/giohang"><img src="<c:url value=" /img/icon/cart.png" />" alt="">
                                                <div class="cart__price" id="countDrink"> 0 món
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="canvas__open"><i class="fa fa-bars"></i></div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <nav class="header__menu mobile-menu">
                                <ul>
                                    <li class="active"><a href="/">Trang Chủ</a></li>
                                    <li><a href="./about.html">Liên hệ</a></li>
                                    <li><a href="./shop.html">Mua Hàng</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var totalQuantityDisplay = document.querySelector("#countDrink");
                        var cartItems = JSON.parse(sessionStorage.getItem("cartItems")) || [];
                        totalQuantityDisplay.textContent = cartItems.length.toString() + " món";
                    });
                </script>
            </header>
            <!-- Header Section End -->

        </body>

        </html>