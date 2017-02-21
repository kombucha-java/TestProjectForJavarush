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
    <title>User Manager for JavaRush</title>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>
<h1><a href="<c:url value="/adduser"/>">Add User</a></h1>
<h1>User list</h1>
<c:url var="findUsers" value="/findusers"/>
<c:if test="${!empty listUsers}">
    <form:form action="${findUsers}" method="get">
        <input type="text" name="searchKeyword" value=""/>
        <input type="submit"
               value="<spring:message text="Find users"/>"/>
    </form:form>
</c:if>
<c:if test="${!empty listUsers}">
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
<c:url var="populateDB" value="/populateDB"/>
<c:if test="${empty listUsers}">
    <form:form action="${populateDB}" method="get">
        <input type="submit"
               value="<spring:message text="Populate DB"/>"/>
    </form:form>
</c:if>
</body>
</html>
