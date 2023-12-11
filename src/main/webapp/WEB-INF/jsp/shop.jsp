<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="zxx">

        <head>
            <title>Shop Page</title>
            <jsp:include page="/WEB-INF/jsp/header.jsp" />
        </head>

        <body>

            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="breadcrumb__text">
                                <h2>Shop</h2>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="breadcrumb__links">
                                <a href="/">Home</a>
                                <span>Shop</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- Shop Section Begin -->
            <section class="shop spad">
                <div class="container">
                    <div class="shop__option">
                        <div class="row">
                            <div class="col-lg-7 col-md-7">
                                <div class="shop__option__search">
                                    <form>
                                        <select id="categorySelect" onchange="filter()">
                                            <option value="0">Tất cả</option>
                                            <option value="1">Trà Sữa</option>
                                            <option value="2">Món ăn nhẹ</option>
                                            <option value="3">Bánh mì</option>
                                            <option value="4">Cà phê</option>
                                        </select>
                                        <input type="text" id="searchInput" placeholder="Tìm kiếm">
                                        <button type="button" id="searchButton" onclick="search()"><i
                                                class="fa fa-search"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5">
                                <div class="shop__option__right">
                                    <select id="orderSelect" onchange="sorting()">
                                        <option value="0">Sắp xếp</option>
                                        <option value="1">A-Z</option>
                                        <option value="2">Z-A</option>
                                        <option value="3">Giá tăng</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="productContainer">
                        <!-- Hiển thị sản phẩm -->
                        <c:forEach var="product" items="${listProducts}">
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="product__item" id="${product.id}">
                                    <div class="product__item__pic set-bg" data-setbg="${product.image}">
                                        <div class="product__label">
                                            <span>${product.category.name}</span>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">${product.title}</a></h6>
                                        <div class="product__item__price">${product.price/1000}00 VNĐ</div>
                                        <div class="cart_add">
                                            <a href="#" onclick="addToCart(${product})">Mua liền tay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="shop__last__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__pagination" id="pagination">
                                    <!-- Hiển thị phân trang -->
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <a onclick="loadPage(${i-1})">${i}</a>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__last__text">
                                    <!-- Hiển thị số sản phẩm -->
                                    <p id="productInfo">Showing 1-<span
                                            id="lastProductIndex">${listProducts.size()}</span> of
                                        <span id="totalProducts">${maxium}</span> results
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shop Section End -->

            <!-- Thêm mã JavaScript để xử lý lazy loading và phân trang -->
            <script>
                var page = 1;
                var pageSize = 10;
                var totalPages = ${ totalPages }; // Thêm dòng này để lấy tổng số trang từ server-side
                var currentUrl = '/shop/load-more';
                var keyword = "";
                var sort = "#";
                var clickSort = false;
                $(document).ready(function () {
                    loadProducts(currentUrl, { page: page, pageSize: pageSize });

                    $(window).scroll(function () {
                        if ($(window).scrollTop() + $(window).height() >= $('#productContainer').height() - 100) {
                            loadProducts(currentUrl, { page: page, pageSize: pageSize });
                        }
                    });
                });

                function loadPage(newPage) {
                    page = newPage;
                    
                    if(clickSort == false)
                        loadProducts(currentUrl, { page: page, pageSize: pageSize, keyword: keyword });
                    else
                        loadSortProducts("/shop/sort", null, sort, page, pageSize);

                }
                function loadProducts(endUrl, data) {
                    $.ajax({
                        type: 'POST',
                        url: endUrl,
                        data: data,
                        success: function (data) {
                            updateUI(data);
                            page++;
                        },
                        error: function (error) {
                            console.error('Error loading products:', error);
                        }
                    });
                }
                function loadSortProducts(endUrl, listProduct, lastTypeSort, page, pageSize) {
                    fetch(endUrl, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({
                            page: page,
                            pageSize: pageSize,
                            lastTypeSort: lastTypeSort,
                            listProduct: listProduct
                        }),
                    })
                        .then(response => response.json())
                        .then(data => {
                            updateUI(data);
                            page++;
                        })
                        .catch(error => {
                            console.error('Error loading products:', error);
                        });
                }


                // Hàm cập nhật giao diện người dùng
                function updateUI(products) {
                    $('.product__item').each(function (i) {
                        var productElement = $(this);
                        var productData = products[i] || {}; // Sử dụng dữ liệu sản phẩm hoặc một đối tượng trống nếu không có dữ liệu

                        productElement.find('.product__item__price').text(productData.price ? parseInt(productData.price / 1000) + ",000 VNĐ" : "");
                        productElement.find('.product__item__text h6 a').text(productData.title || "");
                        productElement.find('.product__label span').text(productData.category ? productData.category.name : "");

                        var productImageDiv = productElement.find('.product__item__pic');
                        productImageDiv.attr('data-setbg', productData.image || "");
                        productImageDiv.css('background-image', productData.image ? 'url(' + productData.image + ')' : "");
                    });
                }
                function addToCart(product) {
                    var totalQuantityDisplay = document.querySelector("#countDrink");
                    var cartItems = JSON.parse(sessionStorage.getItem("cartItems")) || [];
                    var existingItem = cartItems.find(item => item.product.id === product.id);
                    if (existingItem) {
                        existingItem.quantity += 1;
                    } else {
                        // If the product is not in the cart, add it
                        cartItems.push({
                            product: product,
                            quantity: 1
                        });
                    }

                    sessionStorage.setItem("cartItems", JSON.stringify(cartItems));

                    // Update the content of the span element with the length of the cartItems array
                    totalQuantityDisplay.textContent = cartItems.length.toString() + " món";
                }
                function search() {
                    clickSort = false;
                    keyword = document.getElementById('searchInput').value;
                    if (keyword.length > 0) {
                        currentUrl = '/shop/search/';
                    }
                    else {
                        currentUrl = '/shop/load-more';
                    }
                    page = 0;
                    loadProducts(currentUrl, { page: page, pageSize: pageSize, keyword: keyword });
                }
                function filter() {
                    clickSort = false;
                    keyword = parseInt(document.getElementById('categorySelect').value);
                    if (keyword != 0) {
                        currentUrl = "/shop/filter";


                    } else {
                        currentUrl = '/shop/load-more';
                    }
                    page = 0;
                    loadProducts(currentUrl, { page: page, pageSize: pageSize, keyword: keyword });
                }
                function sorting() {
                    clickSort = true;
                    var listProduct = parseProduct();
                    var lastTypeSort = document.getElementById('orderSelect').value;
                    if (sort != lastTypeSort) {
                        currentUrl = "/shop/sort";
                        sort = lastTypeSort;
                    } else {
                        currentUrl = '/shop/load-more';
                    }

                    page = 0;

                    // Use JSON.stringify, not JSON.parse

                    loadSortProducts("/shop/sort", listProduct, lastTypeSort, page, pageSize);
                }

                function parseProduct() {
                    var productList = [];

                    // Duyệt qua các phần tử sản phẩm trong DOM và thêm thông tin vào mảng
                    var productElements = document.querySelectorAll('.product__item');

                    productElements.forEach(productElement => {
                        if (productElement.querySelector('.product__item__text h6 a').innerText != "") {
                            var productInfo = {
                                id: parseInt(productElement.id),
                                title: productElement.querySelector('.product__item__text h6 a').innerText,
                                image: productElement.querySelector('.product__item__pic').getAttribute('data-setbg'),
                                price: parseInt(productElement.querySelector('.product__item__price').innerText.replace(/[^0-9.,]/g, ''))
                            };
                            if (productInfo.price < 1000) {
                                productInfo.price *= 1000;
                            }
                            productList.push(productInfo);
                            console.log(productInfo.price);
                        }
                    });

                    return productList;
                }

            </script>

            <jsp:include page="/WEB-INF/jsp/footer.jsp" />
        </body>

        </html>