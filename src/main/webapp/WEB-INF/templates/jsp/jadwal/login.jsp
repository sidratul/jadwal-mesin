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
        <title>login</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/flat-ui.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
        <style type="text/css">
            body {
              padding-top: 150px;
              padding-bottom: 40px;
              background-color: #f5f5f5;
            }

            .form-signin {
              max-width: 300px;
              padding: 19px 29px 29px;
              margin: 0 auto 20px;
              background-color: #fff;
              border: 1px solid #e5e5e5;
              -webkit-border-radius: 5px;
                 -moz-border-radius: 5px;
                      border-radius: 5px;
              -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                 -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                      box-shadow: 0 1px 2px rgba(0,0,0,.05);
            }
            .form-signin .form-signin-heading,
            .form-signin .checkbox {
              margin-bottom: 10px;
            }
            .form-signin input[type="text"],
            .form-signin input[type="password"] {
              font-size: 16px;
              height: auto;
              margin-bottom: 15px;
              padding: 7px 9px;
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
        <form class="form-signin" action="<c:url value='/j_spring_security_check'/>" method='POST'>
            <h2 class="form-signin-heading">Please Login</h2>
            <input type="text" class="input-block-level" placeholder="User Name" name="j_username" />
            <input type="password" class="input-block-level" placeholder="Password"name="j_password" />
            <input type="submit" value="Login"  class="btn btn-large btn btn-info">
            <!--<input type="reset" value="Cancel" class="btn btn-large btn-warning"/>-->
            <a href="../index" class="btn btn-large btn-success"/>Home</a>
        </form>
    </body>
</html>
