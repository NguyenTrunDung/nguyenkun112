<%-- 
    Document   : Login_Register
    Created on : Feb 3, 2024, 8:24:51 PM
    Author     : Acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập - Đăng ký</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="index.css>
    </head>

    <body>
        <!--Navbar-->
         <jsp:include page="Nav.jsp" />



        <div class="container">
            <div class="row justify-content-around">
                <!--Form Login-->
                <form method="post" action="LoginController" id="loginform" class="col-6 p-3 m-5 ">
                    <h2 class="m-3">Login</h2>

                    <div class="m-3">
                        <label class="form-label fw-bold">Email:</label>
                        <input id="email" type="text" name="email1" class="form-control" placeholder="Enter email">
                        <p id="emailerror"></p>
                    </div>
                    <div class="m-3">
                        <label class="form-label fw-bold">Password:</label>
                        <input id="password" type="password" name="password1" class="form-control"
                               placeholder="Enter password">
                        <p id="passerror"></p>
                    </div>

                    <div class="text-center m-2">
                        <a class="link-dark" href="ForgotPassword.jsp" style="text-decoration: underline">Forgot password</a> <br>
                    </div>
                    <p class="m-3" style="color:red">${requestScope.error}</p>
                    <div class=" m-3">
                        <button type="submit"
                                class="login_button btn btn-dark btn-lg btn-block  " name="btnLogin" onclick="checkLogin()" value="login" >Login</button>
                    </div>

                </form>

            </div>
        </div>
        <div id="Shoptext" class="bg-dark" >
            <p class="Shoptext1"> Giới thiệu về SpringShop</p>
            <p class="Shoptext2">SPRINGSHOP- Shop quần áo thời trang được thành lập vào năm 2024</p>
        </div>
        <jsp:include page="Footer.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

        <script>
                                    window.addEventListener('load', () => {
                                        var loadingscreen = document.querySelector('.loader');
                                        if (loadingscreen) {
                                            loadingscreen.classList.add("loader_hidden");
                                            loadingscreen.addEventListener('transitionend', () => {
                                                document.body.style.overflow = "auto";
                                                document.body.classList.remove("loader");
                                            });
                                        }
                                    });

                                    var emailValidation1 = /^[A-z]+[^\@\s]+\@[^\s]+\.[^\s]{2,}$/;
                                    var emailValidation2 = /^[A-z]+\@[^\s]+\.[^\s]{2,}$/;
                                    var numberValidation = /^0+[0-9]{9,10}$/;

                                    function checkReset() {
                                        document.getElementById('emailerror').innerHTML = "";
                                        document.getElementById('emailerror1').innerHTML = "";
                                        document.getElementById('usernameerror').innerHTML = "";
                                        document.getElementById('passerror').innerHTML = "";
                                        document.getElementById('passerror1').innerHTML = "";
                                        document.getElementById('repasserror').innerHTML = "";
                                        document.getElementById('birtherror').innerHTML = "";
                                        document.getElementById('phoneerror').innerHTML = "";
                                        document.getElementById('addresserror').innerHTML = "";

                                    }
                                    function checkValidate() {
                                        checkEmailRegister();
                                        checkEmailLogin();
                                        checkUsername();
                                        checkPasswordLogin();
                                        checkPasswordRegister();
                                        checkBirthday();
                                        checkPhone();
                                        checkAddress();
                                    }


                                    function checkEmailLogin() {
                                        var email = document.getElementById('email').value;
                                        if (!emailValidation1.test(email) && !emailValidation2.test(email) && email == "") {

                                            return false;
                                        } else {
//            document.getElementById('emailerror').innerHTML = "";
                                            return true;
                                        }
                                    }


                                    function checkEmailEdit() {
                                        var email = document.getElementById('emailedit').value;
                                        if (email == "") {
//        document.getElementById('emailerror1').innerHTML = "Email cannot be empty";
//        document.getElementById('emailerror1').style.color = "red";
                                            return false;

                                        } else {
                                            if (!emailValidation1.test(email) && !emailValidation2.test(email)) {
//            document.getElementById('emailerror1').innerHTML = "Email is invalid";
//            document.getElementById('emailerror1').style.color = "red";
                                                return false;
                                            } else {
//            document.getElementById('emailerror1').innerHTML = "";
                                                return true;
                                            }
                                        }
                                    }



                                    function checkUsernameEdit() {
                                        var name = document.getElementById('usernameedit').value.trim();

                                        if (name == "") {
//        document.getElementById('usernameerror').innerHTML = "Username cannot be empty";
//        document.getElementById('usernameerror').style.color = "red";
                                            return false;
                                        } else {
//        document.getElementById('usernameerror').innerHTML = "";
                                            return true;
                                        }
                                    }

                                    function checkPasswordLogin() {
                                        var password = document.getElementById('password').value;

                                        if (password.length < 6 || password.length > 20 || password == "") {

                                            return false;
                                        } else {
//        document.getElementById('passerror').innerHTML = "";
                                            return true;
                                        }
                                    }





//validate login form
                                    function checkLogin() {
                                        let emailerror = document.getElementById('emailerror');
                                        let passerror = document.getElementById('passerror');
                                        let check = true;
                                        if (checkEmailLogin() == false) {
                                            check = false;
                                            emailerror.innerHTML = "Email is invalid";
                                            emailerror.style.color = "red";
                                        } else {
                                            emailerror.innerHTML = "";
                                        }

                                        if (checkPasswordLogin() == false) {
                                            passerror.innerHTML = "Password must be between 6 and 20 characters";
                                            passerror.style.color = "red";
                                            check = false;
                                        } else {
                                            passerror.innerHTML = "";
                                        }
                                        if (!check) {
                                            event.preventDefault();
                                        } else {
                                            window.location.href = "Login";
                                        }

                                    }



//validate edit form
                                    function checkEdit() {
                                        let emailerror = document.getElementById('emailediterror');
                                        let nameerror = document.getElementById('usernameediterror');
                                        let birtherror = document.getElementById('birthediterror');
                                        let phoneerror = document.getElementById('phoneediterror');
                                        let addresserror = document.getElementById('addressediterror');
                                        let check = true;

                                        if (!checkEmailEdit()) {
                                            check = false;
                                            emailerror.innerHTML = "Email is invalid";
                                            emailerror.style.color = "red";
                                        } else {
                                            emailerror.innerHTML = "";
                                        }

                                        if (!checkUsernameEdit()) {
                                            check = false;
                                            nameerror.innerHTML = "Username cannot be empty";
                                            nameerror.style.color = "red";
                                        } else {
                                            nameerror.innerHTML = "";
                                        }

                                        if (!checkBirthdayEdit()) {
                                            check = false;
                                            birtherror.innerHTML = "Birthday cannot be empty";
                                            birtherror.style.color = "red";
                                        } else {
                                            birtherror.innerHTML = "";
                                        }
                                        if (!checkPhoneEdit()) {
                                            check = false;
                                            phoneerror.innerHTML = "Phone is invalid";
                                            phoneerror.style.color = "red";
                                        } else {
                                            phoneerror.innerHTML = "";
                                        }
                                        if (!checkAddressEdit()) {
                                            check = false;
                                            addresserror.innerHTML = "You have to provide your address";
                                            addresserror.style.color = "red";
                                        } else {
                                            addresserror.innerHTML = "";
                                        }

                                        if (!check) {
                                            event.preventDefault();
                                        } else {
                                            window.location.href = "User";
                                        }
                                    }

                                    function checkoldpass() {
                                        var oldpass1 = document.getElementById('oldpass').value;
                                        var oldpass2 = document.getElementById('oldpasscheck').value;

                                        if (oldpass1 === oldpass2) {
                                            return true;
                                        } else {
                                            return false;
                                        }
                                    }

                                    function checkNewpass() {
                                        var newpass = document.getElementById('newpass').value;

                                        if (newpass.length < 6 || newpass.length > 20 || newpass == "") {
                                            return false;
                                        } else {
                                            return true;
                                        }

                                    }

                                    function checkReNewpass() {
                                        var newpass1 = document.getElementById('newpass').value;
                                        var newpass2 = document.getElementById('renewpass').value;
                                        if (newpass1 !== newpass2) {
                                            return false;
                                        } else {
                                            return true;
                                        }
                                    }



        </script>
        <%
            String alertMess = (String) request.getAttribute("alertMess");
            if (alertMess != null && !alertMess.isEmpty()) {
        %>
        <script>
            alert("<%= alertMess%>");
        </script>
        <%
            }
        %>
    </body>
</html>
