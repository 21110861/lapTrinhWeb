<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Manage Products</title>
                <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />" />
                <!-- Uncomment the line below if you have a local CSS file -->
                <link rel="stylesheet" type="text/css" href="<c:url value='/css/danhMuc.css' />" />
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
                    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                    crossorigin="anonymous">
            </head>

            <body>
                <nav class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                                    class="icon-bar"></span> <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="/admin">ADMIN SITE</a>
                        </div>
                        <div id="navbar" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li sec:authorize="isAuthenticated()"><a href="/logout">Logout</a></li>
                            </ul>
                            <form class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="searchId" placeholder="Search">
                                </div>
                                <button type="submit" class="btn btn-default" onclick="search()">Submit</button>
                            </form>
                        </div>
                    </div>
                </nav>

                <br>
                <br>

                <div class="container-fluid text-center">
                    <div>
                        <h2>Manage Products</h2>
                    </div>
                    <div>
                        <table class="table table-bordered" id="productTable">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Price</th>
                                    <th>IDCategory</th>
                                    <th>Created day</th>
                                    <th>Updated day</th>
                                    <th>status</th>
                                    <th>information</th>
                                    <th>description</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${listProducts}">
                                    <tr id="row-${product.id}">
                                        <td>${product.id}</td>
                                        <td>
                                            <!-- Sử dụng th:src để hiển thị hình ảnh -->
                                            <img src="${product.image}" alt="Product Image"
                                                style="max-width: 100px; max-height: 100px;" />
                                        </td>
                                        <td>${product.title}</td>
                                        <td>
                                            <fmt:formatNumber value="${product.price}" type="number" />
                                        </td>
                                        <td>${product.category.name}</td>
                                        <td>${product.createdat}</td>
                                        <td>${product.updatedat}</td>
                                        <c:choose>
                                            <c:when test="${product.status eq 'còn bán'}">
                                                <td style="background-color: green;">${product.status}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="background-color: red;">${product.status}</td>
                                            </c:otherwise>
                                        </c:choose>

                                        <td>${product.information}</td>
                                        <td>${product.description}</td>
                                        <td>
                                            <div>
                                                <a class="h4" id="edit-btn"
                                                    onclick="editProduct(${product.id})">Edit</a>
                                            </div>
                                            <div>
                                                <span class="btn-separator"></span>
                                            </div>
                                            <div>
                                                <a class="h4" id="delete-btn"
                                                    onclick="deleteRow(${product.id})">Delete</a>
                                            </div>
                                            <div>
                                                <span class="btn-separator"></span>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <!-- ... -->

                            <tfoot>
                                <tr>
                                    <td></td>
                                    <td><input type="url" id="newProductImage" style="width: 95px;"
                                            placeholder="Image URL" /></td>
                                    <td><input type="text" id="newProductTitle" placeholder="Title" /></td>
                                    <td><input type="number" id="newProductPrice" style="width: 95px;"
                                            placeholder="Price" /></td>
                                    <td>
                                        <select id="newProductCategory">
                                            <c:forEach var="category" items="${listCategories}">
                                                <option value="${category.id}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <select id="newProductStatus">
                                            <option value="còn bán">Còn bán</option>
                                            <option value="tạm ngưng">Tạm ngưng</option>
                                        </select>
                                    </td>
                                    <td><textarea id="newProductInformation" placeholder="Information"
                                            style="width: 100%;"></textarea></td>
                                    <td><textarea id="newProductDescription" placeholder="Description"
                                            style="width: 100%;"></textarea></td>
                                    <td><button class="btn btn-primary" onclick="addNewProduct()">Add</button></td>
                                </tr>
                            </tfoot>

                            <!-- ... -->

                        </table>
                    </div>
                </div>
                <!-- ... -->

                <script>
                    function addNewProduct() {
                        var newProduct = {
                            title: document.getElementById("newProductTitle").value,
                            image: document.getElementById("newProductImage").value,
                            price: parseInt(document.getElementById("newProductPrice").value),
                            category: { id: parseInt(document.getElementById("newProductCategory").value) },
                            status: document.getElementById("newProductStatus").value,
                            information: document.getElementById("newProductInformation").value,
                            description: document.getElementById("newProductDescription").value
                        };

                        // Gửi POST request đến Spring Controller
                        fetch('/admin/products/add', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(newProduct)
                        })
                            .then(response => response.json())
                            .then(data => {
                                // Xử lý dữ liệu trả về từ Controller
                                // Nếu thành công, thêm sản phẩm mới vào table
                                var table = document.getElementById("productTable");
                                var lastRowIndex = table.rows.length - 1;

                                // Tạo dòng mới và thêm vào bảng
                                var newRow = table.insertRow(lastRowIndex);

                                // Tạo các ô trong dòng mới
                                var cell1 = newRow.insertCell(0);
                                var cell2 = newRow.insertCell(1);
                                var cell3 = newRow.insertCell(2);
                                var cell4 = newRow.insertCell(3);
                                var cell5 = newRow.insertCell(4);
                                var cell6 = newRow.insertCell(5);
                                var cell7 = newRow.insertCell(6);
                                var cell8 = newRow.insertCell(7);
                                var cell9 = newRow.insertCell(8);
                                var cell10 = newRow.insertCell(9);
                                var cell11 = newRow.insertCell(10);

                                // Đặt giá trị cho các ô
                                cell1.innerHTML = data.id;

                                // Hiển thị hình ảnh
                                var img = document.createElement('img');
                                img.src = data.image;
                                img.alt = 'Product Image';
                                img.style.maxWidth = '100px';
                                img.style.maxHeight = '100px';
                                cell2.appendChild(img);

                                cell3.innerHTML = data.title;
                                cell4.innerHTML = data.price;
                                cell5.innerHTML = data.category.id; // Giả sử category có thuộc tính id
                                cell6.innerHTML = data.createdat;
                                cell7.innerHTML = data.updatedat;
                                cell8.innerHTML = data.status;
                                cell9.innerHTML = data.information;
                                cell10.innerHTML = data.description;

                                // Thêm nút Edit
                                var editDiv = document.createElement('div');
                                editDiv.innerHTML = '<a class="h4" href="/admin/products/edit/' + data.id + '">Edit</a>';
                                cell11.appendChild(editDiv);

                                // Thêm phần tạo khoảng cách giữa các button
                                var separator1 = document.createElement('span');
                                separator1.className = 'btn-separator';
                                cell11.appendChild(separator1);

                                // Thêm nút Delete
                                var deleteDiv = document.createElement('div');
                                deleteDiv.innerHTML = '<a class="h4"="delete-btn" onclick="deleteRow(' + data.id + ')">Delete</a>';
                                cell11.appendChild(deleteDiv);

                                // Thêm khoảng cách cuối cùng
                                var finalSeparator = document.createElement('span');
                                finalSeparator.className = 'btn-separator';
                                cell11.appendChild(finalSeparator);

                            })
                            .catch(error => console.error('Error:', error));
                    }

                    function deleteRow(productId) {
                        fetch('/admin/products/delete/' + productId, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: null
                        })
                            .then(response => {
                                if (response.ok) {
                                    // Xóa dòng trong giao diện
                                    var row = document.getElementById('row-' + productId);
                                    row.parentNode.removeChild(row);
                                } else {
                                    console.error('Failed to delete product');
                                }
                            })
                            .catch(error => console.error('Error:', error));
                    }
                    function editProduct(productId) {
                        // Lấy ra các element trên dòng có id là `row-productId`
                        var row = document.getElementById('row-' + productId);
                        var titleElement = row.cells[2];
                        var priceElement = row.cells[3];
                        var imageElement = row.cells[1];
                        var categoryElement = row.cells[4];
                        var statusElement = row.cells[7];
                        var informationElement = row.cells[8];
                        var descriptionElement = row.cells[9];
                        var editButton = row.cells[10].querySelector('.h4');
                        var currentPriceValue = priceElement.textContent.replace(/,/g, '');
                        // Thay thế các giá trị hiện tại bằng các input/textarea/select tương ứng
                        titleElement.innerHTML = '<input type="text" id="editedTitle" value="' + titleElement.textContent + '"/>';
                        priceElement.innerHTML = '<input type="number" id="editedPrice" value="' + parseInt(currentPriceValue) + '"/>';
                        imageElement.innerHTML = '<input type="url" id="editedImage" value="' + imageElement.querySelector('img').src + '"/>';

                        // Lấy danh sách danh mục từ API bằng fetch
                        fetch('/admin/categories', {
                            method: 'POST'
                        })
                            .then(response => response.json())
                            .then(categories => {
                                var selectOptions = categories.map(category => '<option value="' + category.id + '">' + category.name + '</option>');
                                categoryElement.innerHTML = '<select id="editedCategory">' + selectOptions.join('') + '</select>';
                            })
                            .catch(error => console.error('Error fetching categories:', error));

                        statusElement.innerHTML = '<select id="editedStatus">' +
                            '<option value="còn bán">Còn bán</option>' +
                            '<option value="tạm ngưng">Tạm ngưng</option>' +
                            '</select>';
                        informationElement.innerHTML = '<textarea id="editedInformation" style="width: 100%;">' + informationElement.textContent + '</textarea>';
                        descriptionElement.innerHTML = '<textarea id="editedDescription" style="width: 100%;">' + descriptionElement.textContent + '</textarea>';

                        // Thay thế nút "Edit" thành nút "Save" với sự kiện lưu trạng thái
                        editButton.textContent = 'Save';
                        editButton.setAttribute('onclick', 'saveProduct(' + productId + ')');
                    }
                    function saveProduct(productId) {
                        // Lấy ra các giá trị từ các input/textarea/select đã chỉnh sửa
                        var editedTitle = document.getElementById('editedTitle').value;
                        var editedPrice = document.getElementById('editedPrice').value;
                        var editedImage = document.getElementById('editedImage').value;
                        var editedCategorySelect = document.getElementById('editedCategory');
                        var selectedOption = editedCategorySelect.options[editedCategorySelect.selectedIndex];
                        var editedCategoryText = selectedOption.innerText;



                        var editedStatus = document.getElementById('editedStatus').value;
                        var editedInformation = document.getElementById('editedInformation').value;
                        var editedDescription = document.getElementById('editedDescription').value;
                        var data = {
                            "id": productId,
                            "title": editedTitle,
                            "price": parseInt(editedPrice), // Chuyển đổi thành số
                            "category": {
                                "id": parseInt(editedCategorySelect.value) // Chuyển đổi thành số
                            },
                            "image": editedImage,
                            "status": editedStatus,
                            "information": editedInformation,
                            "description": editedDescription
                        };

                        fetch('/admin/products/', {
                            method: 'PUT',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(data)
                        })
                            .then(response => response.json())
                            .then(result => {
                                console.log('Update successful:', result);
                            })
                            .catch(error => {
                                console.error('Error updating product:', error);
                                window.location.href="/admin/products";
                            });
                        // Gán giá trị đã chỉnh sửa vào các cell tương ứng
                        var row = document.getElementById('row-' + productId);
                        row.cells[2].textContent = editedTitle;
                        row.cells[3].textContent = parseInt(editedPrice).toLocaleString();
                        row.cells[1].innerHTML = '<img src="' + editedImage + '" alt="Product Image" style="max-width: 100px; max-height: 100px;" />';
                        row.cells[4].textContent = editedCategoryText;
                        row.cells[7].textContent = editedStatus;
                        row.cells[8].textContent = editedInformation;
                        row.cells[9].textContent = editedDescription;

                        // Thay thế nút "Save" thành nút "Edit" với sự kiện chỉnh sửa
                        var editButton = row.cells[10].querySelector('.h4');
                        editButton.textContent = 'Edit';
                        editButton.setAttribute('onclick', 'editProduct(' + productId + ')');
                    }

                </script>


            </body>

            </html>