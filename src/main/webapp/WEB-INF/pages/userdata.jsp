<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600,900|Nunito+Sans:400,700,900"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/> "/>
    <title>User Manager for Javarush internship</title>

</head>
<body>
<header>
    <h1>User Details</h1>
</header>
<div class="wrapper-data">
    <c:url var="cancelAction" value="/cancel"/>
    <c:url var="addAction" value="/users/add"/>
    <form:form action="${addAction}" commandName="user">
        <table class="maintable" id="userdata">
            <tr>
                <c:if test="${!(user.id == 0)}">
                    <th width="60">ID</th>
                </c:if>
                <th width="120">Name</th>
                <th width="40">Age</th>
                <th width="60">isAdmin</th>
                <c:if test="${!(user.id == 0)}">
                    <th width="60">CreatedDate</th>
                </c:if>
            </tr>
            <tr>
                <c:if test="${!(user.id == 0)}">
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </c:if>
                <td>
                    <form:input path="name" autofocus="autofocus" class="editinput" placeholder="name"/>
                </td>
                <td>
                    <form:input path="age" class="editinput" placeholder="age" type="number"/>
                </td>
                <td>
                    <form:checkbox path="admin"/>
                </td>
                <c:if test="${!(user.id == 0)}">
                    <td>
                        <form:input path="createdDate" readonly="true" disabled="true"/>
                        <form:hidden path="createdDate"/>
                    </td>
                </c:if>
            </tr>
            <tr>
                <c:if test="${!(user.id == 0)}">
                    <td></td>
                </c:if>
                <td><form:errors path="name" cssClass="errors"/></td>
                <td><form:errors path="age" cssClass="errors"/></td>
                <td></td>
                <c:if test="${!(user.id == 0)}">
                    <td></td>
                </c:if>
            </tr>
        </table>
        <c:if test="${!(user.id == 0)}">
            <button type="submit">Edit user</button>
        </c:if>
        <c:if test="${(user.id == 0)}">
            <button type="submit">Add user</button>
        </c:if>
    </form:form>
    <form:form action="${cancelAction}" method="get">
        <button type="submit">Cancel</button>
    </form:form>
    <c:url var="mainPage" value="/mainpage"/>
    <form action="${mainPage}">
        <button id="backbutton" type="submit">Back to main page</button>
    </form>
</div>
</body>
</html>
