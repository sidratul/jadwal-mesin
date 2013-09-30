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
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit-components.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit-animation.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style-admin.css">

	<script type="text/javascript" src="<%= request.getContextPath() %>/js/libs/html5shiv.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/libs/jquery.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/libs/easing.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/libs/imagesLoaded.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/libs/modernizr.js"></script>

	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.affix.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.scrollspy.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.popup.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.tabs.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.modal.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.carousel.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.button.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/plugins/maxmertkit.notify.js"></script>	
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/aplikasi.js"></script>
        <decorator:head></decorator:head>
    </head>
    <body>    
        <header>
            <h1>fakultas teknik jurusan mesin</h1>
            <ul class="-menu -tabs _active_ _TOP_ front">
                <li><a href="<%= request.getContextPath()%>/">HOME</a></li>
                <li>
                    <a>jadwal<i class="-caret"></i></a>
                    <div class="-dropdown">
                        <ul class="-menu ">
                            <li class="-menu-sub">
                                <a>S1</a>
                                <div class="-dropdown">
                                    <ul class="-menu">
                                        <li><a href="<%= request.getContextPath()%>/admin/jadwal/tampil-s1">Tampil</a></li>
                                        <li><a href="<%= request.getContextPath()%>/admin/jadwal/tambah-s1">Tambah</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="-menu-sub">
                                <a>D3</a>
                                <div class="-dropdown">
                                    <ul class="-menu">
                                        <li><a href="<%= request.getContextPath()%>/admin/jadwal/tampil-d3">Tampil</a></li>
                                        <li><a href="<%= request.getContextPath()%>/admin/jadwal/tambah-d3">Tambah</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a>matakuliah<i class="-caret"></i></a>
                    <div class="-dropdown">
                        <ul class="-menu ">
                            <li><a href="<%= request.getContextPath()%>/admin/matakuliah/tampil">tampil</a></li>
                            <li><a href="<%= request.getContextPath()%>/admin/matakuliah/input">input</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a>dosen <i class="-caret"></i></a>
                    <div class="-dropdown">
                        <ul class="-menu ">
                            <li><a href="<%= request.getContextPath()%>/admin/dosen/tampil">tampil</a></li>
                            <li><a href="<%= request.getContextPath()%>/admin/dosen/input">input</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a>pengumuman <i class="-caret"></i></a>
                    <div class="-dropdown _bottom_">                        
                        <ul class="-menu ">
                            <li><a href="<%= request.getContextPath()%>/admin/pengumuman/tampil">tampil</a></li>
                            <li><a href="<%= request.getContextPath()%>/admin/pengumuman/input">input</a></li>
                        </ul>
                    </div> 
                </li>
                <li>
                    <a><%= request.getUserPrincipal().getName() %> <i class="-caret"></i></a>
                    <div class="-dropdown _bottom_">                        
                        <ul class="-menu ">
                            <li><a href="<%= request.getContextPath()%>/admin/profil/tampil">Profil</a></li>
                            <li><a href="<c:url value="/j_spring_security_logout"/>">Keluar</a></li>
                        </ul>
                    </div> 
                </li>
            </ul>
        </header>
        <div class="container">
            <decorator:body ></decorator:body>
        </div>
        <footer>
            <div class="tengah">
                <div>Copyright &COPY; 2013</div>
                <div>Teknik Informatika Universitas Pancasila</div>
            </div>
        </footer>
    </body>
</html>
