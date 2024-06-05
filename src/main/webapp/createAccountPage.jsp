<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>AuctionUp Create Account</title>
    <link rel="icon" type="image/png" href="Images/auction.png">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito&amp;display=swap">
    <link rel="stylesheet" href="assets/css/-Login-form-Page-BS4--Login-form-Page-BS4.css">
    <link rel="stylesheet" href="assets/css/Div-Overlay-Black.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
    <link rel="stylesheet" href="assets/css/Signup-page-with-overlay.css">
</head>

<body>
<div class="container-fluid">
    <div class="row mh-100vh">
        <div class="col-10 col-sm-8 col-md-6 col-lg-6 offset-1 offset-sm-2 offset-md-3 offset-lg-0 align-self-center d-lg-flex align-items-lg-center align-self-lg-stretch bg-white p-5 rounded rounded-lg-0 my-5 my-lg-0" id="login-block">
            <div class="m-auto w-lg-75 w-xl-50">
                <h2 style="color: var(--bs-body-color);font-family: Abel, sans-serif;font-size: 30px;"><img width="100" height="80" style="width: 32px;height: 32px;" src="Images/auction.png">&nbsp;AuctionUp</h2>


                <form action = "CreateAccountServlet" method = "post">

                    <div class="form-group mb-3"><label class="form-label text-secondary">Enter Email:</label><input name="userEmail" class="form-control" type="text" required=""  ></div>
                    <div class="form-group mb-3"><label class="form-label text-secondary">Enter Password:</label><input name="password" class="form-control" type="password" required=""></div>
                    <div class="form-group mb-3"><label class="form-label text-secondary">Confirm Password:</label><input name="confirmPassword" class="form-control" type="password" required=""></div>

                    <div class="form-group mb-3"><label class="form-label text-secondary">Enter First Name:</label><input name="firstName" class="form-control" type="text" required="" ></div>
                    <div class="form-group mb-3"><label class="form-label text-secondary">Enter Last Name:</label><input name="lastName" class="form-control" type="text" required=""></div>


                    <%

                        String check = (String)request.getAttribute("success");

                        if(check != null && check.equals("error")){

                    %>
                    <div style="width: 100%;height: 24px;">
                        <label class="form-label" style="color: rgb(235,14,0); visibility: visible;width: 100%;">
                            <svg class="bi bi-x" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" style="color: rgb(235,14,0);">
                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"></path>
                            </svg>User email entered is unavailable!
                        </label>
                    </div>



                    <%
                    } else if (check != null && check.equals("success")){

                    %>

                    <div style="width: 100%;height: 24px;">
                        <label class="form-label" style="color: rgb(28,200,138); visibility: visible;">
                            <svg class="bi bi-check-lg fa-sm fa-fw me-2 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" style="color: rgb(28,200,138);">
                                <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022"></path>
                            </svg>User email successfully entered!
                        </label>
                    </div>


                    <%
                    } else if (check != null && check.equals("passwordDoesntMatch")){


                    %>

                    <div style="width: 100%;height: 24px;">
                        <label class="form-label" style="color: rgb(235,14,0); visibility: visible;width: 100%;">
                            <svg class="bi bi-x" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" style="color: rgb(235,14,0);">
                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"></path>
                            </svg>Password entered doesn't match!
                        </label>
                    </div>


                    <%
                        }

                    %>


                    <button class="btn btn-info mt-2" role="button" style="color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Create Account</button>
                </form>


                <p class="mt-3 mb-0"><a class="text-info small" href="#">Forgot your email or password?</a></p>
                <div>
                    <p class="mt-3 mb-0"><span class="text-info small">Back to <a class="text-info small" href="login.jsp">login</a> !</span></p>
                </div>
            </div>
        </div>
        <div class="col-lg-6 d-flex align-items-end" id="bg-block" style="background: url(&quot;Images/LoginCar.jpg&quot;) top / cover repeat-y;">
            <p class="ms-auto small text-dark mb-2"></p>
        </div>
    </div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>

</body>

</html>