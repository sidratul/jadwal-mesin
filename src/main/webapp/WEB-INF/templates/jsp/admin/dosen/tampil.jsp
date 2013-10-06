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
        <h3>&raquo; Daftar Dosen</h3>
        <c:if test="${not empty pesanTampil}">
            <div class="alert alert-${jenisPesan}">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <span class="kapital"> <strong>${jenisPesan} !</strong> ${pesanTampil}</span>
            </div>
	</c:if>
            
        <c:choose>
            <c:when test="${empty listDosen}">
                <h3>Data Dosen Kosong</h3>
            </c:when>
            <c:otherwise>
                <table class="table table-striped table-hover tabel_jadwal">
                    <thead>
                        <tr class="tab-head">
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
                                <td class="kapital">${ld.namaDosen}</td>
                                <td>${ld.alamat}</td>
                                <td class="kapital">
                                    ${ld.tempatLahir}
                                    <c:if test="${not empty ld.tempatLahir}">
                                        ,
                                    </c:if>
                                    <fmt:formatDate pattern="dd MMM yyyy" value="${ld.tglLahir}"/>
                                </td>
                                <td>${ld.noTelpon}</td>
                                <td>${ld.email}</td>
                                <td>${ld.jabatan}</td>
                                <td><a href="input?id=${ld.id}">
                                    <img src="<%= request.getContextPath() %>/img/edit.png" width="20" title="Edit" alt="Edit" /></a></td>
                                <td><a href="hapus?id=${ld.id}">
                                    <img src="<%= request.getContextPath() %>/img/delete.png" width="20" title="Delete" alt="Delete" /></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
