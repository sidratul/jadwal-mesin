<%-- 
    Document   : login
    Created on : Sep 30, 2013, 12:10:30 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="<c:url value='/j_spring_security_check'/>" method='POST'>
            <input type="text" name="j_username">
            <input type="password" name="j_password">
            <input type="submit" value="login">
        </form>
    </body>
</html>
