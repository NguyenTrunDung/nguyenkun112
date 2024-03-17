
<%@page import="java.text.ParseException"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modals.accounts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin cá nhân</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <script src="/validate.js"></script>

        <style>
            .TextShop{
                padding-left: 100px;
            }
            .button1{

                background-color:black;
                color: white;
                width: 130px
            }
            .button2{
                background-color:black;
                color: white;

            }

            .login_button{
                width: 600px;
                height: 50px;
                justify-items: center;
                text-align: center;
            }
            .footer-text{
                font-size: 20px;
                margin-bottom: 10px;
                font-weight: bold;
            }
            #Shoptext{
                text-align: center;
                color: white;
                padding-top: 20px;
                padding-bottom: 20px;
            }
            .Shoptext1{
                font-size: 28px;
                font-weight: bold
            }
            .Shoptext2{
                font-size: 20px;
                font-weight: bold
            }
            #linkfooter{
                text-decoration: none;
                color: white;
            }
            #BackToLogin{
                text-decoration: none;
                font-weight: bold
            }
        </style>
    </head>

</style>
</head>

<body>

    <%

        Cookie[] cookies = request.getCookies();
        if (session.getAttribute("acc") == null) {
            boolean flag = false;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
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
            if (cookies != null) {
                for (Cookie cookie : cookies) {
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

        accounts acc = (accounts) session.getAttribute("thongtinnguoidung");

    %>



    <!--Navbar-->
    <jsp:include page="Nav.jsp" />
    <!--Body home page-->
    <div class="container p-5">
        <div class="user-detail bg-white p-5">
            <div class="container">
                <div>
                    <h1 class="m-3 fw-bold">My Profile</h1>
                    <div class=" p-3 " id="profile">

                        <div class="">
                            <div class="row m-3">
                                <label class="col-3 fs-4 fw-bold">User name:</label>
                                <span class="col-8 fs-4"><%=acc.getAccountName()%></span>
                            </div>
                            <div class="row m-3">
                                <label class="col-3 fs-4 fw-bold">Day of birth:</label>
                                <span class="col-8 fs-4">
                                    <%=acc.getAccountDateOfBirth()%>
                                </span>
                            </div>
                            <div class="row m-3">
                                <label class="col-3 fs-4 fw-bold">Phone number:</label>
                                <span class="col-8 fs-4">
                                    <%=acc.getPhone()%>

                                </span>
                            </div>
                            <div class="row m-3">
                                <label class="col-3 fs-4 fw-bold">Address:</label>
                                <span class="col-8 fs-4">
                                    <%=acc.getAddress()%>
                                </span>
                            </div>
                        </div>
                        <div class="">
                            <button class="button1 fs-4 p-2 m-3 rounded-3" id="showedit">Edit</button>
                            <button class="button2 fs-4 p-2 m-3 rounded-3" id="showchangepass" >Change Password</button>
                        </div>
                    </div>
                </div>

                <div class="row" id="editprofile" style="display: none;">
                    <form action="Customer" method="post" id="editUser"  class="container p-3">
                        <h1 class="m-3 fw-bold">Chỉnh sửa hồ sơ</h1>
                        <div class="m-3">
                            <input type="hidden"  name="id" value="<%=acc.getAccountID()%>">

                        </div>
                        <div class="m-3">
                            <label class="form-label fw-bold fs-5">Username:</label>
                            <input id="userNameEdit" type="text" name="usernameEdit" class="form-control"
                                   placeholder="Enter username" value="<%=acc.getAccountName()%>">
                            <div class="m-3">
                            </div>
                            <p id="usernameEditError"></p>
                        </div>
                        <div class="m-3">
                            <label class="form-label fw-bold fs-5">Day of birth:</label>
                            <input id="birthday" type="date" name="birthday" class="form-control"
                                   value="<%= acc.getAccountDateOfBirth()%>">
                            <p id="birthEditError"></p>
                        </div>
                        <div class="m-3">
                            <label class="form-label fw-bold fs-5">Phone number:</label>
                            <input id="phone" type="text" name="phone" class="form-control"
                                   placeholder="Enter phone number" value="<%=acc.getPhone()%>">
                            <p id="phoneEditError"></p>
                        </div>
                        <div class="m-3">
                            <label class="form-label fw-bold fs-5">Address:</label>
                            <textarea id="address" name="address"
                                      class="form-control" placeholder="Enter address"><%= acc.getAddress()%></textarea>
                            <p id="addressEditError"></p>
                        </div>
                        <div class="m-3" align="center">
                            <button type="submit" onclick="checkEdited()" class="button1 fs-4 p-2 m-3 rounded-3 " id="editbtnId" name="editbtnName" value="editValue" > Confirm </button>
                            <button type="button" class="button1 fs-4 p-2 m-3 rounded-3" id="backbtn"> Return </button>
                        </div>
                    </form>
                </div>


                <div class="row" id="changepass" style="display: none;">
                    <form method="post" action="Customer"  class="container p-3 bg-body-tertiary rounded-5">
                        <h3 class="m-3">Change Password</h3>
                        <div class="m-3">
                            <label class="form-label fw-bold">Old password:</label>
                            <input id="oldpass" type="password" name="oldpass" class="form-control"
                                   placeholder="Enter old password">
                            <input type="hidden" name="id" value="<%= acc.getAccountID()%>">
                            <p id="oldpasserror"></p>
                        </div>
                        <div class="m-3">
                            <label class="form-label fw-bold">New password:</label>
                            <input id="newpass" type="password" name="newpass" class="form-control"
                                   placeholder="Enter new password">
                            <p id="newpasserror"></p>
                        </div>
                        <div class="m-3">
                            <label class="form-label fw-bold">Confirm new password:</label>
                            <input id="renewpass" type="password" name="renewpass" class="form-control"
                                   placeholder="Enter new password again">
                            <p id="renewpasserror"></p>
                        </div>
                        <div class="text-center">
                            <button type="submit" name="changepassbtn" id="changepassbtn" class="fs-4 rounded-5 ps-3 pe-3" onclick="checkChangePass()">Save </button>
                            <button type="button" class="fs-4 rounded-5 ps-3 pe-3" id="backbtn1">Back</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Footer-->
        <div id="Shoptext" class="bg-dark" >
            <p class="Shoptext1"> Giới thiệu về SpringShop</p>
            <p class="Shoptext2">SPRINGSHOP- Shop quần áo thời trang được thành lập vào năm 2024</p>
        </div>
        <jsp:include page="Footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

        <%
            if (request.getAttribute("display") != null) {
        %>
        <script>
                                const divContent1 = document.getElementById("changepass");
                                const divProfile = document.getElementById("profile");
                                divContent1.style.display = "block";
                                divProfile.style.display = "none";
        </script>
        <%
            }
        %>
        <script>
            const btnShow = document.getElementById("showedit");
            const btnShowChangepass = document.getElementById("showchangepass");
            const btnBack = document.getElementById("backbtn");
            const btnBack1 = document.getElementById("backbtn1");
            const divContent = document.getElementById("editprofile");
            const divContent1 = document.getElementById("changepass");
            const divProfile = document.getElementById("profile");


            btnShow.addEventListener("click", function () {
                divContent.style.display = "block";
                divProfile.style.display = "none";
            });

            btnShowChangepass.addEventListener("click", function () {
                divContent1.style.display = "block";
                divProfile.style.display = "none";
            });


            btnBack.addEventListener("click", function () {
                window.location.reload(true);
            });

            btnBack1.addEventListener("click", function () {
                window.location.reload(true);
            });



        </script>
        <%
            String alertMess = (String) request.getAttribute("alertChangePassError");
            if (alertMess != null && !alertMess.isEmpty()) {
        %>
        <script>
            alert("<%= alertMess%>");
        </script>
        <%
            }
        %>
        <script src="/validateforuser.js"></script>

</body>
</html>
