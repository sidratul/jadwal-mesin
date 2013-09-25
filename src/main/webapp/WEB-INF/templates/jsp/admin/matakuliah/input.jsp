<%-- 
    Document   : input
    Created on : Sep 23, 2013, 9:42:35 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" acontent="text/html; charset=UTF-8">
        <title>Input Matakuliah</title>
    </head>
    <body>
        <sf:form action="input" method="POST" modelAttribute="matakuliah">
            <sf:hidden path="id"/><br>
            <sf:input path="kodeMatkul" placeholder="Kode Matakuliah" /><br>
            <sf:input path="namaMatkul" placeholder="Nama Matakuliah"/><br>
            <sf:input path="sks" placeholder="SKS"/><br>
            <sf:input path="semester" placeholder="Smester"/><br>
            <sf:select path="kategori" placeholder="Kategori">
                <sf:option value="wajib">wajib</sf:option>
                <sf:option value="pilihan">pilihan</sf:option>
            </sf:select> <br>
            <input type="submit" value="tambah" />
        </sf:form>
    </body>
</html>
