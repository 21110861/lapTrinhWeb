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
                                        <a href="/">Continue Shopping</a>
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
                                <form id="noteForm">
                                    <input type="text" id="noteInput" placeholder="bạn muốn nói điều gì với tiệm">
                                </form>
                            </div>
                            <div class="cart__discount">
                                <h6>Tên</h6>
                                <form id="nameForm">
                                    <input type="text" id="nameInput" placeholder="tên">
                                </form>
                            </div>
                            <div class="cart__discount">
                                <h6>Địa chỉ</h6>
                                <form id="addressForm">
                                    <input type="text" id="addressInput" placeholder="nơi">
                                </form>
                            </div>
                            <div class="cart__total">
                                <h6>Cart total</h6>
                                <ul>
                                    <li>Total <span>0 VNĐ</span></li>
                                </ul>
                                <a href="#" class="primary-btn" id="checkoutButton">Proceed to checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shopping Cart Section End -->
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var cartItemsJson = sessionStorage.getItem("cartItems");

                    if (cartItemsJson) {
                        var shoplist = JSON.parse(cartItemsJson);
                        updateShoplistUI(shoplist);
                    } else {
                        console.log("Không có cartItems trong sessionStorage.");
                    }
                    handleCheckOut();

                });
                function handleCheckOut() {
                    var checkoutButton = document.getElementById("checkoutButton");
                    if (!checkoutButton) {
                        console.error("Không tìm thấy nút thanh toán.");
                        return;
                    }

                    checkoutButton.addEventListener("click", function () {
                        var cartItemsJson = sessionStorage.getItem("cartItems");
                        saveNoteToSessionStorage();
                        var note = sessionStorage.getItem("note");

                        if (!cartItemsJson) {
                            console.error("Dữ liệu không đủ để thanh toán.");
                            return;
                        }
                        if (!note) {
                            note = "không";
                        }
                        var cartItems = JSON.parse(cartItemsJson);

                        var data = {
                            cartItems: cartItems,
                            note: note
                        };

                        // Make a POST request to the server
                        fetch('/giohang', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(data),
                        })
                            .catch((error) => {
                                console.error('Error:', error);
                            });

                    });
                }

                function saveNoteToSessionStorage() {
                    var noteInput = document.getElementById("noteInput");
                    if (!noteInput) {
                        console.error("Sai gì đó rồi");
                        return;
                    }
                    var lt = /</g,
                        gt = />/g,
                        ap = /'/g,
                        ic = /"/g;
                    var noteText = noteInput.value.toString().replace(lt, "&lt;").replace(gt, "&gt;").replace(ap, "&#39;").replace(ic, "&#34;");
                    sessionStorage.setItem("note", noteText);
                }

                function updateShoplistUI(shoplist) {
                    var tbody = document.querySelector("tbody");
                    var total = 0;

                    clearTable(tbody);

                    shoplist.forEach(function (item) {
                        var tr = createTableRow(item);
                        tbody.appendChild(tr);

                        total += item.product.price * item.quantity;
                    });

                    updateTotalDisplay(total);

                    connectQuantityButtons(shoplist);
                }

                function clearTable(tbody) {
                    tbody.innerHTML = "";
                }

                function createTableRow(item) {
                    var tr = document.createElement("tr");
                    tr.appendChild(createProductCell(item));
                    tr.appendChild(createQuantityCell(item));
                    tr.appendChild(createPriceCell(item));
                    tr.appendChild(createCloseCell(item.product.title));
                    return tr;
                }

                function createProductCell(item) {
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
                    return tdProduct;
                }

                function createQuantityCell(item) {
                    var tdQuantity = document.createElement("td");
                    tdQuantity.className = "quantity__item";
                    tdQuantity.innerHTML =
                        '<div class="quantity">' +
                        '<div class="pro-qty">' +
                        '<input type="text" value="' + item.quantity + '">' +
                        '</div>' +
                        '</div>';
                    return tdQuantity;
                }

                function createPriceCell(item) {
                    var tdPrice = document.createElement("td");
                    tdPrice.className = "cart__price";
                    updatePriceCell(tdPrice, item);
                    return tdPrice;
                }

                function updatePriceCell(tdPrice, item) {
                    var price = item.product.price * item.quantity;
                    tdPrice.textContent = price.toLocaleString();
                }

                function createCloseCell(productTitle) {
                    var tdClose = document.createElement("td");
                    tdClose.className = "cart__close";
                    var closeIcon = document.createElement("span");
                    closeIcon.className = "icon_close";
                    closeIcon.addEventListener("click", function () {
                        // Gọi hàm xử lý khi nút closeCell được nhấp
                        handleRemoveItem(productTitle);
                    });
                    tdClose.appendChild(closeIcon);
                    return tdClose;
                }

                function handleRemoveItem(productTitle) {
                    // Lấy dữ liệu từ sessionStorage
                    var cartItemsJson = sessionStorage.getItem("cartItems");

                    // Kiểm tra xem dữ liệu có tồn tại không
                    if (cartItemsJson) {
                        // Chuyển đổi chuỗi JSON thành mảng đối tượng JavaScript
                        var shoplist = JSON.parse(cartItemsJson);

                        // Tìm và xóa sản phẩm khỏi giỏ hàng dựa trên productTitle
                        var updatedShoplist = shoplist.filter(function (item) {
                            return item.product.title !== productTitle;
                        });

                        // Lưu lại giỏ hàng mới vào sessionStorage
                        sessionStorage.setItem("cartItems", JSON.stringify(updatedShoplist));

                        // Cập nhật giao diện
                        updateShoplistUI(updatedShoplist);
                    }
                }

                function updateTotalDisplay(total) {
                    var totalDisplay = document.querySelector(".cart__total ul");
                    if (totalDisplay) {
                        totalDisplay.innerHTML = '<li>Total <span>' + total.toLocaleString() + ' VNĐ</span></li>';
                    } else {
                        console.error("Không tìm thấy totalDisplay.");
                    }
                }

                function connectQuantityButtons(shoplist) {
                    var proQty = $('.pro-qty');
                    proQty.prepend('<span class="dec qtybtn">-</span>');
                    proQty.append('<span class="inc qtybtn">+</span>');

                    proQty.on('click', '.qtybtn', function () {
                        var $button = $(this);
                        var oldValue = $button.parent().find('input').val();

                        if ($button.hasClass('inc')) {
                            var newVal = parseFloat(oldValue) + 1;
                        } else {
                            // Don't allow decrementing below zero
                            if (oldValue > 0) {
                                var newVal = parseFloat(oldValue) - 1;
                            } else {
                                newVal = 0;
                            }
                        }

                        $button.parent().find('input').val(newVal);

                        var index = proQty.index($button.closest('.pro-qty'));
                        shoplist[index].quantity = newVal;

                        // Cập nhật giá trị ô priceCell
                        var priceCell = $button.closest('tr').find('.cart__price')[0];
                        updatePriceCell(priceCell, shoplist[index]);
                        sessionStorage.setItem("cartItems", JSON.stringify(shoplist));
                        updateTotalAndUI(shoplist);
                    });
                }

                function updateTotalAndUI(shoplist) {
                    var total = 0;
                    shoplist.forEach(function (item) {
                        total += item.product.price * item.quantity;
                    });

                    updateTotalDisplay(total);
                }
            </script>

            <jsp:include page="/WEB-INF/jsp/footer.jsp" />
        </body>

        </html>