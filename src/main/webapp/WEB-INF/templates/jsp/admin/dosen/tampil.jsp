<%-- 
    Document   : tampil
    Created on : Sep 20, 2013, 8:55:52 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tampil Dosen</title>
    </head>
    <body>
        <c:if test="${not empty pesanTampil}">
            <script>
                notifPesan("${pesanTampil}","${jenisPesan}");
            </script>
	</c:if>
            
        <c:choose>
            <c:when test="${empty listDosen}">
                <h3>Data Dosen Kosong</h3>
            </c:when>
            <c:otherwise>
                <table class="-table _striped_ _hovered_">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NIDN</th>
                            <th>Nama</th>
                            <th>Alamat</th>
                            <th>TTL</th>
                            <th>No Telpon</th>
                            <th>Email</th>
                            <th>Jabatan</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listDosen}" var="ld" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${ld.nidn}</td>
                                <td>${ld.namaDosen}</td>
                                <td>${ld.alamat}</td>
                                <td>
                                    ${ld.tempatLahir} <fmt:formatDate pattern="dd MMM yyyy" value="${ld.tglLahir}"/>
                                </td>
                                <td>${ld.noTelpon}</td>
                                <td>${ld.email}</td>
                                <td>${ld.jabatan}</td>
                                <td><a href="input?id=${ld.id}">edit</a></td>
                                <td><a href="hapus?id=${ld.id}">hapus</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
