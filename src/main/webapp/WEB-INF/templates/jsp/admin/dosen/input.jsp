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
        <div class="form_input">
            <c:if test="${not empty pesanTampil}">
                <script>
                    notifPesan("${pesanTampil}","${jenisPesan}");
                </script>
            </c:if>
            <h3>Input Dosen</h3>
            <sf:form method="POST" action="input" modelAttribute="dosen" class="">
                <sf:hidden path="id"/>
                <div class="">
                   <label>NIDN</label>
                   <span class="">
                       <sf:input path="nidn" placeholder="NIDN" required="required" />
                   </span>
                </div>
                <div class="">
                    <label>Nama Dosen</label>
                    <span class="">
                        <sf:input path="namaDosen" placeholder="Nama Dosen" required="required"/><br>
                    </span>
                </div>
                <div class="">
                    <label>Alamat</label>
                    <span class="">
                        <sf:input path="alamat" placeholder="Alamat"/><br>
                    </span>
                </div>
                <div class="">
                    <label>Tempat Lahir</label>
                    <span class="">
                        <sf:input path="tempatLahir" placeholder="Tempat Lahir"/><br>
                    </span>
                </div>    
                <div class="">
                    <label>Tanggal Lahir</label>
                    <span class="">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${dosen.tglLahir}" var="tglLahirString"/>
                        <input name="tglLahirString" type="date" placeholder="Tanggal Lahir" value="${tglLahirString}"/><br>
                    </span>
                </div>
                <div class="">
                    <label>Jabatan</label>
                    <span class="">
                        <sf:select path="jabatan">
                            <sf:option value="">Pilih Jabatan</sf:option>
                            <sf:option value="GB">GB</sf:option>
                            <sf:option value="LK">LK</sf:option>
                            <sf:option value="L">L</sf:option>
                            <sf:option value="AA">AA</sf:option>
                        </sf:select>
                    </span>
                </div>
                <div class="">
                    <label>No Telpon</label>
                    <span class="">
                        <sf:input path="noTelpon" type="tel" placeholder="No Telpon"/><br>
                    </span>
                </div>
                <div class="">
                    <label>Email</label>
                    <span class="">
                        <sf:input path="email" type="email" placeholder="Email"/><br>
                    </span>
                </div>
                <div class="">                
                     <div class="">
                        <input type="submit" value="simpan" class="btn btn-info span2"/>
                        <input type="reset" value="batal" class="btn btn-info span2"/>
                    </div>
                </div>
            </sf:form>
        </div>
    </body>
</html>
