<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Manage Users</title>
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
                        <h2>Manage Users</h2>
                    </div>
                    <div class="m-2">
                        <a class="h3" href="/admin/users/new">Add New User</a>
                    </div>
                    <div th:if="${message}" class="alert alert-success text-center">
                        [[${message}]]
                    </div>

                    <div>
                        <table class="table table-bordered" id="userTable">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${listUsers}">
                                    <tr id="row-${user.id}">
                                        <td>${user.id}</td>
                                        <td>${user.name}</td>
                                        <td>${user.email}</td>
                                        <c:choose>
                                            <c:when test="${user.role eq 'admin'}">
                                                <td style="background-color: green;">${user.role}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="background-color: rgb(235, 216, 250);">${user.role}</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>
                                            <span style="margin-right: 20px;">
                                                <a class="h4" onclick="editRow(${user.id})">Edit</a>
                                            </span>

                                            <span>
                                                <a class="h4" id="delete-btn" onclick="deleteRow(${user.id})">Delete</a>
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <!-- ... -->

                            <tfoot>
                                <tr>
                                    <td></td>
                                    <td><input type="text" id="newUserName" placeholder="name" /></td>
                                    <td>
                                        <span>
                                            <input type="email" id="newUserEmail" placeholder="email" style="margin-right: 40px;"/>
                                        </span>
                                        <span>
                                            <input type="password" id="newUserPassword" placeholder="password" />
                                        </span>
                                    </td>
                                    <td>
                                        <select id="newUserRole">
                                            <option value="user">User</option>
                                            <option value="admin">Admin</option>
                                        </select>
                                    </td>
                                    <td><button class="h4" style="background-color: brown;"
                                            onclick="addNewUser()">Add</button></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <!-- ... -->

                <script>
                    function editRow(userId) {
                        var row = document.getElementById('row-' + userId);
                        var nameElement = row.cells[1];
                        var emailElement = row.cells[2];
                        var roleElement = row.cells[3];
                        var editButton = row.cells[4].querySelector('.h4');

                        // Get the current role value
                        var currentRole = roleElement.textContent.trim();

                        // Replace current values with input/textarea/select
                        nameElement.innerHTML = '<input type="text" id="editedName" value="' + nameElement.textContent + '"/>';
                        emailElement.innerHTML = '<input type="text" id="editedEmail" value="' + emailElement.textContent + '"/>';

                        // Generate a dropdown for roles
                        var selectOptions = [
                            { value: 'admin', label: 'Admin' },
                            { value: 'user', label: 'User' }
                        ];

                        roleElement.innerHTML = '<select id="editedRole">' +
                            selectOptions.map(option =>
                                '<option value="' + option.value + '"' + (currentRole === option.value ? ' selected' : '') + '>' + option.label + '</option>'
                            ).join('') +
                            '</select>';

                        // Replace "Edit" button with "Save" button
                        editButton.textContent = 'Save';
                        editButton.setAttribute('onclick', 'saveRow(' + userId + ')');
                    }

                    function saveRow(userId) {
                        // Get edited values from input/textarea/select
                        var editedName = document.getElementById('editedName').value;
                        var editedEmail = document.getElementById('editedEmail').value;
                        var editedRoleSelect = document.getElementById('editedRole');
                        var editedRole = editedRoleSelect.options[editedRoleSelect.selectedIndex].value;

                        var data = {
                            "id": userId,
                            "name": editedName,
                            "email": editedEmail,
                            "role": editedRole
                        };

                        // Perform fetch to update the user
                        fetch('/admin/users', {
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
                                console.error('Error updating user:', error);
                                window.location.href = "/admin/users";
                            });

                        // Update the table cells with edited values
                        var row = document.getElementById('row-' + userId);
                        row.cells[1].textContent = editedName;
                        row.cells[2].textContent = editedEmail;
                        row.cells[3].textContent = editedRole;

                        // Replace "Save" button with "Edit" button
                        var editButton = row.cells[4].querySelector('.h4');
                        editButton.textContent = 'Edit';
                        editButton.setAttribute('onclick', 'editRow(' + userId + ')');
                    }

                    function addNewUser() {
                        var newUser = {
                            name: document.getElementById("newUserName").value,
                            email: document.getElementById("newUserEmail").value,
                            pass: document.getElementById("newUserPassword").value,
                            role: document.getElementById("newUserRole").value
                        };

                        // Gửi POST request đến Spring Controller
                        fetch('/admin/users/add', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(newUser)
                        })
                            .then(response => response.json())
                            .then(data => {
                                // Xử lý dữ liệu trả về từ Controller
                                // Nếu thành công, thêm sản phẩm mới vào table
                                var table = document.getElementById("userTable");
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
                                cell2.innerHTML = data.name;
                                cell3.innerHTML = data.email;
                                cell4.innerHTML = data.role;
                                if (data.role === "admin") {
                                    cell4.style.backgroundColor = "green"; // Màu xanh cho vai trò "admin"
                                } else {
                                    cell4.style.backgroundColor = 'rgb(235, 216, 250)'; // Màu hường cho vai trò khác
                                }
                                // Thêm nút Edit
                                var editSpan = document.createElement('span');
                                editSpan.style.marginRight = '20px'; // Apply margin-right style
                                var editLink = document.createElement('a');
                                editLink.className = 'h4';
                                editLink.href = '/admin/users/edit/' + data.id;
                                editLink.textContent = 'Edit';
                                editSpan.appendChild(editLink);
                                cell5.appendChild(editSpan);

                                // Thêm nút Delete
                                var deleteSpan = document.createElement('span');
                                var deleteLink = document.createElement('a');
                                deleteLink.className = 'h4';
                                deleteLink.id = 'delete-btn';
                                deleteLink.onclick = function () { deleteRow(data.id); };
                                deleteLink.textContent = 'Delete';
                                deleteSpan.appendChild(deleteLink);
                                cell5.appendChild(deleteSpan);

                                // Clear the input values
                                document.getElementById("newUserName").value = '';
                                document.getElementById("newUserEmail").value = '';
                                document.getElementById("newUserPassword").value = '';
                                document.getElementById("newUserRole").value = '';

                            })
                            .catch(error => console.error('Error:', error));
                    }

                    function deleteRow(userId) {
                        fetch('/admin/users/delete/' + userId, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: null
                        })
                            .then(response => {
                                if (response.ok) {
                                    // Xóa dòng trong giao diện
                                    var row = document.getElementById('row-' + userId);
                                    row.parentNode.removeChild(row);
                                } else {
                                    console.error('Failed to delete user');
                                }
                            })
                            .catch(error => console.error('Error:', error));
                    }
                </script>


            </body>

            </html>