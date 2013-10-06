<%-- 
    Document   : input
    Created on : Sep 23, 2013, 9:42:35 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" acontent="text/html; charset=UTF-8">
        <title>Input Matakuliah</title>
    </head>
    <body>
        <c:if test="${not empty pesanTampil}">
            <div class="alert alert-${jenisPesan}">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <span class="kapital"> <strong>${jenisPesan} !</strong> ${pesanTampil}</span>
            </div>
        </c:if>
        <div class="form_input">
            <h3>Matakuliah</h3>
            <sf:form action="input" method="POST" modelAttribute="matakuliah" class="-form _horizontal_ kapital">
                <sf:hidden path="id"/>
                <div class="-form-row">
                    <label>Kode Matakuliah</label>
                    <span class="-form-field -col3">
                        <sf:input path="kodeMatkul" placeholder="Kode Matakuliah" class="span4" required="required"/>
                    </span>
                </div>
                <div class="-form-row">
                    <label>Nama Matakuliah</label>
                    <span class="-form-field -col3">
                        <sf:input path="namaMatkul" placeholder="Nama Matakuliah" class="span4" required="required"/>
                    </span>
                </div>
                <div class="-form-row">
                    <label>SKS</label>
                    <span class="-form-field -col3">
                        <sf:input type="number" max="5" min="1" path="sks" placeholder="SKS" required="required" class="span4"/><br>
                    </span>
                </div>
                <div class="-form-row">
                    <label>Semester</label>
                    <span class="-form-field -col3" required="required">
                        <sf:input type="number" max="8" min="1" path="semester" placeholder="Semester" class="span4"/><br>
                    </span>
                </div>
                <div class="-form-row">
                    <label>Kategori</label>
                    <span class="-form-field -col3">
                        <sf:select path="kategoriMatkul" placeholder="Kategori" required="required" class="span4">
                            <sf:option value="">Pilih Kategori</sf:option>
                            <sf:option value="wajib">Wajib</sf:option>
                            <sf:option value="pilihan">Pilihan</sf:option>
                        </sf:select>
                        <i class="-caret"></i>
                    </span>
                </div>
                <div class="-form-row">
                    <label>Tingkat</label>
                    <span class="-form-field -col3">
                        <sf:select path="kategoriTingkat" placeholder="Kategori" required="required" class="span4">
                            <sf:option value="">Pilih Tingkatan</sf:option>
                            <sf:option value="S1">Strata 1</sf:option>
                            <sf:option value="D3">Diploma 3</sf:option>
                        </sf:select>
                        <i class="-caret"></i>
                    </span>
                </div>
                <div class="-form-row">                
                     <div class="-form-group">
                        <input type="submit" value="Simpan" class="btn btn-info span2"/>
                        <input type="reset" value="Batal" class="btn btn-info span2"/>
                    </div>
                </div>
            </sf:form>
        </div>
    </body>
</html>
