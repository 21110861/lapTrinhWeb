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
                                            <a class="h4" href="/admin/orders/edit/${order.id}">Edit</a>
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
        </body>

        </html>