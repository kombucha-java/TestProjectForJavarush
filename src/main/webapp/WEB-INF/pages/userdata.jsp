<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,700|Raleway:200,400" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/> "/>
    <title>UserData</title>

</head>
<body>
<a href="../../index.jsp">Back to main menu</a>
<h1>User Details</h1>
<c:url var="addAction" value="/users/add"/>
<form:form action="${addAction}" commandName="user">
    <table class="tg">
        <tr>
            <c:if test="${!empty user.name}">
                <th width="60">ID</th>
            </c:if>
            <th width="120">Name</th>
            <th width="60">Age</th>
            <th width="30">isAdmin</th>
            <c:if test="${!empty user.name}">
                <th width="60">CreatedDate</th>
            </c:if>
        </tr>
        <tr>
            <c:if test="${!empty user.name}">
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </c:if>
            <td>
                <form:input path="name"/>
            </td>
            <td>
                <form:input path="age"/>
            </td>
            <td>
                <form:checkbox path="admin"/>
            </td>
            <c:if test="${!empty user.name}">
                <td>
                    <form:input path="createdDate" readonly="true" disabled="true"/>
                </td>
            </c:if>
        </tr>
        <tr>
            <td>
                <c:if test="${!empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Edit User"/>"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
<c:url var="cancelAction" value="/users"/>
<form:form action="${cancelAction}" method="get">
    <input type="button" value="<spring:message text="Cancel"/>"/>
</form:form>
</body>
</html>
