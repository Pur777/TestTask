<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 16.05.2019
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
    <c:if test="${empty part.name}">
        <title>Add</title>
    </c:if>
    <c:if test="${!empty part.name}">
        <title>Edit</title>
    </c:if>
</head>
<body>
<c:if test="${empty part.name}">
    <c:url value="/add" var="var"/>
</c:if>
<c:if test="${!empty part.name}">
    <c:url value="/edit" var="var"/>
</c:if>
<form action="${var}" method="POST">
    <c:if test="${!empty part.name}">
        <input type="hidden" name="id" value="${part.id}">
    </c:if>
    <label for="name">Наименование</label>
    <input type="text" name="name" id="name">
    <label for="need">Необходимость</label>
    <input type="checkbox" name="need" id="need">
    <label for="count">Количество</label>
    <input type="number" name="count" id="count">
    <c:if test="${empty part.name}">
        <input type="submit" value="Добавить">
    </c:if>
    <c:if test="${!empty part.name}">
        <input type="submit" value="Редактировать">
    </c:if>
</form>
</body>
</html>
