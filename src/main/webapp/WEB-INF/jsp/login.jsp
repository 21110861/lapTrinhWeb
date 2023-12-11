<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration and Login App</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/fileCss/new.css' />">
</head>
<body>

<div class="container d-flex justify-content-center align-items-center min-vh-100" style="width: 70%;">
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
                    <h2>Hello, Again</h2>
                    <p>We are happy to have you back.</p>
                </div>
                <form action="<c:url value='/login' />" method="post" class="w-60">
                    <c:if test="${param.error}">
                        <div class="alert alert-danger mb-3">Invalid username or password.</div>
                    </c:if>
                    <c:if test="${param.logout}">
                        <div class="alert alert-info mb-3">You have been logged out.</div>
                    </c:if>

                    <div class="mb-1">
                        <label for="username" class="form-label"></label>
                        <input type="text" class="form-control form-control-lg bg-light fs-6" id="username" name="username" placeholder="Enter Email ID" autofocus="autofocus">
                    </div>

                    <div class="mb-1">
                        <label for="password" class="form-label"></label>
                        <input type="password" class="form-control form-control-lg bg-light fs-6" id="password" name="password" placeholder="Enter Password">
                    </div>

                    <div class="mb-3" style="margin-top: 40px">
                        <input type="submit" name="login-submit" id="login-submit" class="btn btn-lg btn-primary w-100 fs-6" value="Login">
                    </div>
                </form>

                <div class="row">
                    <small class="col">Don't have an account? <a href="<c:url value='/registration' />">Sign Up</a></small>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
