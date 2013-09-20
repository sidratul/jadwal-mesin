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
                                <td>${i.count}</td>
                                <td>${ld.NIDN}</td>
                                <td>${ld.nama_Dosen}</td>
                                <td>${ld.alamat}</td>
                                <td>${ld.no_Telpon}</td>
                                <td>${ld.email}</td>
                                <td><a href="input?id=${ld.ID}">edit</a></td>
                                <td><a href="hapus?id=${ld.ID}">hapus</a></td>
                            </c:forEach>
                        </tr>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
