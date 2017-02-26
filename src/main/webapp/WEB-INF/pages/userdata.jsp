<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<div class="wrapper">
    <c:url var="cancelAction" value="/users/1"/>
    <c:url var="addAction" value="/users/add"/>
    <form:form action="${addAction}" commandName="user">
        <table class="maintable" id="userdata">
            <tr>
                <c:if test="${!empty user.createdDate}">
                    <th width="60">ID</th>
                </c:if>
                <th width="120">Name</th>
                <th width="40">Age</th>
                <th width="60">isAdmin</th>
                <c:if test="${!empty user.createdDate}">
                    <th width="60">CreatedDate</th>
                </c:if>
            </tr>
            <tr>
                <c:if test="${!empty user.createdDate}">
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </c:if>
                <td>
                    <form:input path="name" autofocus="autofocus" class="editinput" placeholder="name"/>
                </td>
                <td>
                    <form:input path="age" class="editinput" placeholder="age"/>
                </td>
                <td>
                    <form:checkbox path="admin"/>
                </td>
                <c:if test="${!empty user.createdDate}">
                    <td>
                        <form:input path="createdDate" readonly="true" disabled="true"/>
                    </td>
                </c:if>
            </tr>
            <tr>
                <c:if test="${!empty user.createdDate}">
                    <td colspan="3" class="buttontd">
                        <button type="submit">Edit user</button>
                    </td>
                    <td colspan="2" class="buttontd">
                        <form:form action="${cancelAction}" method="get">
                            <button type="submit">Cancel</button>
                        </form:form>
                    </td>
                </c:if>
                <c:if test="${empty user.createdDate}">
                    <td colspan="2" class="buttontd">
                        <button type="submit">Add user</button>
                    </td>
                    <td class="buttontd">
                        <form:form action="${cancelAction}" method="get">
                            <button type="submit">Cancel</button>
                        </form:form>
                    </td>
                </c:if>
            </tr>
            <tr>
                <c:if test="${!empty user.createdDate}">
                    <td class="buttontd" colspan="5">
                        <form action="../../index.jsp">
                            <button id="backbutton" type="submit">Back to main page</button>
                        </form>
                    </td>
                </c:if>
                <c:if test="${empty user.createdDate}">
                    <td class="buttontd" colspan="3">
                        <form action="../../index.jsp">
                            <button id="backbutton" type="submit">Back to main page</button>
                        </form>
                    </td>
                </c:if>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
