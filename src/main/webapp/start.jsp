<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="headstring">
        <h1 align="center">This is test job for Javarush internship by Alexey Klyuchko</h1>
    </div>
</header>
<h1 align="center">Simple CRUD application</h1>
<c:url var="users" value="/users/1"/>
<form action="${users}">
    <button class="startbutton" type="submit">Try it free*</button>
</form>
<h3 align="center">*without registration or sms</h3>
</body>
</html>