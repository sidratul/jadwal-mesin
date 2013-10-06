<%-- 
    Document   : layout
    Created on : Aug 31, 2013, 7:00:45 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="id">
    <head>
	<title>Jadwal Mesin</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/flat-ui.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style-admin.css">
        
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/aplikasi.js"></script>
        <decorator:head></decorator:head>
        <style>
            body{
                background: #ccc;
            }
        </style>
    </head>
    <body>    
        <div class="container">
            <header>
            <table style="margin-bottom: 10px">
                <tr><td width="60"><img src="<%= request.getContextPath() %>/img/logo-up.png" width="50" /></td>
                <td><h1>Jurusan Teknik Mesin FTUP</h1></td></tr>
            </table>
            </header>
        <!--menu-->
        <nav>
            <div class="navbar navbar-inverse">
                    <div class="navbar-inner">

                        <div class="nav-collapse collapse" id="nav-collapse-01">
                          <ul class="nav">
                                <li>
                                  <a href="<%= request.getContextPath()%>/">
                                        Home
                                        <span class="navbar-unread">1</span>
                                  </a>
                                </li>
                                <li>
                                  <a href="#fakelink">
                                        Jadwal
                                  </a>
                                  <ul>
                                        <li>
                                          <a href="#fakelink">Strata 1</a>
                                          <ul>
                                                <li><a href="<%= request.getContextPath()%>/admin/jadwal/tampil?tingkat=S1">Lihat Data</a></li>
                                                <li><a href="<%= request.getContextPath()%>/admin/jadwal/tambah?tingkat=S1">Masukan Data</a></li>
                                          </ul>
                                        </li>
                                        <li>
                                          <a href="#fakelink">Diploma 3</a>
                                          <ul>
                                                <li><a href="<%= request.getContextPath()%>/admin/jadwal/tampil?tingkat=D3">Lihat Data</a></li>
                                                <li><a href="<%= request.getContextPath()%>/admin/jadwal/tambah?tingkat=D3">Masukan Data</a></li>
                                          </ul>
                                        </li>								
                                  </ul>
                                </li>
                                <li>
                                  <a href="#fakelink">
                                        Matakuliah
                                  </a>
                                  <ul>
                                        <li><a href="<%= request.getContextPath()%>/admin/matakuliah/tampil?tingkat=S1">Lihat Data S1</a></li>
                                        <li><a href="<%= request.getContextPath()%>/admin/matakuliah/tampil?tingkat=D3">Lihat Data D3</a></li>
                                        <li><a href="<%= request.getContextPath()%>/admin/matakuliah/input">Masukan Data</a></li>								
                                  </ul>
                                </li>
                                <li>
                                  <a href="#fakelink">
                                        Dosen
                                  </a>
                                  <ul>
                                        <li><a href="<%= request.getContextPath()%>/admin/dosen/tampil">Lihat Data</a></li>
                                        <li><a href="<%= request.getContextPath()%>/admin/dosen/input">Masukan Data</a></li>								
                                  </ul>
                                </li>
                                <li>
                                  <a href="#fakelink">
                                        Pengumuman
                                  </a>
                                  <ul>
                                        <li><a href="<%= request.getContextPath()%>/admin/pengumuman/tampil">Lihat Data</a></li>
                                        <li><a href="<%= request.getContextPath()%>/admin/pengumuman/input">Masukan Data</a></li>								
                                  </ul>
                                </li>
                                <li>
                                  <a href="#fakelink">
                                      <%= request.getUserPrincipal().getName() %>
                                  </a>
                                  <ul>
                                        <!--<li><a href="#">Profil</a></li>-->
                                        <li><a href="<c:url value="/j_spring_security_logout"/>">Keluar</a></li>								
                                  </ul>
                                </li>

                          </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <div class="container">
            <div style="background: #eaedf2;padding:10px 10px 30px 10px">
            <decorator:body ></decorator:body>
            </div>
            <div class="ft">
                Copyright &copy; 2013 SID Corporation
            </div>
        </div>
    </body>
</html>
