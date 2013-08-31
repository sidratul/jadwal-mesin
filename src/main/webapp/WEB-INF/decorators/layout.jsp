<%-- 
    Document   : layout
    Created on : Aug 31, 2013, 7:00:45 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
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
</head>
<body>    
	<header>
		<h1>fakultas teknik jurusan mesin</h1>
	</header>	
        <decorator:body></decorator:body>
	<footer></footer>
</body>
</html>
