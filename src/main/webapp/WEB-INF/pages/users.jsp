<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,700|Raleway:200,400" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/> "/>
    <title>User List page ${currentPage}</title>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>
<h1><a href="<c:url value="/adduser"/>">Add User</a></h1>
<h1>User list page ${currentPage}</h1>
<c:url var="findUsers" value="/findusers"/>
<c:if test="${!empty listUsers}">
    <form:form action="${findUsers}" method="get">
        <input type="text" name="searchKeyword" value=""/>
        <input type="submit"
               value="<spring:message text="Find users"/>"/>
    </form:form>
</c:if>
<c:url value="/users/1" var="firstPage"/>
<c:url value="/users/${totalPages}" var="lastPage"/>
<c:url value="/users/${currentPage - 1}" var="prevPage"/>
<c:url value="/users/${currentPage + 1}" var="nextPage"/>

<c:if test="${!empty listUsers}">
    <ul class="paging">
        <c:if test="${!(currentPage == 1)}">
            <li class="disabled"><a href="${firstPage}">&lt;&lt;</a></li>
            <li class="disabled"><a href="${prevPage}">&lt;</a></li>
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:url var="pageUrl" value="/users/${i}"/>
            <c:choose>
                <c:when test="${i == currentPage}">
                    <li class="active"><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${!(currentPage == totalPages)}">
            <li class="disabled"><a href="${nextPage}">&gt;</a></li>
            <li class="disabled"><a href="${lastPage}">&gt;&gt;</a></li>
        </c:if>
    </ul>
    <table class="tg">
        <tr>
            <th width="60">ID</th>
            <th width="120">User name</th>
            <th width="60">Age</th>
            <th width="30">IsAdmin</th>
            <th width="100">CreatedDate</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td><c:out value="${user.admin? 'Yes' : 'No'}"/></td>
                <td>${user.createdDate}</td>
                <td><a href="<c:url value="/edit/${user.id}"/> ">Edit</a></td>
                <td><a href="<c:url value="/remove/${user.id}"/> ">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty listUsers}">
    <h1>List is empty</h1>
</c:if>
</body>
</html>
