<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="zxx">

        <jsp:include page="/WEB-INF/jsp/header.jsp" />



        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__text">
                            <h2>Shopping cart</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Shopping cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shopping Cart Section Begin -->
        <section class="shopping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="shopping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="continue__btn">
                                    <a href="#">Continue Shopping</a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="continue__btn update__btn">
                                    <a href="#"><i class="fa fa-spinner"></i> Update cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart__discount">
                            <h6>Ghi chú</h6>
                            <form action="#">
                                <input type="text" placeholder="bạn muốn nói điều gì với tiệm">
                                <button type="submit">Apply</button>
                            </form>
                        </div>
                        <div class="cart__total">
                            <h6>Cart total</h6>
                            <ul>
                                <li>Total <span>$ 169.50</span></li>
                            </ul>
                            <a href="#" class="primary-btn">Proceed to checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shopping Cart Section End -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy dữ liệu từ sessionStorage
                var cartItemsJson = sessionStorage.getItem("cartItems");

                // Kiểm tra xem dữ liệu có tồn tại không
                if (cartItemsJson) {
                    // Chuyển đổi chuỗi JSON thành mảng đối tượng JavaScript
                    var shoplist = JSON.parse(cartItemsJson);

                    // Tiếp tục xử lý hoặc truyền shoplist vào nơi cần thiết
                    // Ví dụ: cập nhật giao diện của bảng HTML
                    updateShoplistUI(shoplist);
                } else {
                    console.log("Không có cartItems trong sessionStorage.");
                }
            });
            function updateShoplistUI(shoplist) {
                // Chọn tbody trong bảng HTML
                var tbody = document.querySelector("tbody");
                var total = 0;
                // Xóa các hàng hiện tại trong bảng
                tbody.innerHTML = "";

                // Duyệt qua mảng shoplist và thêm các hàng mới vào bảng
                shoplist.forEach(function (item) {
                    var tr = document.createElement("tr");
                    var tdProduct = document.createElement("td");
                    tdProduct.className = "product__cart__item";
                    tdProduct.innerHTML =
                        '<div class="product__cart__item__pic">' +
                        '<img src="' + item.product.image + '"  width="90" height="90" alt="">' +
                        '</div>' +
                        '<div class="product__cart__item__text">' +
                        '<h6>' + item.product.title + '</h6>' +
                        '<h5>' + item.product.price.toLocaleString() + ' VNĐ</h5>' +
                        '</div>';
                    tr.appendChild(tdProduct);

                    var tdQuantity = document.createElement("td");
                    tdQuantity.className = "quantity__item";
                    tdQuantity.innerHTML =
                        '<div class="quantity">' +
                        '<div class="pro-qty">' +
                        '<input type="text" value="' + item.quantity + '">' +
                        '</div>' +
                        '</div>';
                    tr.appendChild(tdQuantity);

                    var tdPrice = document.createElement("td");
                    tdPrice.className = "cart__price";
                    var price = item.product.price * item.quantity;
                    total += price;
                    tdPrice.textContent = price.toLocaleString();
                    tr.appendChild(tdPrice);

                    var tdClose = document.createElement("td");
                    tdClose.className = "cart__close";
                    tdClose.innerHTML = '<span class="icon_close"></span>';
                    tr.appendChild(tdClose);

                    tbody.appendChild(tr);
                });
                var totalDisplay = document.querySelector(".cart__total ul");
                if(! totalDisplay){
                    console.error("không thấy");
                }
                totalDisplay.innerHTML = '<li>Total <span>'+total+' VNĐ</span></li>'

            }
        </script>
        <jsp:include page="/WEB-INF/jsp/footer.jsp" />
        </body>

        </html>