<%-- 
    Document   : input
    Created on : Sep 20, 2013, 5:25:08 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Dosen</title>
    </head>
    <body>
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
                <label>No Telpon</label>
                <span class="-form-field -col3">
                    <sf:input path="noTelpon" placeholder="No Telpon"/><br>
                </span>
            </div>
            <div class="-form-row">
                <label>Email</label>
                <span class="-form-field -col3">
                    <sf:input path="email" placeholder="Email"/><br>
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
