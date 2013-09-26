<%-- 
    Document   : index
    Created on : Sep 3, 2013, 9:32:29 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>Jadwal Mesin</title>
</head>
<body>
<section class="-row">
    <article class="-col8">
        <c:choose>
            <c:when test="${empty listJadwal}">
                <h3>Data Jadwal Kosong</h3>
            </c:when>
            <c:otherwise>
                <table class="-table _striped_ _hovered_">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>jam</th>
                            <th>matakuliah</th>
                            <th>dosen</th>
                            <th>SKS</th>
                            <th>Semester</th>
                            <th>ruang</th>
                            <th>hari</th>
                            <th>keterangan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listJadwal}" var="lj" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>
                                    <fmt:formatDate pattern="HH:mm" value="${lj.jamMulai}"></fmt:formatDate> -
                                    <fmt:formatDate pattern="HH:mm" value="${lj.jamSelesai}"></fmt:formatDate>
                                </td>
                                <td>${lj.mataKuliah.namaMatkul}</td>
                                <td>${lj.dosen.namaDosen}</td>
                                <td>${lj.mataKuliah.sks}</td>
                                <td>${lj.mataKuliah.semester}</td>
                                <td>${lj.ruang}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${lj.hari == 1}">Minggu</c:when>
                                        <c:when test="${lj.hari == 2}">Senin</c:when>
                                        <c:when test="${lj.hari == 3}">Selasa</c:when>
                                        <c:when test="${lj.hari == 4}">Rabu</c:when>
                                        <c:when test="${lj.hari == 5}">Kamis</c:when>
                                        <c:when test="${lj.hari == 6}">Jumat</c:when>
                                        <c:when test="${lj.hari == 7}">Sabtu</c:when>
                                    </c:choose> 
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${lj.keterangan == 1}">hadir</c:when>
                                        <c:when test="${lj.keterangan == 2}">izin</c:when>
                                        <c:when test="${lj.keterangan == 3}">absen</c:when>
                                        <c:when test="${lj.keterangan == 4}">tugas</c:when>
                                        <c:when test="${lj.keterangan == 5}">sakit</c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </article>
    <aside class="-col4">
        <h2>tanggal</h2>
        &Lt; prev - next &Gt;
        <hr>
        <h2>agenda</h2>
    </aside>
</section>
</body>
</html>