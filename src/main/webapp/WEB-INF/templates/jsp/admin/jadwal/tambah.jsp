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
        <h3>TAMBAH JADWAL ${listMatkul[0].kategoriTingkat} &sdot; SEMESTER ${listMatkul[0].semester}</h3>
        <ul class="-menu -tabs _active_ _TOP_ ">
            <c:forEach items="${listSemester}" var="ls" varStatus="i">
                <li>
                    <a href="tambah?tingkat=${ls.kategoriTingkat}&semester=${ls.semester}" class="btn btn-success">Semester ${ls.semester}</a>
                </li>
            </c:forEach>
        </ul>
        <c:choose>
            <c:when test="${empty listMatkul}">
                <h3>Data matakuliah Kosong</h3>
            </c:when>
            <c:otherwise>
                <table class="-table _striped_ _hovered_">
                    <thead>
                        <tr class="kapital">
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
                                <td class="kapital">${lm.namaMatkul}</td>
                                <td>${lm.sks}</td>
                                <td>${lm.semester}</td>
                                <td>${lm.kategoriMatkul}</td>
                                <td>
                                    <a href="proses-tambah?idMatkul=${lm.id}&tingkat=${lm.kategoriTingkat}&semester=${lm.semester}">tambahkan</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
