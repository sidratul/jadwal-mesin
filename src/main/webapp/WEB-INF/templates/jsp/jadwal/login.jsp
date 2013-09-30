<%-- 
    Document   : login
    Created on : Sep 30, 2013, 12:10:30 AM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <style type="text/css">
            body {
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }
            
            .-form {
                max-width: 300px;
                padding: 19px 29px 29px;
                margin: 0 auto 20px;
                margin-top: 50px;
                background-color: #fff;
                border: 1px solid #e5e5e5;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                    border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                    box-shadow: 0 1px 2px rgba(0,0,0,.05);
            }            
        </style>
    </head>
    <body>
        <c:if test="${not empty error}">
            <script>
                $.notify('${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}', {
                    header: 'Login Gagal!!!',
                    theme: 'error',
                    type: 'stick'
                });
            </script>
	</c:if>
        <form class="-form _vertical_" action="<c:url value='/j_spring_security_check'/>" method='POST'>
            <h1>Login</h1>
            <label>Username</label>
            <span class="-form-field">
                <input type="text" name="j_username" class="-col3">
            </span>
            
            <label>Password</label>
            <span class="-form-field">
                 <input type="password" name="j_password" class="-col3">
            </span><br><br>
            <input type="submit" value="login" class="-btn">
            <input type="reset" value="cancel" class="-btn -error- -unstyled-"/>
            <a href="../index" class="-btn -primary- -unstyled-"/>home</a>
        </form>
    </body>
</html>
