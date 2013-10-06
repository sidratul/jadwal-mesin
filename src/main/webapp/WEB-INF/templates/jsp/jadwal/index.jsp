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
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/img/logo.ico"/>
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
         <style>
            body{
                background: url(<%= request.getContextPath() %>/img/Background/bg13.jpg)no-repeat fixed;
                background-size: 100%
            }
        </style>
    </head>
    <body>
        <div class="judul">
            <h1><img src="<%= request.getContextPath() %>/img/logo-up.png" width="50" /> JURUSAN TEKNIK MESIN FTUP</h1>
        </div>
        <div class="container-fluid">
        <div class="row-fluid">
          <div class="span9">
            <!--Starta 1-->
            <c:choose>
                    <c:when test="${empty listJadwalS1}">
                        <div class="row sono"> 	
                            <div class="note-nihil">
                                <h2 class="note"><center>tidak ada jadwal S1 hari ini</center></h3>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row sono"> 	
                           <div class="row sono">
                                <div class="boxS1">
                                    <h3>&raquo; Starata 1</h3>
                                    <div class="tab">
                                        <table class="tab_jadwal table-striped table-bordered table-hover">
                                        <thead>
                                            <tr style="color: black">
                                                    <th style="width:2">No</th>
                                                    <th style="width:120">Jam</th>
                                                    <th style="width:200">Mata Kuliah</th>
                                                    <th style="width:280">Dosen</th>
                                                    <th>SKS</th>
                                                    <th>Semester</th>
                                                    <th style="width:80">Ruang</th>
                                                    <th>Keterangan</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listJadwalS1}" var="lj" varStatus="i">
                                                    <tr style="color:black">
                                                        <td style="text-align: center">${i.count}</td>
                                                        <td>
                                                            <fmt:formatDate pattern="HH:mm" value="${lj.jamMulai}"></fmt:formatDate> -
                                                            <fmt:formatDate pattern="HH:mm" value="${lj.jamSelesai}"></fmt:formatDate>
                                                        </td>
                                                        <td>${lj.mataKuliah.namaMatkul}</td>
                                                        <td>${lj.dosen.namaDosen}</td>
                                                        <td style="text-align: center">${lj.mataKuliah.sks}</td>
                                                        <td style="text-align: center">${lj.mataKuliah.semester}</td>
                                                        <td style="text-align: center">${lj.ruang}</td>                                
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
                                    </div>
                                </div>
                           </div>
                        </div>
                  </c:otherwise>
                </c:choose>
            
            <!--Diploma 3-->
            <c:choose>
                <c:when test="${empty listJadwalD3}">
                    <div class="row sono"> 	
                        <div class="note-nihil">
                            <h2 class="note"><center>tidak ada jadwal D3 hari ini</center></h3>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row sono"> 	
                       <div class="row sono">
                            <div class="boxD3">
                                <h3>&raquo; Diploma 3</h3>
                                <div class="tab">
                                    <table class="tab_jadwal table-striped table-bordered table-hover">
                                        <thead>
                                            <tr style="color: black">
                                                <th style="width:2">No</th>
                                                <th style="width:120;">Jam</th>
                                                <th style="width:200">Mata Kuliah</th>
                                                <th style="width:280">Dosen</th>
                                                <th>SKS</th>
                                                <th>Semester</th>
                                                <th style="width:80">Ruang</th>
                                                <th>Keterangan</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listJadwalD3}" var="lj" varStatus="i">
                                                <tr style="color:black">
                                                    <td style="text-align: center">${i.count}</td>
                                                    <td>
                                                        <fmt:formatDate pattern="HH:mm" value="${lj.jamMulai}"></fmt:formatDate> -
                                                        <fmt:formatDate pattern="HH:mm" value="${lj.jamSelesai}"></fmt:formatDate>
                                                    </td>
                                                    <td>${lj.mataKuliah.namaMatkul}</td>
                                                    <td>${lj.dosen.namaDosen}</td>
                                                    <td style="text-align: center">${lj.mataKuliah.sks}</td>
                                                    <td style="text-align: center">${lj.mataKuliah.semester}</td>
                                                    <td style="text-align: center">${lj.ruang}</td>                                
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
                                </div>
                            </div>
                       </div>
                    </div>
              </c:otherwise>
            </c:choose>
          </div>
          
            <!--pengumuman-->
            <div class="span3">
                <div>
                    <table class="tab_info">
                        <tr>
                            <td style="background:#4d6299;width: 50"><img src="<%= request.getContextPath() %>/img/jam.png" /></td>
                            <td class="jarak"><time id="jam"></time></td>
                        </tr>
                        <tr>
                            <td style="background:#ee5b92"><img src="<%= request.getContextPath() %>/img/Calendar.png" /></td>
                            <td class="jarak"><time>
                                  <c:set var="tanggalSkrg" value="<%=new java.util.Date()%>" />
                                  <fmt:formatDate pattern="EEEEE, dd MMMM yyyy" value="${tanggalSkrg}" />
                                </time></td>
                        </tr>

                    </table>
                </div>
            
             <div class="pallete-item" style="margin-bottom: 10px;">
                <dl class="palette palette-peter-river">
                    <span class="icon-bookmark"></span> Pengumuman <a href="<%= request.getContextPath() %>/admin/" style="float: right;color: white;text-decoration: none">Admin</a>
                </dl>
                 <dl class="palette palette-belize-hole" style="color: white">
                    <ol>
                        <c:forEach items="${listPengumuman}" var="lp">
                            <li>${lp.textPengumuman}</li>
                        </c:forEach>
                    </ol>
                </dl>
            </div>
                          
            <div>
                <dl class="palette palette-green-sea">
                    <center>Copyright &copy; 2013 SID Corporation</center>
                </dl>
            </div>              
                
          </div>
        </div>
      </div>
    </body>
</html>