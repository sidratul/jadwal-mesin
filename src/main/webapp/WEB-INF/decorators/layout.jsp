<%-- 
    Document   : layout
    Created on : Aug 31, 2013, 7:00:45 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="id">
    <head>
	<title>Jadwal Mesin</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit-components.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/maxmertkit-animation.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">

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
            <ul class="-menu -tabs _active_ _TOP_">
                <li>
                    <a>jadwal<i class="-caret"></i></a>
                    <div class="-dropdown">
                        <ul class="-menu ">
                            <li><a href="<%= request.getContextPath()%>/admin/jadwal/tampil">tampil</a></li>
                            <li><a href="<%= request.getContextPath()%>/admin/jadwal/tambah">tambah jadwal</a></li>
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
                    <a>pengumuman<i class="-caret"></i></a>
                    <div class="-dropdown _bottom_">                        
                        <ul class="-menu ">
                            <li><a>tampil</a></li>
                            <li><a>input</a></li>
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
                <div>Teknik Informatika Universitas asdfasd</div>
            </div>
        </footer>
</body>
</html>
