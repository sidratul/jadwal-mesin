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
        <div class="form_input">
            <h3>Input Pengumuman</h3>
            <sf:form action="input" method="POST" modelAttribute="pengumuman" class="-form _horizontal_">
                <sf:hidden path="id"/>
                <div class="-form-row">
                    <label>pengumuman</label>
                    <span class="-form-field -col3">
                        <sf:textarea path="textPengumuman" required="required" class="span2"></sf:textarea>
                    </span>
                </div>
                <div class="-form-row">                
                     <div class="-form-group">
                        <input type="submit" value="Tambah" class="btn btn-info span2"/>
                        <input type="reset" value="Batal" class="btn btn-info span2"/>
                    </div>
                </div>
            </sf:form>
        </div>
    </body>
</html>
