<%-- 
    Document   : tampil
    Created on : Sep 24, 2013, 12:16:54 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty listJadwal}">
                <h3>Data Jadwal Kosong</h3>
            </c:when>
            <c:otherwise>
                <h3>JADWAL S1</h3>
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
                            <th colspan="2">&nbsp;</th>
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
                                <td><a href="edit-jadwal-s1?id=${lj.id}">edit</a></td>
                                <td><a href="hapus-s1?id=${lj.id}">tutup</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
