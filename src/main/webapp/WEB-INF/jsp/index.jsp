<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="zxx">

            <jsp:include page="/WEB-INF/jsp/header.jsp" />


            <body>
                <!-- Hero Section Begin -->
                <section class="hero">
                    <div class="hero__slider owl-carousel">
                        <div class="hero__item set-bg" data-setbg="<c:url value= '/img/hero/hero-1.jpg'/>">
                            <div class="container">
                                <div class="row d-flex justify-content-center">
                                    <div class="col-lg-8">
                                        <div class="hero__text">
                                            <h2>Tận hưởng trái bom hương vị bùng nổ trong hân hoan</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Hero Section End -->

                <!-- Categories Section Begin -->
                <div class="categories">
                    <div class="container">
                        <div class="row">
                            <div class="categories__slider owl-carousel">
                                <c:forEach var="category" items="${listcategories}">
                                    <div class="categories__item">
                                        <a href="/${category.id}">
                                            <div class="categories__item__icon">
                                                <span class="flaticon-029-cupcake-3"></span>
                                                <h5>${category.name}</h5>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Categories Section End -->

                <!-- Product Section Begin -->
                <section class="product spad">
                    <div class="container">
                        <div class="row">
                            <c:forEach var="product" items="${listproducts}">
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${product.image}">
                                            <div class="product__label">
                                                <span>${product.category.name}</span>
                                            </div>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">${product.title}</a></h6>
                                            <div class="product__item__price">
                                                <fmt:formatNumber value="${product.price}" pattern="#,### VNĐ" />
                                            </div>
                                            <div class="cart_add">
                                                <a href="#" onclick="viewDetail(${product.id})"
                                                    data-product-id="${product}">Tìm hiểu</a>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
                <!-- Product Section End -->
                <script>
                    function viewDetail(productId) {
                        sessionStorage.setItem("latestId", productId);
                        var productIds = JSON.parse(localStorage.getItem('historyProduct')) || [];

                        if (!productIds.includes(productId)) {
                            productIds.push(productId);
                            localStorage.setItem('historyProduct', JSON.stringify(productIds));
                        }
                        var data = {
                            historyList: productIds,
                            latestId: productId
                        };
                        console.log("tại sao nó lại không được")
                        fetch('/detail', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(data),
                        })
                            .then(response => response.text())
                            .then(result => {
                                window.location.href = "/detail"; // Chỉ cần truyền URL của trang "detail" là đủ
                            })
                            .catch((error) => {
                                console.error('Error:', error);
                            });
                    }


                </script>
                <jsp:include page="/WEB-INF/jsp/footer.jsp" />
            </body>

            </html>