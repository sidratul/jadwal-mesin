<%-- 
    Document   : tampil
    Created on : Sep 23, 2013, 9:42:15 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tampil Matakuliah</title>
    </head>
    <body>
        <c:if test="${not empty pesanTampil}">
            <div class="alert alert-${jenisPesan}">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <span class="kapital"> <strong>${jenisPesan} !</strong> ${pesanTampil}</span>
            </div>
            </c:if>
            <h3>&raquo; JADWAL ${listMatkul[0].kategoriTingkat} - <span style="color: #1ABC9C">SEMESTER ${listMatkul[0].semester}</span></h3>
            <div class="btn-toolbar">
                <div class="btn-group">
                <c:forEach items="${listSemester}" var="ls" varStatus="i">
                  <a class="btn btn-primary" href="tampil?tingkat=${ls.kategoriTingkat}&semester=${ls.semester}" class="btn btn-success">Semester ${ls.semester}</a>
                </c:forEach>
                </div>
            </div>
            <c:choose>
            <c:when test="${empty listMatkul}">
                <h3>Data Matakuliah Kosong</h3>
            </c:when>
            <c:otherwise>
                <table class="table table-striped table-hover tabel_jadwal">
                    <thead>
                        <tr class="tab-head">
                            <th>#</th>
                            <th>Kode Matakuliah</th>
                            <th>Nama Matakuliah</th>
                            <th>SKS</th>
                            <th>Semester</th>
                            <th>Kategori</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listMatkul}" var="lm" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${lm.kodeMatkul}</td>
                                <td class="kapital">${lm.namaMatkul}</td>
                                <td>${lm.sks}</td>
                                <td>${lm.semester}</td>
                                <td>${lm.kategoriMatkul}</td>
                                <td><a href="input?id=${lm.id}">
                                    <img src="<%= request.getContextPath() %>/img/edit.png" width="20" title="Edit" alt="Edit" /></a></td>
                                <td><a href="hapus?id=${lm.id}&tingkat=${lm.kategoriTingkat}">
                                    <img src="<%= request.getContextPath() %>/img/delete.png" width="20" title="Delete" alt="Delete" /></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>