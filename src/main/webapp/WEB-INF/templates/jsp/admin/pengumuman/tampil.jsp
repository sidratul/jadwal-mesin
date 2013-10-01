<%-- 
    Document   : tampil
    Created on : Sep 26, 2013, 5:34:39 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>tampil pengumuman</title>
    </head>
    <body>
        <c:if test="${not empty pesanTampil}">
            <script>
                notifPesan("${pesanTampil}","${jenisPesan}");
            </script>
	</c:if>
        
        <c:choose>
            <c:when test="${empty listPengumuman}">
                <h3>Data Pengumuman Kosong</h3>
            </c:when>
            <c:otherwise>
                <h3>Pengumuman</h3>                
                <table class="-table _striped_ _hovered_">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Pengumuman</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listPengumuman}" var="lp" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${lp.textPengumuman}</td>
                                <td><a href="input?id=${lp.id}">edit</a></td>
                                <td><a href="hapus?id=${lp.id}">hapus</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="hapus-semua">Hapus Semua</a>
            </c:otherwise>
        </c:choose>
    </body>
</html>
