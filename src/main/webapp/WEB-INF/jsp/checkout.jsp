<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="zxx">

            <head>
                <meta charset="UTF-8">
                <meta name="description" content="Cake Template">
                <meta name="keywords" content="Cake, unica, creative, html">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Cake | Template</title>

                <!-- Google Font -->
                <link
                    href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
                    rel="stylesheet">
                <link
                    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
                    rel="stylesheet">

                <!-- Css Styles -->
                <link rel="stylesheet" href="<c:url value= '/css/bootstrap.min.css'/>" type="text/css">

                <link rel="stylesheet" href="<c:url value= '/css/flaticon.css'/>" type="text/css">
                <link rel="stylesheet" href="<c:url value= '/css/barfiller.css'/>" type="text/css">
                <link rel="stylesheet" href="<c:url value= '/css/magnific-popup.css'/>" type="text/css">
                <link rel="stylesheet" href="<c:url value= '/css/font-awesome.min.css'/>" type="text/css">
                <link rel="stylesheet" href="<c:url value= '/css/elegant-icons.css'/>" type="text/css">
                <link rel="stylesheet" href="<c:url value= '/css/nice-select.css'/>" type="text/css">
                <link rel="stylesheet" href="<c:url value= '/css/owl.carousel.min.css'/>" type="text/css">
                <link rel="stylesheet" href="<c:url value= '/css/slicknav.min.css'/>" type="text/css">
                <link rel="stylesheet" href="<c:url value= '/css/style.css'/>" type="text/css">
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
                            <a href="#" class="search-switch"><img src="<c:url value='/img/icon/search.png'/>"
                                    alt=""></a>
                            <a href="#"><img src="<c:url value='/img/icon/heart.png'/>" alt=""></a>
                        </div>
                        <div class="offcanvas__cart__item">
                            <a href="#"><img src="<c:url value='/img/icon/cart.png'/>" alt=""> <span>0</span></a>
                        </div>
                    </div>
                    <div class="offcanvas__logo">
                        <a href="/"><img src="<c:url value='/img/logo.png'/>" alt=""></a>
                    </div>
                    <div id="mobile-menu-wrap"></div>
                    <div class="offcanvas__option">
                        <ul>
                            <li>USD <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li>EUR</li>
                                    <li>USD</li>
                                </ul>
                            </li>
                            <li>ENG <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li>Spanish</li>
                                    <li>ENG</li>
                                </ul>
                            </li>
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
                                                <li>USD <span class="arrow_carrot-down"></span>
                                                    <ul>
                                                        <li>EUR</li>
                                                        <li>USD</li>
                                                    </ul>
                                                </li>
                                                <li>ENG <span class="arrow_carrot-down"></span>
                                                    <ul>
                                                        <li>Spanish</li>
                                                        <li>ENG</li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
                                            </ul>
                                        </div>
                                        <div class="header__logo">
                                            <a href="/"><img src="<c:url value='/img/logo.png'/>" alt=""></a>
                                        </div>
                                        <div class="header__top__right">
                                            <div class="header__top__right__links">
                                                <a href="#" class="search-switch"><img
                                                        src="<c:url value='/img/icon/search.png'/>" alt=""></a>
                                                <a href="#"><img src="<c:url value='/img/icon/heart.png'/>" alt=""></a>
                                            </div>
                                            <div class="header__top__right__cart">
                                                <a href="#"><img src="<c:url value='/img/icon/cart.png'/>" alt="">
                                                    <span>0</span></a>
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
                                        <li><a href="/">Home</a></li>
                                        <li><a href="./about.html">About</a></li>
                                        <li class="active"><a href="./shop.html">Shop</a></li>
                                        <li><a href="#">Pages</a>
                                            <ul class="dropdown">
                                                <li><a href="./shop-details.html">Shop Details</a></li>
                                                <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                                <li><a href="./checkout.html">Check Out</a></li>
                                                <li><a href="./wisslist.html">Wisslist</a></li>
                                                <li><a href="./Class.html">Class</a></li>
                                                <li><a href="./blog-details.html">Blog Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="./blog.html">Blog</a></li>
                                        <li><a href="./contact.html">Contact</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- Header Section End -->

                <!-- Breadcrumb Begin -->
                <div class="breadcrumb-option">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="breadcrumb__text">
                                    <h2>Checkout</h2>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="breadcrumb__links">
                                    <a href="/">Home</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb End -->

                <!-- Checkout Section Begin -->
                <section class="checkout spad">
                    <div class="container">
                        <div class="checkout__form">
                            <form action="#">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="checkout__order">
                                            <h6 class="order__title">THANH TOÁN ${status}</h6>
                                            <c:if test="${status eq 'THÀNH CÔNG'}">
                                                <div class="checkout__order__products">Cảm ơn bạn đã mua hàng</div>
                                            </c:if>
                                            <ul class="checkout__total__all">
                                                <li>Tổng đơn hàng: <span>${amount},000 VNĐ</span></li>
                                            </ul>

                                        </div>
                                    </div>
                            </form>
                            <div class="shopping__cart__table">
                                <table style="width: 1000px;">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Checkout Section End -->
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var cartItemsJson = sessionStorage.getItem("cartItems");
                        cartItemsJson = JSON.parse(cartItemsJson);
                        cartItemsJson.forEach(function (item) {
                            // Tạo một dòng mới
                            var row = document.createElement('tr');

                            // Thêm cột Product
                            var productCell = document.createElement('td');
                            productCell.textContent = item.product.title;
                            row.appendChild(productCell);

                            // Thêm cột Quantity (ở đây mình để Quantity là 1, bạn có thể điều chỉnh tùy theo yêu cầu)
                            var quantityCell = document.createElement('td');
                            quantityCell.textContent = item.quantity;
                            row.appendChild(quantityCell);

                            // Thêm cột Total
                            var totalCell = document.createElement('td');
                            totalCell.textContent = (item.product.price * item.quantity).toLocaleString();
                            row.appendChild(totalCell);

                            // Thêm dòng vào tbody của bảng
                            document.querySelector('table tbody').appendChild(row);
                        });
                        sessionStorage.removeItem("cartItems");
                        sessionStorage.removeItem("total");
                        sessionStorage.removeItem("note");
                        sessionStorage.removeItem("name");
                        sessionStorage.removeItem("address");
                        sessionStorage.removeItem("phone");


                    });
                </script>
                <jsp:include page="/WEB-INF/jsp/footer.jsp" />
            </body>

            </html>