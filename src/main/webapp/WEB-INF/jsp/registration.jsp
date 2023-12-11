<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/fileCss/new.css' />">
</head>
<body>

<div class="container d-flex justify-content-center align-items-center min-vh-100" style="width: 70%">
    <div class="row border rounded-5 p-3 bg-white shadow box-area">
        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: white;">
            <div class="featured-image mb-2 text-center">
                <img src="https://i.pinimg.com/originals/12/c4/b1/12c4b178a1f8fb172b18889c67a03af2.jpg" class="img-fluid" style="width: 250px">
            </div>
            <p class="text-dark fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">WEBSITE MILK TEA</p>
            <small class="text-dark text-wrap text-center" style="width: 17rem; font-family: 'Courier New', Courier, monospace;"></small>
        </div>

        <div class="col-md-6 right-box">
            <div class="row align-items-center">
                <div class="header-text mb-4" style="padding-left: 80px; padding-top: 10px">
                    <h2>REGISTRATION</h2>
                    <p></p>
                </div>
                <c:if test="${param.success}">
                    <div class="alert alert-info mb-3">You've successfully registered to our awesome app!</div>
                </c:if>
                <form action="<c:url value='/registration' />" method="post" modelAttribute="user" class="w-60 mx-auto">
                    <div class="mb-1">
                        <label for="userName" class="form-label"></label>
                        <input id="userName" class="form-control form-control-lg bg-light fs-6" name="userName" required autofocus="autofocus" placeholder="Enter Username">
                    </div>

                    <div class="mb-1">
                        <label for="email" class="form-label"></label>
                        <input id="email" class="form-control form-control-lg bg-light fs-6" name="email" required autofocus="autofocus" placeholder="Enter Email ID">
                    </div>

                    <div class="mb-1">
                        <label for="password" class="form-label"></label>
                        <input id="password" class="form-control form-control-lg bg-light fs-6" type="password" name="password" required autofocus="autofocus" placeholder="Enter Password">
                    </div>

                    <div class="mb-3" style="margin-top: 40px">
                        <button type="submit" class="btn btn-lg btn-success w-100 fs-6">Register</button>
                    </div>

                    <div class="row">
                        <small class="col">Already registered? <a href="#">Login here</a></small>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
