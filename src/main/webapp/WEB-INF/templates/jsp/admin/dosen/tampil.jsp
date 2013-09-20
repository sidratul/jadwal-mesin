<%-- 
    Document   : tampil
    Created on : Sep 20, 2013, 8:55:52 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tampil Dosen</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty listDosen}">
                <h3>Data Dosen Kosong</h3>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NIDN</th>
                            <th>Nama</th>
                            <th>Alamat</th>
                            <th>No Telpon</th>
                            <th>Email</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach items="${listDosen}" var="ld" varStatus="i">
                                <th>${i.count}</th>
                                <th>${ld.NIDN}</th>
                                <th>${ld.Nama}</th>
                                <th>${ld.Alamat}</th>
                                <th>${ld.No_Telpon}</th>
                                <th>${ld.Email}</th>
                                <th><a href="input?id=${ld.ID}">edit</a></th>
                                <th><a href="hapus?id=${ld.ID}">edit</a></th>
                            </c:forEach>
                        </tr>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
