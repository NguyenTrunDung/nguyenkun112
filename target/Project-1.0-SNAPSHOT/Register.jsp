<%-- 
    Document   : Register
    Created on : Feb 22, 2024, 9:06:32 PM
    Author     : Acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="index.css"/>
        <style>

            form{
                /*margin-left: 550px;*/
                /*margin-top: 100px;*/
                margin: auto;
            }
            .submit_button{
                /*margin-left: 230px;*/
                /*width: 600px;*/
                /*height: 40px;*/
                width: 100%;
            }




        </style>
    </head>

    <body>
        <!--Navbar-->
         <jsp:include page="Nav.jsp" />
        <form method="post" action="RegisterController" class="register col-6">
            <h1 class="m-3 text-center">Thông tin cá nhân</h1>
            <div class="m-3">
                <label class="form-label fw-bold">Email:</label>
                <input id="email1" type="text" name="email" class="form-control" placeholder="Enter email">
                <p id="emailerror1"></p>
            </div>
            <div class="m-3">
                <label class="form-label fw-bold">Username:</label>
                <input id="username" type="text" name="username" class="form-control" placeholder="Enter username">
                <p id="usernameerror"></p>
            </div>
            <div class="m-3">
                <label class="form-label fw-bold">Password:</label>
                <input id="password1" type="password" name="password" class="form-control"placeholder="Enter password">
                <p id="passerror1"></p>
            </div>
            <div class="m-3">
                <label class="form-label fw-bold">Confirm password:</label>
                <input id="repassword" type="password" name="repassword" class="form-control"
                       placeholder="Enter password again">
                <p id="repasserror"></p>
            </div>
            <div class="m-3">
                <label class="form-label fw-bold">Day of birth:</label>
                <input id="birthday" type="date" name="birthday" class="form-control"
                       placeholder="Enter your email">
                <p id="birtherror"></p>
            </div>
            <div class="m-3">
                <label class="form-label fw-bold">Phone number:</label>
                <input id="phone" type="text" name="phone" class="form-control" placeholder="Enter phone number">
                <p id="phoneerror"></p>
            </div>
            <div class="m-3">
                <label class="form-label fw-bold">Address:</label>
                <textarea id="address" name="address" cols="30" rows="5" class="form-control"
                          placeholder="Enter address"></textarea>
                <p id="addresserror"></p>
            </div>
            <div class="text-center m-2">
                <a class="link-dark" id="LoginLink" href="/LoginController" onclick="checkReset()" style="text-decoration: underline" >Already have an account -
                    Login</a> <br>
            </div>


            <div class="m-3">
                <button type="submit" name="btnRegis" value="Register" onclick="checkRegis()"
                        class="btn btn-dark fw-bold rounded-5">Register</button>

            </div>
        </form>
        <div id="Shoptext" class="bg-dark" >
            <p class="Shoptext1"> Giới thiệu về SpringShop</p>
            <p class="Shoptext2">SPRINGSHOP- Shop quần áo thời trang được thành lập vào năm 2024</p>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <jsp:include page="Footer.jsp" />
       <script>
                            

                            // JavaScript function to show the Registration form
                            function showRegisterForm() {
                                document.getElementById("loginform").style.display = "none";
                                document.getElementById("registerform").style.display = "block";
                            }

                           

                            // Add event listeners to the buttons and link
                            
                            document.querySelector("#RegisterButton").addEventListener("click", showRegisterForm);
                            
        </script>
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


            function checkEmailRegister() {
                var email1 = document.getElementById('email1').value;
                if (email1 == "") {
//        document.getElementById('emailerror1').innerHTML = "Email cannot be empty";
//        document.getElementById('emailerror1').style.color = "red";
                    return false;

                } else {
                    if (!emailValidation1.test(email1) && !emailValidation2.test(email1)) {
//            document.getElementById('emailerror1').innerHTML = "Email is invalid";
//            document.getElementById('emailerror1').style.color = "red";
                        return false;
                    } else {
//            document.getElementById('emailerror1').innerHTML = "";
                        return true;
                    }
                }
            }



            function checkUsername() {
                var name = document.getElementById('username').value.trim();

                if (name == "") {
//        document.getElementById('usernameerror').innerHTML = "Username cannot be empty";
//        document.getElementById('usernameerror').style.color = "red";
                    return false;
                } else {
//        document.getElementById('usernameerror').innerHTML = "";
                    return true;
                }
            }




            function checkPasswordRegister() {
                var password = document.getElementById('password1').value;
                var repassword = document.getElementById('repassword').value;

                if (password.length < 6 || password.length > 20 || password == "") {
//        document.getElementById('passerror1').innerHTML = "Password must be between 6 and 20 characters";
//        document.getElementById('passerror1').style.color = "red";
                    return false;
                } else {
//        document.getElementById('passerror1').innerHTML = "";
                    return true;
                }
            }
            function checkRePassRegis() {
                var password = document.getElementById('password1').value;
                var repassword = document.getElementById('repassword').value;
                if (repassword != password) {
//        document.getElementById('repasserror').innerHTML = "Password does not match";
//        document.getElementById('repasserror').style.color = "red";
                    return false;
                } else {
//        document.getElementById('repasserror').innerHTML = "";
                    return true;
                }

            }

            function checkBirthday() {
                var birthday = document.getElementById('birthday').value;

                if (birthday === "") {
//        document.getElementById('birtherror').innerHTML = "Birthday cannot be empty";
//        document.getElementById('birtherror').style.color = "red";
                    return false;

                } else {
//        document.getElementById('birtherror').innerHTML = "";
                    return true;
                }
            }



            function checkPhone() {
                var phone = document.getElementById('phone').value;

                if (!numberValidation.test(phone)) {
//        document.getElementById('phoneerror').innerHTML = "Phone is invalid";
//        document.getElementById('phoneerror').style.color = "red";
                    return false;
                } else {
//        document.getElementById('phoneerror').innerHTML = "";
                    return true;
                }

            }



            function checkAddress() {
                var address = document.getElementById('address').value;
                var address = address.replace(/\s/g, '');
                if (address === "") {
//        document.getElementById('addresserror').innerHTML = " You have to provide your address";
//        document.getElementById('addresserror').style.color = "red";
                    return false;
                } else {
//        document.getElementById('addresserror').innerHTML = "";
                    return true;
                }
            }



            //validate login form
            function checkLogin() {
                let emailerror = document.getElementById('emailerror');
                let passerror = document.getElementById('passerror');
                let check = true;
                if (checkEmailLogin() === false) {
                    check = false;
                    emailerror.innerHTML = "Email is invalid";
                    emailerror.style.color = "red";
                } else {
                    emailerror.innerHTML = "";
                }

                if (checkPasswordLogin() === false) {
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

            //validate register form
            function checkRegis() {
                let emailerror = document.getElementById('emailerror1');
                let passerror = document.getElementById('passerror1');
                let nameerror = document.getElementById('usernameerror');
                let repasserror = document.getElementById('repasserror');
                let birtherror = document.getElementById('birtherror');
                let phoneerror = document.getElementById('phoneerror');
                let addresserror = document.getElementById('addresserror');

                let check = true;

                if (!checkEmailRegister()) {
                    check = false;
                    emailerror.innerHTML = "Email is invalid";
                    emailerror.style.color = "red";
                } else {
                    emailerror.innerHTML = "";
                }

                if (!checkUsername()) {
                    check = false;
                    nameerror.innerHTML = "Username cannot be empty";
                    nameerror.style.color = "red";
                } else {
                    nameerror.innerHTML = "";
                }

                if (!checkPasswordRegister()) {
                    check = false;
                    passerror.innerHTML = "Password must be between 6 and 20 characters";
                    passerror.style.color = "red";
                } else {
                    passerror.innerHTML = "";
                }
                if (!checkRePassRegis()) {
                    check = false;
                    repasserror.innerHTML = "Password does not match";
                    repasserror.style.color = "red";
                } else {
                    repasserror.innerHTML = "";
                }
                if (!checkBirthday()) {
                    check = false;
                    birtherror.innerHTML = "Birthday cannot be empty";
                    birtherror.style.color = "red";
                } else {
                    birtherror.innerHTML = "";
                }
                if (!checkPhone()) {
                    check = false;
                    phoneerror.innerHTML = "Phone is invalid";
                    phoneerror.style.color = "red";
                } else {
                    phoneerror.innerHTML = "";
                }
                if (!checkAddress()) {
                    check = false;
                    addresserror.innerHTML = "You have to provide your address";
                    addresserror.style.color = "red";
                } else {
                    addresserror.innerHTML = "";
                }

                if (!check) {

                    event.preventDefault();

                } else {
                    window.location.href = "/RoleController/Customer";
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
            String alertMess = (String) request.getAttribute("ErrorEmail");
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