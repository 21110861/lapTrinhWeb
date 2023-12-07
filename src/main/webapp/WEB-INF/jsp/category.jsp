<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Categories</title>
    <!-- You can include additional styles or scripts here -->
</head>
<body>

<h2>All Categories</h2>

<c:forEach var="category" items="${listcategories}">
    <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
        <h3>${category.name}</h3>
        <p>Created at: ${category.createdat}</p>
        <p>Updated at: ${category.updatedat}</p>
        <p>Image: <img src="${category.image}" alt="Category Image"></p>
        <p>Detail: ${category.detail}</p>
    </div>
</c:forEach>

</body>
</html>
