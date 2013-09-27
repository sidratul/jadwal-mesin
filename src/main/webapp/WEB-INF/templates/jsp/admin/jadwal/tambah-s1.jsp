<%-- 
    Document   : tambah
    Created on : Sep 24, 2013, 12:17:07 PM
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
        <c:choose>
            <c:when test="${empty listMatkul}">
                <h3>Data matakuliah Kosong</h3>
            </c:when>
            <c:otherwise>
                <h3>SEMESTER ${listMatkul[0].semester}</h3>
                <ul class="-menu -tabs _active_ _TOP_ ">
                    <li><a href="tambah?semester=1">Semester 1</a></li>
                    <li><a href="tambah?semester=2">Semester 2</a></li>
                    <li><a href="tambah?semester=3">Semester 3</a></li>
                    <li><a href="tambah?semester=4">Semester 4</a></li>
                    <li><a href="tambah?semester=5">Semester 5</a></li>
                    <li><a href="tambah?semester=6">Semester 6</a></li>
                    <li><a href="tambah?semester=7">Semester 7</a></li>
                    <li><a href="tambah?semester=8">Semester 8</a></li>
                </ul>
                <table class="-table _striped_ _hovered_">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Kode Matakuliah</th>
                            <th>Nama Matakuliah</th>
                            <th>SKS</th>
                            <th>Semester</th>
                            <th>Kategori</th>
                            <th>jadwal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listMatkul}" var="lm" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${lm.kodeMatkul}</td>
                                <td>${lm.namaMatkul}</td>
                                <td>${lm.sks}</td>
                                <td>${lm.semester}</td>
                                <td>${lm.kategori}</td>
                                <td>
                                    <a href="proses-tambah-s1?idMatkul=${lm.id}">tambahkan</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
