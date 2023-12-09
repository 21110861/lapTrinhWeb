<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="zxx">
        <jsp:include page="/WEB-INF/jsp/header.jsp" />

        <body>
            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="breadcrumb__text">
                                <h2>Product detail</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- Shop Details Section Begin -->
            <section class="product-details spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product__details__img">
                                <div class="product__details__big__img">
                                    <img class="big_img" src="img/shop/details/product-big-1.jpg" alt="">
                                </div>
                                <div class="product__details__thumb">
                                    <div class="pt__item active">
                                        <img data-imgbigurl="img/shop/details/product-big-2.jpg"
                                            src="img/shop/details/product-big-2.jpg" alt="">
                                    </div>
                                    <div class="pt__item">
                                        <img data-imgbigurl="img/shop/details/product-big-1.jpg"
                                            src="img/shop/details/product-big-1.jpg" alt="">
                                    </div>
                                    <div class="pt__item">
                                        <img data-imgbigurl="img/shop/details/product-big-4.jpg"
                                            src="img/shop/details/product-big-4.jpg" alt="">
                                    </div>
                                    <div class="pt__item">
                                        <img data-imgbigurl="img/shop/details/product-big-3.jpg"
                                            src="img/shop/details/product-big-3.jpg" alt="">
                                    </div>
                                    <div class="pt__item">
                                        <img data-imgbigurl="img/shop/details/product-big-5.jpg"
                                            src="img/shop/details/product-big-5.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product__details__text">
                                <div class="product__label">${chosenProduct.category.name}</div>
                                <h4>${chosenProduct.title}</h4>
                                <h5>${chosenProduct/1000},000 VNĐ</h5>
                                <p>${product.information}</p>
                                <ul>
                                    <li>Category: <span>${chosenProduct.category.name}</span></li>
                                </ul>
                                <div class="product__details__option">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                    </div>
                                    <a href="#" class="primary-btn">Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product__details__tab">
                        <div class="col-lg-12">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1"
                                        role="tab">Description</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="row d-flex justify-content-center">
                                        <div class="col-lg-8">
                                            <p>${chosenProduct.description}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shop Details Section End -->

            <!-- Related Products Section Begin -->
            <section class="related-products spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="section-title">
                                <h2>Related Products</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="related__products__slider owl-carousel">
                            <c:foreach var="product" items="${listproducts}">
                                <div class="col-lg-3">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="img/shop/product-1.jpg">
                                            <div class="product__label">
                                                <span>${product.category.name}</span>
                                            </div>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">${product.title}</a></h6>
                                            <div class="product__item__price">${product.price/1000},000 VNĐ</div>
                                            <div class="cart_add">
                                                <a href="#">Thông Tin Thêm</a>
                                            </div>
                                        </div>
                                    </div>
                            </c:foreach>
                        </div>
                    </div>
                </div>
                </div>
            </section>
            <!-- Related Products Section End -->
            <jsp:include page="/WEB-INF/jsp/footer.jsp" />
        </body>

        </html>