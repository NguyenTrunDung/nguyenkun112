<%-- 
    Document   : Nav
    Created on : Feb 28, 2024, 9:35:13 PM
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" data-bs-theme="dark">
            <div class="container">
                <h1 class="Logo navbar-brand fw-bold"  style="font-size:xx-large " >Spring-Store</h1>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                        aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a href="/RegisterController" ><button class="btn btn-group btn-light m-2">Register </button></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
