<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Manage Categories</title>
            <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
                integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="<c:url value='/css/danhMuc.css' />" />
            <style>
                tbody th {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
            </style>
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
                    <h2>Manage Categories</h2>
                </div>

                <div>
                    <table class="table table-bordered" id="categoryTable">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Created day</th>
                                <th>Updated day</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="category" items="${listcategories}">
                                <tr id="row-${category.id}">
                                    <td>${category.id}</td>
                                    <td>
                                        <!-- Sử dụng th:src để hiển thị hình ảnh -->
                                        <img src="${category.image}" alt="Category Image"
                                            style="max-width: 100px; max-height: 100px;" />
                                    </td>
                                    <td>${category.name}</td>
                                    <td>${category.createdat}</td>
                                    <td>${category.updatedat}</td>
                                    <td>
                                        <div>
                                            <a class="h4" href="/admin/categories/edit/${category.id}">Edit</a>
                                        </div>
                                        <div>
                                            <span class="btn-separator"></span>
                                        </div>
                                        <div>
                                            <a class="h4"="delete-btn" onclick="deleteRow(${category.id})">Delete</a>
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
                                <td><input type="text" id="newCategoryImage" style="width: 95px;"
                                        placeholder="Image URL" /></td>
                                <td><input type="text" id="newCategoryTitle" placeholder="Title" /></td>
                                <td></td>
                                <td></td>
                                <td><button class="btn btn-primary" onclick="addNewCategory()">Add</button></td>
                            </tr>
                        </tfoot>

                        <!-- ... -->

                    </table>
                </div>
            </div>
            <!-- ... -->

            <script>
                function addNewCategory() {
                    var newCategory = {
                        name: document.getElementById("newCategoryTitle").value,
                        image: document.getElementById("newCategoryImage").value
                    };

                    // Gửi POST request đến Spring Controller
                    fetch('<c:url value="/admin/categories/add" />', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(newCategory)
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {

                            // Nếu thành công, thêm sản phẩm mới vào table
                            var table = document.getElementById("categoryTable");
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
                            // Đặt giá trị cho các ô
                            cell1.innerHTML = data.id;

                            // Hiển thị hình ảnh
                            var img = document.createElement('img');
                            img.src = data.image;
                            img.alt = 'Category Image';
                            img.style.maxWidth = '100px';
                            img.style.maxHeight = '100px';
                            cell2.appendChild(img);

                            cell3.innerHTML = data.name;
                            cell4.innerHTML = data.createdat;
                            cell5.innerHTML = data.updatedat;
                            // Thêm nút Edit
                            var editDiv = document.createElement('div');
                            editDiv.innerHTML = '<a class="h4" href="/admin/categories/edit/' + data.id + '">Edit</a>';
                            cell6.appendChild(editDiv);

                            // Thêm phần tạo khoảng cách giữa các button
                            var separator1 = document.createElement('span');
                            separator1.className = 'btn-separator';
                            cell6.appendChild(separator1);

                            // Thêm nút Delete
                            var deleteDiv = document.createElement('div');
                            deleteDiv.innerHTML = '<a class="h4"="delete-btn" onclick="deleteRow(' + data.id + ')">Delete</a>';
                            cell6.appendChild(deleteDiv);

                            // Thêm khoảng cách cuối cùng
                            var finalSeparator = document.createElement('span');
                            finalSeparator.className = 'btn-separator';
                            cell6.appendChild(finalSeparator);

                            document.getElementById("newCategoryTitle").value = "";
                            document.getElementById("newCategoryImage").value = "";
                        })
                        .catch(error => console.error('Error:', error));
                }

                function deleteRow(categoryId) {
                    fetch('<c:url value="/admin/categories/delete/' + categoryId + '" />', {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: null
                    })
                        .then(response => {
                            if (response.ok) {
                                // Xóa dòng trong giao diện
                                var row = document.getElementById('row-' + categoryId);
                                row.parentNode.removeChild(row);
                            } else {
                                console.error('Failed to delete category');
                            }
                        })
                        .catch(error => console.error('Error:', error));
                }
            </script>
        </body>

        </html>