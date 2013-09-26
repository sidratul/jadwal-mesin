<%-- 
    Document   : input
    Created on : Sep 26, 2013, 5:34:49 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>input pengumuman</title>
    </head>
    <body>
        <h3>Input Pengumuman</h3>
        <sf:form action="input" method="POST" modelAttribute="pengumuman" class="-form _horizontal_">
            <sf:hidden path="id"/>
            <div class="-form-row">
                <label>Kode Matakuliah</label>
                <span class="-form-field -col3">
                    <sf:textarea path="textPengumuman"></sf:textarea>
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
