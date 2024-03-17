<%-- 
    Document   : Home
    Created on : Mar 5, 2024, 9:44:09 PM
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

        <%

            Cookie[] cc = request.getCookies();
            if (session.getAttribute("acc") == null) {
                boolean flag = false;
                if (cc != null) {
                    for (Cookie cookie : cc) {
                        if (cookie.getName().equals("user") && !cookie.getValue().equals("") || cookie.getName().equals("staff") && !cookie.getValue().equals("")) {
                            session.setAttribute("id", cookie.getValue());
                            flag = true;
                            break;
                        }
                    }
                }
                if (!flag) {
                    response.sendRedirect("/LoginController");
                }
            } else {
                boolean flag = false;
                if (cc != null) {
                    for (Cookie cookie : cc) {
                        if (cookie.getName().equals("user") && !cookie.getValue().equals("") || cookie.getName().equals("staff") && !cookie.getValue().equals("")) {
                            session.setAttribute("id", cookie.getValue());
                            flag = true;
                            break;
                        }
                    }
                }
                if (!flag) {
                    response.sendRedirect("/LoginController");
                }
            }

        %>
        <h1>Hello World!</h1>
        <a href="/CustomerController/<%=session.getAttribute("id")%>"> Profile</a>
    </body>
</html>
