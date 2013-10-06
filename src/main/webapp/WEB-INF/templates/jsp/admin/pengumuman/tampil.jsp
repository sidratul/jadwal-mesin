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
        <h3>&raquo; Pengumuman</h3>                
        <c:if test="${not empty pesanTampil}">
            <div class="alert alert-${jenisPesan}">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <span class="kapital"> <strong>${jenisPesan} !</strong> ${pesanTampil}</span>
              </div>
	</c:if>
        
        <c:choose>
            <c:when test="${empty listPengumuman}">
                <h3>Data Pengumuman Kosong</h3>
            </c:when>
            <c:otherwise>
                <table class="table table-striped table-hover tabel_jadwal">
                    <thead>
                        <tr class="tab-head">
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
                                <td><a href="input?id=${lp.id}" style="margin-right: 20px;">
                                    <img src="<%= request.getContextPath() %>/img/edit.png" width="20" title="Edit" alt="Edit" /></a> 
                                    <a href="hapus?id=${lp.id}">
                                    <img src="<%= request.getContextPath() %>/img/delete.png" width="20" title="Delete" alt="Delete" /></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="hapus-semua">Hapus Semua</a>
            </c:otherwise>
        </c:choose>
    </body>
</html>
