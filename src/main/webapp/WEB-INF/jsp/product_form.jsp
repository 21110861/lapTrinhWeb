<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${pageTitle}</title>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="container-fluid">
    <div class="text-center"><h2>${pageTitle}</h2></div>

    <form action="/admin/products/save" method="post" modelAttribute="product"
          style="max-width: 500px; margin: 0 auto;">
        <input type="hidden" name="id" value="${product.id}">
        <div class="border border-secondary rounded p-3">
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Product Name:</label>
                <div class="col-sm-8">
                    <input type="text" name="title" class="form-control" required maxlength="45"
                           value="${product.title}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Price:</label>
                <div class="col-sm-8">
                    <input type="number" name="price" class="form-control" required minlength="2" maxlength="45"
                           value="${product.price}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">ID_Category:</label>
                <div class="col-sm-8">
                    <input type="number" name="idCate" class="form-control" required minlength="1" maxlength="45"
                           value="${product.category.id}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Created day:</label>
                <div class="col-sm-8">
                    <input type="datetime-local" name="created" class="form-control" required minlength="2"
                           maxlength="45" value="${product.createdat}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Update date:</label>
                <div class="col-sm-8">
                    <input type="datetime-local" name="updated" class="form-control" required minlength="5"
                           maxlength="50" value="${product.updatedat}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Link image:</label>
                <div class="col-sm-8">
                    <input type="text" name="image" class="form-control" required minlength="2" maxlength="100"
                           value="${product.image}" />
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary m-2">Save</button>
                <button type="button" class="btn btn-secondary m-2" onclick="cancelForm()">Cancel</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    function cancelForm() {
        window.location = "/admin/products";
    }
</script>
</body>
</html>
