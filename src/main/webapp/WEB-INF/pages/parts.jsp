<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 16.05.2019
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
    <title>Parts</title>
</head>

<body>
<h2>Компьютерные комплектующие</h2>
    <table>
        <tr>
            <th><h3>Наименование</h3></th>
            <th><h3>Необходимость</h3></th>
            <th><h3>Количество</h3></th>
            <th></th>
        </tr>
        <c:forEach var="part" items="${partsList}">
            <tr>
                <td>${part.name}</td>
                <td>
                    <c:if test="${part.need == true}">
                        Да
                    </c:if>
                    <c:if test="${part.need == false}">
                        Нет
                    </c:if>
                </td>
                <td>${part.count}</td>
                <td>
                    <a href="/edit/${part.id}">редактировать</a>
                    <a href="/delete/${part.id}">удалить</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <c:url value="/add" var="add"/>
                <a href="${add}">добавить</a>
            </td>
        </tr>
    </table>

    <h3><c:forEach begin="1" end="${pagesCount}" step="1" varStatus="i">
        <c:url value="/" var="url">
            <c:param name="page" value="${i.index}"/>
        </c:url>
        <a href="${url}">${i.index}</a>
    </c:forEach></h3>

    <table>
        <tr>
            <td><h3>Можно собрать</h3></td>
            <td><h3>
                <c:out value="${count}" />
            </h3></td>
            <td><h3>компьютеров</h3></td>
        </tr>
    </table>

    <h3><a href="/all">Все детали</a></h3>
    <h3><a href="/need">Детали, необходимые для сборки</a></h3>
    <h3><a href="/option">Опциональные детали</a></h3>

    <c:url value="/search" var="var"/>
    <form action="${var}" method="POST">
        <label for="name">Наименование</label>
        <input type="text" name="name" id="name">
        <input type="submit" value="Поиск">
    </form>

</body>
</html>
