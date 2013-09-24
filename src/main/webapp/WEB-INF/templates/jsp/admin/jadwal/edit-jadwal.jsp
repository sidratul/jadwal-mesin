<%-- 
    Document   : edit-jadwal
    Created on : Sep 24, 2013, 11:01:42 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Jadwal Matakuliah</title>
    </head>
    <body>
        <sf:form method="POST" action="edit-jadwal" modelAttribute="jadwal">
            <sf:hidden path="id" />
            <sf:hidden path="mataKuliah.id"/>
            Matakuliah :${jadwal.mataKuliah.namaMatkul}<br>
            Dosen : 
            <sf:select path="dosen.id">
                <c:forEach items="${listDosen}" var="ld">
                    <sf:option value="${ld.id}">${ld.namaDosen}</sf:option>
                </c:forEach>
            </sf:select><br>
            jam : <sf:input type="time" path="waktu" step="30"/><br>
            ruang : <sf:input path="ruang" placeholder="Ruang"/><br>
            hari : 
            <sf:select path="hari">
                <sf:option value="0">minggu</sf:option>
                <sf:option value="1">senin</sf:option>
                <sf:option value="2">selasa</sf:option>
                <sf:option value="3">rabu</sf:option>
                <sf:option value="4">kamis</sf:option>
                <sf:option value="5">jumat</sf:option>
                <sf:option value="6">sabtu</sf:option>
            </sf:select><br>
            keterangan : 
            <sf:select path="keterangan">
                <sf:option value="0">-</sf:option>
                <sf:option value="1">hadir</sf:option>
                <sf:option value="2">izin</sf:option>
                <sf:option value="3">absen</sf:option>
                <sf:option value="4">tugas</sf:option>
                <sf:option value="5">sakit</sf:option>
            </sf:select><br>
        </sf:form>
    </body>
</html>
