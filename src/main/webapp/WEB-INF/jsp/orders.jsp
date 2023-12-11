<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html>

        <head>
            <meta charset="UTF-8">
            <title>Manage Orders</title>
            <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
                integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="<c:url value='/css/danhMuc.css' />" />
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
                            <li><a href="/logout">Logout</a></li>
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
                    <h2>Manage Orders</h2>
                </div>
                <div>
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Customer</th>
                                <th>Phone Number</th>
                                <th>Address</th>
                                <th>Note</th>
                                <th>Order Day</th>
                                <th>Order Status</th>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${listOrders}">
                                <tr id="row-${order.id}">
                                    <td>${order.id}</td>
                                    <td>${order.fullname}</td>
                                    <td>${order.phone}</td>
                                    <td>${order.address}</td>
                                    <td>${order.note}</td>
                                    <td>${order.date}</td>



                                    <td>
                                        <c:if test="${order.state eq 'Đã thanh toán'}">
                                            <span class="glyphicon glyphicon-ok text-success" aria-hidden="true"></span>
                                        </c:if>


                                    </td>
                                    <td>
                                        <span style="margin-right: 20px;">
                                            <a class="h4" onclick="editRow(${order.id})">Edit</a>
                                        </span>

                                        <span>
                                            <a class="h4" id="delete-btn" onclick="deleteRow(${order.id})">Delete</a>
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <script>
                function editRow(orderId) {
                    var row = document.getElementById('row-' + orderId);
                    var fullnameElement = row.cells[1];
                    var phoneElement = row.cells[2];
                    var addressElement = row.cells[3];
                    var noteElement = row.cells[4];
                    var dateElement = row.cells[5];
                    var stateElement = row.cells[6];
                    var editButton = row.cells[7].querySelector('.h4');

                    // Replace current values with input/textarea/select
                    fullnameElement.innerHTML = '<input type="text" id="editedFullname" value="' + fullnameElement.textContent + '"/>';
                    phoneElement.innerHTML = '<input type="text" id="editedPhone" value="' + phoneElement.textContent + '"/>';
                    addressElement.innerHTML = '<input type="text" id="editedAddress" value="' + addressElement.textContent + '"/>';
                    noteElement.innerHTML = '<textarea id="editedNote" style="width: 100%;">' + noteElement.textContent + '</textarea>';
                    dateElement.innerHTML = '<input type="text" readonly id="editedDate" value="' + dateElement.textContent + '"/>';

                    // Assuming state is a text field, not a dropdown
                    stateElement.innerHTML = '<input type="text" id="editedState" value="' + stateElement.textContent + '"/>';

                    // Replace "Edit" button with "Save" button
                    editButton.textContent = 'Save';
                    editButton.setAttribute('onclick', 'saveRow(' + orderId + ')');
                }

                function saveRow(orderId) {
                    // Get edited values from input/textarea/select
                    var editedFullname = document.getElementById('editedFullname').value;
                    var editedPhone = document.getElementById('editedPhone').value;
                    var editedAddress = document.getElementById('editedAddress').value;
                    var editedNote = document.getElementById('editedNote').value;
                    var editedDate = document.getElementById('editedDate').value;
                    var editedState = document.getElementById('editedState').value;

                    var data = {
                        "id": orderId,
                        "fullname": editedFullname,
                        "phone": editedPhone,
                        "address": editedAddress,
                        "note": editedNote,
                        "date": editedDate,
                        "state": editedState
                    };

                    // Perform fetch to update the order
                    fetch('/admin/orders', {
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
                            console.error('Error updating order:', error);
                            window.location.href = "/admin/orders";
                        });

                    // Update the table cells with edited values
                    var row = document.getElementById('row-' + orderId);
                    row.cells[1].textContent = editedFullname;
                    row.cells[2].textContent = editedPhone;
                    row.cells[3].textContent = editedAddress;
                    row.cells[4].textContent = editedNote;
                    row.cells[5].textContent = editedDate;
                    row.cells[6].textContent = editedState;

                    // Replace "Save" button with "Edit" button
                    var editButton = row.cells[7].querySelector('.h4');
                    editButton.textContent = 'Edit';
                    editButton.setAttribute('onclick', 'editRow(' + orderId + ')');
                }

                function deleteRow(orderId) {
                    fetch('/admin/orders/delete/' + orderId, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: null
                    })
                        .then(response => {
                            if (response.ok) {
                                // Xóa dòng trong giao diện
                                var row = document.getElementById('row-' + orderId);
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