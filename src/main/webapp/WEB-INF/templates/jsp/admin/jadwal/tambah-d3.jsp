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
        <c:if test="${not empty pesanTambah}">
            <script>
                notifPesan("${pesanTambah}","${jenisPesan}");
            </script>
	</c:if>
        <h3>Tambah Jadwal D3</h3>
        <c:choose>
            <c:when test="${empty listMatkul}">
                <h3>Data matakuliah Kosong</h3>
            </c:when>
            <c:otherwise>
                <h3>SEMESTER ${listMatkul[0].semester}</h3>
                <ul class="-menu -tabs _active_ _TOP_ ">
                    <li><a href="tambah-d3?semester=1" class="btn btn-success">Semester 1</a></li>
                    <li><a href="tambah-d3?semester=2" class="btn btn-success">Semester 2</a></li>
                    <li><a href="tambah-d3?semester=3" class="btn btn-success">Semester 3</a></li>
                    <li><a href="tambah-d3?semester=4" class="btn btn-success">Semester 4</a></li>
                    <li><a href="tambah-d3?semester=5" class="btn btn-success">Semester 5</a></li>
                    <li><a href="tambah-d3?semester=6" class="btn btn-success">Semester 6</a></li>
                    <li><a href="tambah-d3?semester=7" class="btn btn-success">Semester 7</a></li>
                    <li><a href="tambah-d3?semester=8" class="btn btn-success">Semester 8</a></li>
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
                                    <a href="proses-tambah-d3?idMatkul=${lm.id}">tambahkan</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
