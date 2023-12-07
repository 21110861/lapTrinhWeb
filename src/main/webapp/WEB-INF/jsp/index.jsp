<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                        <div class="product__item__price">${product.price} VNĐ</div>
                                        <div class="cart_add">
                                            <a href="#" data-product-id="${product}">mua liền tay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- Product Section End -->

            <jsp:include page="/WEB-INF/jsp/footer.jsp" />

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var addToCartButtons = document.querySelectorAll("section.product .cart_add a");
                    var totalQuantityDisplay = document.querySelector("#countDrink");

                    if (!totalQuantityDisplay) {
                        console.error("Element with id countDrink not found");
                        return;
                    }

                    var cartItems = JSON.parse(sessionStorage.getItem("cartItems")) || [];

                    addToCartButtons.forEach(function (button) {
                        button.addEventListener("click", function (event) {
                            event.preventDefault();

                            var product = button.getAttribute("data-product-id");
                            var validProduct = product.replace(/'/g, '"');
                            var jsonproduct = JSON.parse(validProduct);
                            console.log(jsonproduct);
                            // Check if the product is already in the cart
                            var existingItem = cartItems.find(item => item.product.id === jsonproduct.id);

                            if (existingItem) {
                                existingItem.quantity += 1;
                            } else {
                                // If the product is not in the cart, add it
                                cartItems.push({
                                    product: jsonproduct,
                                    quantity: 1
                                });
                            }

                            sessionStorage.setItem("cartItems", JSON.stringify(cartItems));

                            // Update the content of the span element with the length of the cartItems array
                            totalQuantityDisplay.textContent = cartItems.length.toString() + " món";

                            console.log("Item added to cart. Total items in cart:", cartItems.length);

                            // Additional logic for handling the cart update
                        });
                    });
                });
            </script>


        </body>

        </html>