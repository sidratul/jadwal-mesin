<%-- 
    Document   : tambah
    Created on : Sep 24, 2013, 12:17:07 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty pesanTambah}">
            <script>
                notifPesan("${pesanTambah}","${jenisPesan}");
            </script>
	</c:if>
            <h3>&raquo; TAMBAH JADWAL ${listMatkul[0].kategoriTingkat} - <span style="color: #1ABC9C">SEMESTER ${listMatkul[0].semester}</span></h3>
            <div class="box-jadwal">
                <div>
                    <div class="btn-toolbar">
                        <div class="btn-group">
                        <c:forEach items="${listSemester}" var="ls" varStatus="i">
                          <a class="btn btn-primary" href="tambah?tingkat=${ls.kategoriTingkat}&semester=${ls.semester}">Semester ${ls.semester}</a>
                        </c:forEach>
                        </div>
                    </div>          
                </div>
                <c:choose>
                    <c:when test="${empty listMatkul}">
                        <h3>Data matakuliah Kosong</h3>
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
                                    <th><center>jadwal</center></th>
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
                                        <td><center>
                                            <a href="proses-tambah?idMatkul=${lm.id}&tingkat=${lm.kategoriTingkat}&semester=${lm.semester}">
                                            <img src="<%= request.getContextPath() %>/img/add.png" width="20" title="Tambahkan" alt="Tambahkan" /></a></center>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
        </div>
    </body>
</html>
