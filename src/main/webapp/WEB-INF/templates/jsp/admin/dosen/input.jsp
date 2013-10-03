<%-- 
    Document   : input
    Created on : Sep 20, 2013, 5:25:08 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Dosen</title>
    </head>
    <body>
        <c:if test="${not empty pesanTampil}">
            <script>
                notifPesan("${pesanTampil}","${jenisPesan}");
            </script>
        </c:if>
        <sf:form method="POST" action="input" modelAttribute="dosen" class="-form _horizontal_">
            <sf:hidden path="id"/>
            <div class="-form-row">
               <label>NIDN</label>
               <span class="-form-field -col3">
                   <sf:input path="nidn" placeholder="NIDN" required="required" />
               </span>
            </div>
            <div class="-form-row">
                <label>Nama Dosen</label>
                <span class="-form-field -col3">
                    <sf:input path="namaDosen" placeholder="Nama Dosen" required="required"/><br>
                </span>
            </div>
            <div class="-form-row">
                <label>Alamat</label>
                <span class="-form-field -col3">
                    <sf:input path="alamat" placeholder="Alamat"/><br>
                </span>
            </div>
            <div class="-form-row">
                <label>Tempat Lahir</label>
                <span class="-form-field -col3">
                    <sf:input path="tempatLahir" placeholder="Tempat Lahir"/><br>
                </span>
            </div>    
            <div class="-form-row">
                <label>Tanggal Lahir</label>
                <span class="-form-field -col3">
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${dosen.tglLahir}" var="tglLahirString"/>
                    <input name="tglLahirString" type="date" placeholder="Tanggal Lahir" value="${tglLahirString}"/><br>
                </span>
            </div>
            <div class="-form-row">
                <label>Jabatan</label>
                <span class="-form-field -col3">
                    <sf:select path="jabatan">
                        <sf:option value="">Pilih Jabatan</sf:option>
                        <sf:option value="GB">GB</sf:option>
                        <sf:option value="LK">LK</sf:option>
                        <sf:option value="L">L</sf:option>
                        <sf:option value="AA">AA</sf:option>
                    </sf:select>
                    <i class="-caret"></i>
                </span>
            </div>
            <div class="-form-row">
                <label>No Telpon</label>
                <span class="-form-field -col3">
                    <sf:input path="noTelpon" type="tel" placeholder="No Telpon"/><br>
                </span>
            </div>
            <div class="-form-row">
                <label>Email</label>
                <span class="-form-field -col3">
                    <sf:input path="email" type="email" placeholder="Email"/><br>
                </span>
            </div>
            <div class="-form-row">                
                 <div class="-form-group">
                    <input type="submit" value="simpan" class="-btn"/>
                    <input type="reset" value="batal" class="-btn -error-"/>
                </div>
            </div>
        </sf:form>
    </body>
</html>
