<%-- 
    Document   : tampil
    Created on : Sep 23, 2013, 9:42:15 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tampil Matakuliah</title>
    </head>
    <body>
        <c:if test="${not empty pesanTampil}">
            <script>
                notifPesan("${pesanTampil}","${jenisPesan}");
            </script>
	</c:if>
        <c:choose>
            <c:when test="${empty listMatkul}">
                <h3>Data Matakuliah Kosong</h3>
            </c:when>
            <c:otherwise>
                <h3>SEMESTER ${listMatkul[0].semester}</h3>
                <ul class="-menu -tabs _active_ _TOP_ ">
                    <c:forEach items="${listSemester}" var="ls" varStatus="i">
                        <li>
                            <a href="tampil?tingkat=${ls.kategoriTingkat}&semester=${ls.semester}" class="btn btn-success">Semester ${ls.semester}</a>
                        </li>
                    </c:forEach>
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
                            <th colspan="2">&nbsp;</th>
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
                                <td>${lm.kategoriMatkul}</td>
                                <td><a href="input?id=${lm.id}">edit</a></td>
                                <td><a href="hapus?id=${lm.id}&tingkat="+${ld.kategoriTingkat}>hapus</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>