<%-- 
    Document   : index
    Created on : Sep 3, 2013, 9:32:29 AM
    Author     : sidratul
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="id">
    <head>
        <title>Teknik Mesin</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit-components.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit-animation.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/flat-ui.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
        <script>
            var int=self.setInterval(function(){clock();},1000);
            function clock(){
                var d=new Date();
                var t=d.toLocaleTimeString();
                document.getElementById("jam").innerHTML=t;
            }
        </script>
    </head>
    <body>
        <header align="center">
            <h1>JURUSAN TEKNIK MESIN FTUP</h1>
        </header>
        <div class="-row-fluid">
            <div class="-col8">
                <div style="margin: 20px 0px 20px 20px">
                    <div class="-row-fluid">
                        <div class="-col2" style="background:#1ABC9C">
                            <center>
                                <h4 style="color:white;">S1</h4>
                            </center>
                        </div>
                    </div>
                    <div class="-row-fluid">
                        <div class="-col12">
                            <c:choose>
                                <c:when test="${empty listJadwalS1}">
                                    <h3 class="kapital"> tidak ada jadwal s1 hari ini</h3>
                                </c:when>
                                <c:otherwise>
                                    <table class="-table _vertical_ _hovered_" style="background:white;color:#16A085">
                                        <thead>
                                            <tr class="s1">
                                                <th>No</th>
                                                <th>Jam</th>
                                                <th>Mata Kuliah</th>
                                                <th>Dosen</th>
                                                <th>SKS</th>
                                                <th>Semester</th>
                                                <th>Ruang</th>
                                                <th>Keterangan</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listJadwalS1}" var="lj" varStatus="i">
                                                <tr>
                                                    <td>${i.count}</td>
                                                    <td>
                                                        <fmt:formatDate pattern="HH:mm" value="${lj.jamMulai}"></fmt:formatDate> -
                                                        <fmt:formatDate pattern="HH:mm" value="${lj.jamSelesai}"></fmt:formatDate>
                                                    </td>
                                                    <td>${lj.mataKuliah.namaMatkul}</td>
                                                    <td>${lj.dosen.namaDosen}</td>
                                                    <td>${lj.mataKuliah.sks}</td>
                                                    <td>${lj.mataKuliah.semester}</td>
                                                    <td>${lj.ruang}</td>                                
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${lj.keterangan == 1}">hadir</c:when>
                                                            <c:when test="${lj.keterangan == 2}">izin</c:when>
                                                            <c:when test="${lj.keterangan == 3}">absen</c:when>
                                                            <c:when test="${lj.keterangan == 4}">tugas</c:when>
                                                            <c:when test="${lj.keterangan == 5}">sakit</c:when>
                                                            <c:otherwise>-</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                        
                    <br>
                    <div class="-row-fluid">
                        <div class="-col2" style="background:#3498DB">
                            <center>
                                <h4 style="color:white;">D3</h4>
                            </center>
                        </div>
                    </div>
                    <div class="-row-fluid">
                        <div class="-col12">
                            <c:choose>
                                <c:when test="${empty listJadwalD3}">
                                    <h3 class="kapital">tidak ada jadwal D3 hari ini</h3>
                                </c:when>
                                <c:otherwise>
                                    <table class="-table _vertical_ _hovered_" style="background:white;color:#2980B9">
                                        <thead>
                                            <tr class="d3">
                                                <th>No</th>
                                                <th>Jam</th>
                                                <th>Mata Kuliah</th>
                                                <th>Dosen</th>
                                                <th>SKS</th>
                                                <th>Semester</th>
                                                <th>Ruang</th>
                                                <th>Keterangan</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listJadwalD3}" var="lj" varStatus="i">
                                                <tr>
                                                    <td>${i.count}</td>
                                                    <td>
                                                        <fmt:formatDate pattern="HH:mm" value="${lj.jamMulai}"></fmt:formatDate> -
                                                        <fmt:formatDate pattern="HH:mm" value="${lj.jamSelesai}"></fmt:formatDate>
                                                    </td>
                                                    <td>${lj.mataKuliah.namaMatkul}</td>
                                                    <td>${lj.dosen.namaDosen}</td>
                                                    <td>${lj.mataKuliah.sks}</td>
                                                    <td>${lj.mataKuliah.semester}</td>
                                                    <td>${lj.ruang}</td>                                
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${lj.keterangan == 1}">hadir</c:when>
                                                            <c:when test="${lj.keterangan == 2}">izin</c:when>
                                                            <c:when test="${lj.keterangan == 3}">absen</c:when>
                                                            <c:when test="${lj.keterangan == 4}">tugas</c:when>
                                                            <c:when test="${lj.keterangan == 5}">sakit</c:when>
                                                            <c:otherwise>-</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

            <div class="-col4">
                <div style="margin: 20px 10px 20px 10px">				
                    <div class="span5" style="margin-bottom:20px">
                        <table class="-table logo _hovered_">
                            <tr>
                                <td style="background:#1ABC9C" align="center">
                                    <img src="img/logo-up.png" class="up" />
                                </td>
                                <td style="background:white">
                                    <a href="http://univpancasila.ac.id" target="_blank" style="font-size:18px;">Universitas Pancasila</a>
                                </td>
                            </tr>
                            <tr>
                                <td style="background:#4d6299" align="center">
                                    <img src="img/jam.png" class="up" />
                                </td>
                                <td style="background:white">
                                    <time style="font-size:18px;" id="jam">
                                    </time>
                                </td>
                            </tr>
                            <tr>
                                <td style="background:#ee5b92" align="center">
                                    <img src="img/Calendar.png" class="up" />
                                </td>
                                <td style="background:white">
                                    <time style="font-size:18px;">
                                        <c:set var="tanggalSkrg" value="<%=new java.util.Date()%>" />
                                        <fmt:formatDate pattern="EEEEE, dd MMMM yyyy" value="${tanggalSkrg}" />
                                    </time>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="span5" style="margin-bottom:20px">
                        <dl class="palette palette-turquoise">
                            <dt><span class="icon-bookmark"></span> Pengumuman <a href="admin/" style="float: right;color: white;text-decoration: none">Admin</a></dt>
                        </dl>
                        <dl class="palette palette-green-sea">
                            <ol>
                                <c:forEach items="${listPengumuman}" var="lp">
                                    <li>${lp.textPengumuman}</li>
                                </c:forEach>
                            </ol>
                        </dl>
                    </div>

                    <div class="span5" style="margin-bottom:30px">
                        <dl class="palette palette-emerald">
                            <span>Copyright&copy;2013 SID Corporation</span>
                        </dl>
                    </div>
                </div>			
            </div>
        </div>
    </body>
</html>