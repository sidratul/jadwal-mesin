<%-- 
    Document   : input
    Created on : Sep 23, 2013, 9:42:35 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" acontent="text/html; charset=UTF-8">
        <title>Input Matakuliah</title>
    </head>
    <body>
        <sf:form action="input" method="POST" modelAttribute="matakuliah" class="-form _horizontal_">
            <sf:hidden path="id"/>
            <div class="-form-row">
                <label>Kode Matakuliah</label>
                <span class="-form-field -col3">
                    <sf:input path="kodeMatkul" placeholder="Kode Matakuliah" required="required"/>
                </span>
            </div>
            <div class="-form-row">
                <label>Nama Matakuliah</label>
                <span class="-form-field -col3">
                    <sf:input path="namaMatkul" placeholder="Nama Matakuliah" required="required"/>
                </span>
            </div>
            <div class="-form-row">
                <label>SKS</label>
                <span class="-form-field -col3">
                    <sf:input type="number" max="5" min="1" path="sks" placeholder="SKS" required="required"/><br>
                </span>
            </div>
            <div class="-form-row">
                <label>Semester</label>
                <span class="-form-field -col3" required="required">
                    <sf:input type="number" max="8" min="1" path="semester" placeholder="Semester"/><br>
                </span>
            </div>
            <div class="-form-row">
                <label>Kategori</label>
                <span class="-form-field -col3">
                    <sf:select path="kategori" placeholder="Kategori" required="required">
                        <sf:option value="wajib">wajib</sf:option>
                        <sf:option value="pilihan">pilihan</sf:option>
                    </sf:select>
                    <i class="-caret"></i>
                </span>
            </div>
            <div class="-form-row">                
                 <div class="-form-group">
                    <input type="submit" value="tambah" class="-btn"/>
                    <input type="reset" value="batal" class="-btn -error-"/>
                </div>
            </div>
        </sf:form>
    </body>
</html>
