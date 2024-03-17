<%-- 
    Document   : index
    Created on : Feb 28, 2024, 5:57:08 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        .
        <% if (session.getAttribute("acc") != null) { %>
        <a href="/logout" ><button class="btn btn-group btn-light m-2">Logout </button></a>

        <% } else { %>
        <a href="/LoginController">Login</a>
        <% }%>
    </body>
</html>
