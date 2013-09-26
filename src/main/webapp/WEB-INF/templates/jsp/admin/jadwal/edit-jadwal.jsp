<%-- 
    Document   : edit-jadwal
    Created on : Sep 24, 2013, 11:01:42 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Jadwal Matakuliah</title>
    </head>
    <body>
        <sf:form method="POST" action="edit-jadwal" modelAttribute="jadwal" class="-form _horizontal_">
            <sf:hidden path="id" />
            <sf:hidden path="mataKuliah.id"/>
            Matakuliah : ${jadwal.mataKuliah.namaMatkul}<br>
            <div class="-form-row">
                <label>Dosen</label>
                <span class="-form-field -col3">
                    <sf:select path="dosen.id">
                        <c:forEach items="${listDosen}" var="ld">
                            <sf:option value="${ld.id}">${ld.namaDosen}</sf:option>
                        </c:forEach>
                    </sf:select>
                    <i class="-caret"></i>
                </span>
            </div>
            <div class="-form-row">
                <label>Jam</label>
                <span class="-form-field -col3">
                    <fmt:formatDate pattern="HH:mm:ss" value="${jadwal.jamMulai}" var="valueJam"></fmt:formatDate>
                    <input type="time" name="jamMulaiString" step="00" value="${valueJam}" required="required"/>
                </span>
            </div>
            <div class="-form-row">
                <label>Ruang</label>
                <span class="-form-field -col3">
                    <sf:input path="ruang" placeholder="Ruang"/>
                </span>
            </div>
            <div class="-form-row">
                <label>Hari</label>
                <span class="-form-field -col3">
                    <sf:select path="hari">
                        <sf:option value="1">minggu</sf:option>
                        <sf:option value="2">senin</sf:option>
                        <sf:option value="3">selasa</sf:option>
                        <sf:option value="4">rabu</sf:option>
                        <sf:option value="5">kamis</sf:option>
                        <sf:option value="6">jumat</sf:option>
                        <sf:option value="7">sabtu</sf:option>
                    </sf:select>
                </span>
            </div>
                <div class="-form-row">
                <label>Keterangan</label>
                <span class="-form-field -col3">
                    <sf:select path="keterangan">
                        <sf:option value="0">-</sf:option>
                        <sf:option value="1">hadir</sf:option>
                        <sf:option value="2">izin</sf:option>
                        <sf:option value="3">absen</sf:option>
                        <sf:option value="4">tugas</sf:option>
                        <sf:option value="5">sakit</sf:option>
                    </sf:select>
                </span>
            </div>
            <div class="-form-row">                
                 <div class="-form-group">
                    <input type="submit" value="Simpan" class="-btn"/>
                    <input type="reset" value="Batal" class="-btn -error-"/>
                </div>
            </div>            
        </sf:form>
    </body>
</html>
