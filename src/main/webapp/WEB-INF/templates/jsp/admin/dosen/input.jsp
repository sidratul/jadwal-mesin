<%-- 
    Document   : input
    Created on : Sep 20, 2013, 5:25:08 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Dosen</title>
    </head>
    <body>
        <sf:form method="POST" action="input" modelAttribute="dosen">
            <sf:hidden path="id"/>
            <sf:input path="nidn" placeholder="NIDN"/><br>
            <sf:input path="namaDosen" placeholder="Nama Dosen"/><br>
            <sf:input path="alamat" placeholder="Alamat"/><br>
            <sf:input path="noTelpon" placeholder="No Telpon"/><br>
            <sf:input path="email" placeholder="Email"/><br>
            <input type="submit" value="tambah"/>
        </sf:form>
    </body>
</html>
