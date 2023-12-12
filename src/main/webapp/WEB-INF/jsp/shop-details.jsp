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
            <!-- Related Products Section Begin -->
            <section class="related-products spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="section-title">
                                <h2>Sản phảm cùng loại</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="related__products__slider owl-carousel">
                            <c:forEach var="product" items="${listproducts}">
                                <div class="col-lg-3">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${product.image}">
                                            <div class="product__label">
                                                <span>${product.category.name}</span>
                                            </div>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">${product.title}</a></h6>
                                            <div class="product__item__price">${product.price/1000}00 VNĐ</div>
                                            <div class="cart_add">
                                                <a href="#"
                                                    onclick="swapDetail(${product},'${product.information}','${product.description}')">Thông
                                                    Tin Thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                </div>
            </section>
            <!-- Shop Details Section Begin -->
            <section class="product-details spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product__details__img">
                                <div class="product__details__big__img">
                                    <img class="big_img" id="chosenImage" src="${chosenProduct.image}" alt="">
                                </div>
                                <div class="product__details__thumb">
                                    <div class="pt__item active">
                                        <img data-imgbigurl="img/shop/details/product-big-2.jpg"
                                            src="${chosenProduct.image}" alt="">
                                    </div>
                                    <div class="pt__item">
                                        <img data-imgbigurl="img/shop/details/product-big-1.jpg"
                                            src="${chosenProduct.image}" alt="">
                                    </div>
                                    <div class=" pt__item">
                                        <img data-imgbigurl="img/shop/details/product-big-4.jpg"
                                            src="${chosenProduct.image}" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product__details__text">
                                <div class="product__label" id="chosenCateName">${chosenProduct.category.name}</div>
                                <h4 id="chosenTitle">${chosenProduct.title}</h4>
                                <h5 id="chosenPrice">${chosenProduct.price/1000}00 VNĐ</h5>
                                <p id="chosenInfo">${chosenProduct.information}</p>
                                <ul>
                                    <li>Category: <span id="chosenCateName2">${chosenProduct.category.name}</span></li>
                                </ul>
                                <div class="product__details__option">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                    </div>
                                    <a href="#" class="primary-btn" id="addbutton" onclick="addToCart()">Add to cart</a>
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
                                            <p id="chosenDes">${chosenProduct.description}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shop Details Section End -->

            <!-- history Products Section Begin -->
            <section class="related-products spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="section-title">
                                <h2>Đã xem</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="related__products__slider owl-carousel">
                            <c:forEach var="product" items="${listHistoryProducts}">
                                <div class="col-lg-3">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${product.image}">
                                            <div class="product__label">
                                                <span>${product.category.name}</span>
                                            </div>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">${product.title}</a></h6>
                                            <div class="product__item__price">${product.price/1000}00 VNĐ</div>
                                            <div class="cart_add">
                                                <a href="#"
                                                    onclick="swapDetail(${product},'${product.information}','${product.description}')">Thông
                                                    Tin Thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                </div>
            </section>
            <!-- Related Products Section End -->
            <jsp:include page="/WEB-INF/jsp/footer.jsp" />
            <script>
                function swapDetail(product, info, descrip) {
                    sessionStorage.setItem("latestId", product.id);
                    var productIds = JSON.parse(localStorage.getItem('historyProduct')) || [];
                    if (!productIds.includes(product.id)) {

                        productIds.push(product.id);
                        localStorage.setItem('historyProduct', JSON.stringify(productIds));
                    }
                    var chosenCateName = document.getElementById("chosenCateName");
                    var chosenCateName2 = document.getElementById("chosenCateName2");
                    var chosenDes = document.getElementById("chosenDes");
                    var chosenInfo = document.getElementById("chosenInfo");
                    var chosenPrice = document.getElementById("chosenPrice");
                    var chosenTitle = document.getElementById("chosenTitle");
                    console.log(product);
                    chosenDes.textContent = descrip;
                    chosenInfo.textContent = info;
                    chosenPrice.textContent = (product.price / 1000) + ",000 VNĐ";
                    chosenTitle.textContent = product.title;
                    // Cập nhật ảnh lớn
                    var bigImg = document.querySelector('.big_img');
                    bigImg.src = product.image;

                    // Cập nhật các ảnh nhỏ
                    // Cập nhật các ảnh nhỏ
                    var thumbImages = document.querySelectorAll('.pt__item img');
                    for (var i = 0; i < thumbImages.length; i++) {
                        thumbImages[i].src = product.image;
                    }

                }
                function addToCart() {
                    // Get the product id and quantity
                    var productId = sessionStorage.getItem("latestId");
                    var quantity = parseInt(document.querySelector('.pro-qty input').value);
                    var chosenDes = document.getElementById("chosenDes");
                    var chosenInfo = document.getElementById("chosenInfo");
                    var chosenPrice = document.getElementById("chosenPrice").textContent;
                    chosenPrice = chosenPrice.replace(/[^\d]/g, '');
                    chosenPrice = parseInt(chosenPrice);
                    var chosenTitle = document.getElementById("chosenTitle").textContent;
                    var chosenImage = document.getElementById("chosenImage").src;
                    // Create an object to store id and quantity
                    var product = {
                        price: chosenPrice,
                        image: chosenImage,
                        id: parseInt(productId),
                        title: chosenTitle
                    };
                    var cartItem = {
                        product: product,
                        quantity: quantity
                    };

                    // Get the existing cart items from sessionStorage
                    var cartItems = JSON.parse(sessionStorage.getItem('cartItems')) || [];
                    var existingItem = cartItems.find(item => item.id === productId);
                    if (existingItem) {
                        existingItem.quantity = existingItem.quantity + quantity;
                    }
                    else {
                        cartItems.push(cartItem);
                    }
                    // Add the new item to the cart

                    // Update the cart items in sessionStorage
                    sessionStorage.setItem('cartItems', JSON.stringify(cartItems));

                    // Optionally, you can update the total quantity display
                    var totalQuantityDisplay = document.querySelector("#countDrink");
                    // Calculate the total quantity by iterating through cart items
                    totalQuantityDisplay.textContent = cartItems.length + "món";

                }
                function recolorImage(imageLink, color, callback) {
                    // Tạo ảnh mới để tránh cross-origin issues
                    var image = new Image();
                    image.crossOrigin = 'Anonymous';
                    image.src = imageLink;

                    image.onload = function () {
                        // Tạo canvas để vẽ ảnh
                        var canvas = document.createElement('canvas');
                        canvas.width = image.width;
                        canvas.height = image.height;
                        var ctx = canvas.getContext('2d');

                        // Vẽ ảnh lên canvas
                        ctx.drawImage(image, 0, 0);

                        // Recolor ảnh bằng cách sử dụng globalCompositeOperation
                        ctx.globalCompositeOperation = 'source-atop';
                        ctx.fillStyle = color;
                        ctx.fillRect(0, 0, canvas.width, canvas.height);
                        ctx.globalCompositeOperation = 'source-over';

                        // Gọi callback với chuỗi Data URL của ảnh được chỉnh
                        callback(canvas.toDataURL());
                    };
                }
            </script>
        </body>

        </html>