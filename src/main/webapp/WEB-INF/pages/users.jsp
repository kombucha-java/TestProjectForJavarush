<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600,900|Nunito+Sans:400,700,900"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/> "/>
    <title>User Manager for Javarush internship</title>
</head>
<body>
<header>
    <h1>User list</h1>
</header>
<div class="wrapper">
    <div class="buttonblock">
        <c:url var="findUsers" value="/findusers"/>
        <form:form action="${findUsers}" method="get">
            <input type="text" name="searchKeyword" placeholder="Enter user's name" class="editinput"/>
            <button type="submit">Find users</button>
        </form:form>

        <form action="/adduser">
            <button type="submit">Add user</button>
        </form>
        <form action="../../index.jsp">
            <button id="backbutton" type="submit">Back to main page</button>
        </form>
    </div>
    <div class="tableblock">
        <c:url value="/users/1" var="firstPage"/>
        <c:url value="/users/${totalPages}" var="lastPage"/>
        <c:url value="/users/${currentPage - 1}" var="prevPage"/>
        <c:url value="/users/${currentPage + 1}" var="nextPage"/>

        <c:if test="${!empty listUsers}">

            <c:if test="${!(currentPage == 1)}">
                <form action="${firstPage}">
                    <button class="pagebutton" type="submit">&lt;&lt;</button>
                </form>

                <form action="${prevPage}">
                    <button class="pagebutton" type="submit">&lt;</button>
                </form>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <c:url var="pageUrl" value="/users/${i}"/>
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <form action="${pageUrl}">
                            <button class="pagebutton" type="submit"
                                    style="text-decoration: underline; font-weight: 600">
                                <c:out value="${i}"/>
                            </button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form action="${pageUrl}">
                            <button class="pagebutton" type="submit"><c:out value="${i}"/></button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${!(currentPage == totalPages)}">
                <form action="${nextPage}">
                    <button class="pagebutton" type="submit">&gt;</button>
                </form>
                <form action="${lastPage}">
                    <button class="pagebutton" type="submit">&gt;&gt;</button>
                </form>
            </c:if>

            <table class="maintable" width="100%">
                <tr>
                    <th width="40">ID</th>
                    <th width="130">User name</th>
                    <th width="40">Age</th>
                    <th width="60">IsAdmin</th>
                    <th width="130">CreatedDate</th>
                    <th width="80">Edit</th>
                    <th width="80">Delete</th>
                </tr>
                <c:forEach items="${listUsers}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.age}</td>
                        <td><c:out value="${user.admin? 'Yes' : 'No'}"/></td>
                        <td>${user.createdDate}</td>
                        <td>
                            <form action="/edit/${user.id}">
                                <button class="editbutton" type="submit">Edit</button>
                            </form>
                        </td>
                        <td>
                            <form action="/remove/${user.id}">
                                <button class="editbutton" type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${empty listUsers}">
            <h1>List is empty</h1>
        </c:if>
    </div>
</div>
</body>
</html>
