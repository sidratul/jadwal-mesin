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
        <div class="edit_jadwal">
            <h3>Edit Jadwal</h3>
            <sf:form method="POST"  modelAttribute="jadwal" class="">
                <sf:hidden path="id" />
                <sf:hidden path="mataKuliah.id"/>            
                <div class="">
                    <label>matakuliah</label>
                    <span class="">
                        <input type="text" placeholder="Ruang" readonly="readonly" class="span4" value="${jadwal.mataKuliah.namaMatkul}"/>
                    </span>
                </div>
                <div class="">
                    <label>Dosen</label>
                    <span class="">
                        <sf:select path="dosen.id" class="span4">
                            <sf:option value="" >Pilih Dosen</sf:option>
                            <c:forEach items="${listDosen}" var="ld">
                                <sf:option value="${ld.id}">${ld.namaDosen}</sf:option>
                            </c:forEach>
                        </sf:select>
                    </span>
                </div>
                <div class="">
                    <label>Kelas</label>
                    <span class="">
                        <sf:select path="kelas" class="span4">
                            <sf:option value="">Pilih Kelas</sf:option>
                            <sf:option value="a">A</sf:option>
                            <sf:option value="b">B</sf:option>
                            <sf:option value="c">C</sf:option>
                            <sf:option value="d">D</sf:option>
                            <sf:option value="e">E</sf:option>
                            <sf:option value="f">F</sf:option>
                        </sf:select>
                    </span>
                </div>
                <div class="">
                    <label>Jam</label>
                    <span class="">
                        <fmt:formatDate pattern="HH:mm:ss" value="${jadwal.jamMulai}" var="valueJam"></fmt:formatDate>
                        <input type="time" name="jamMulaiString" step="00" value="${valueJam}"/>
                    </span>
                </div>
                <div class="">
                    <label>Ruang</label>
                    <span class="">
                        <sf:input path="ruang" placeholder="Ruang" class="span4"/>
                    </span>
                </div>
                <div class="">
                    <label>Hari</label>
                    <span class="">
                        <sf:select path="hari" class="span4" required="required">
                            <sf:option value="">Pilih Hari</sf:option>                        
                            <sf:option value="2">senin</sf:option>
                            <sf:option value="3">selasa</sf:option>
                            <sf:option value="4">rabu</sf:option>
                            <sf:option value="5">kamis</sf:option>
                            <sf:option value="6">jumat</sf:option>
                        </sf:select>
                        
                    </span>
                </div>
                <div class="">
                    <label>Keterangan</label>
                    <span class="">
                        <sf:select path="keterangan" class="span4">
                            <sf:option value="0">Pilih Keterangan</sf:option>
                            <sf:option value="1">Hadir</sf:option>
                            <sf:option value="2">Izin</sf:option>
                            <sf:option value="3">Absen</sf:option>
                            <sf:option value="4">Tugas</sf:option>
                            <sf:option value="5">Sakit</sf:option>
                            <sf:option value="6">UTS</sf:option>
                            <sf:option value="7">Diganti</sf:option>
                            <sf:option value="8">Pengumuman</sf:option>
                        </sf:select>
                    </span>
                </div>
                <div class="">                
                    <input type="submit" value="Simpan" class="btn btn-info span2"/>
                    <input type="reset" value="Batal" class="btn btn-info span2"/>
                </div>            
            </sf:form>
        </div>
    </body>
</html>
