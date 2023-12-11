<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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