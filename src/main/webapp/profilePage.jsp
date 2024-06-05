<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Users" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>AuctionUp Profile Page</title>
    <link rel="icon" type="image/png" href="Images/auction.png">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/-Login-form-Page-BS4--Login-form-Page-BS4.css">
    <link rel="stylesheet" href="assets/css/Div-Overlay-Black.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
    <link rel="stylesheet" href="assets/css/Signup-page-with-overlay.css">
</head>

<body>

<%ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users"); %>


<jsp:include page="header.jsp" />



<div class="d-inline-flex flex-column align-content-start flex-wrap flex-sm-shrink-1" style="width: 100%;height: 30px;background: rgb(44,47,50);overflow: scroll;overflow-y: hidden;">
    <label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 50px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;margin-top: 5px;padding-right: 10px;padding-left: 10px;height: 100%;">
        <span style="background-color: gray; padding: 40px;">Profile</span>
    </label>
    <label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 20px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;margin-top: 5px;padding-right: 10px;padding-left: 10px;height: 100%;">
        <span style="background-color: rgb(43, 47, 50);">Settings</span>
    </label>

</div>

<div class="container-fluid" style="background: #efefef;">

    <div class="row mb-3" style="padding-top: 10px;">
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-body text-center shadow">


                    <img class="rounded-circle img-fluid border border-1 border-secondary shadow-lg focus-ring mb-3 mt-4"  width="160" height="160"
                         src="<%=users.get(0).getProfilePicture()%>"
                         onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=users.get(0).getProfilePicture()%>';"
                         onerror="this.onerror=null;this.src='Images/Default.jpg';">

<%--                    <img class="rounded-circle img-fluid border border-1 border-secondary shadow-lg focus-ring mb-3 mt-4"  width="160" height="160" src="<%=users.get(0).getProfilePicture()%>">--%>
                    <%-- <img class="rounded-circle img-fluid border border-1 border-secondary shadow-lg focus-ring mb-3 mt-4"  width="160" height="160" src="AWSDownloadServlet?key=<%=users.get(0).getProfilePicture()%>"> --%>

                    <div class="mb-3">
                        <button class="btn btn-info mt-2" type="button" style="color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Change Photo</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8">

            <div class="row">
                <div class="col" >
                    <div class="card shadow mb-3" >
                        <div class="card-header py-3"  style="background: linear-gradient(64deg, rgb(92,197,237) 0%, rgb(93,170,248) 100%);">
                            <p class=" m-0 fw-bold" style="color: #ffffff;" >Change Password</p>
                        </div>
                        <div class="card-body">
                            <form action="ProfilePageServlet" method="post">
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label class="form-label text-secondary" for="password" ><strong>Password</strong></label>
                                            <input  type="text" id="password" name="password" required placeholder="<%=users.get(0).getPassword()%>" disabled>
                                        </div>
                                        <%-- <div><label><%=users.get(0).getPassword()%></label></div> --%>
                                    </div>
                                    <div class="col">
                                        <div class="mb-3">
                                            <label class="form-label text-secondary" for="confirmPassword"><strong>Confirm Password</strong></label>
                                            <input  type="text" id="confirmPassword" name="confirmPassword" required placeholder="<%=users.get(0).getPassword()%>" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <button class="btn btn-info mt-2" type="button" id="editButtonPassword" onclick="editPressedPass()" style="visibility: visible; color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Edit&nbsp;Password</button>
                                    <button class="btn btn-info mt-2" type="button" id="cancelButtonPassword" onclick="cancelPressedPass()" style="visibility: hidden; color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Cancel&nbsp;Password</button>
                                    <button class="btn btn-info mt-2" type="submit" id="saveButtonPassword" style="visibility: hidden; background-color: rgb(227, 16, 16);color: white;border: rgb(227, 16, 16);">Save&nbsp;Password</button>

                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card shadow">
                        <div class="card-header py-3" style="background: linear-gradient(64deg, rgb(92,197,237) 0%, rgb(93,170,248) 100%);">
                            <p class="m-0 fw-bold" style="color: #ffffff;">Contact Settings</p>
                        </div>
                        <div class="card-body">


                            <form action="ProfilePageServlet" method="post">
                                <div class="row">
                                    <div class="col">
                                        <div class="d-flex d-lg-flex flex-column justify-content-lg-start align-items-lg-start mb-3">
                                            <label class="form-label text-secondary" for="firstName"><strong>First Name</strong></label>
                                            <input type="text" id="firstName" name="firstName" required placeholder="<%=users.get(0).getFirstName()%>" disabled ></div>
                                    </div>
                                    <div class="col">
                                        <div class="d-flex flex-column mb-3" style="width: 100%;"><label class="form-label text-secondary" for="lastName"><strong>Last Name</strong></label>
                                            <input type="text" id="lastName" name="lastName" required placeholder="<%=users.get(0).getLastName()%>" disabled ></div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label text-secondary" for="address"><strong>Address</strong></label>
                                    <input  type="text" id="address" name="address" required placeholder="<%=users.get(0).getAddress()%>" disabled >
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label class="form-label text-secondary" for="city"><strong>City</strong></label>
                                            <input  type="text" id="city" name="city" required placeholder="<%=users.get(0).getCity()%>" disabled >
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="mb-3">
                                            <label class="form-label text-secondary" for="state"><strong>State</strong></label>
                                            <input  type="text" id="state" name="state" required placeholder="<%=users.get(0).getState()%>" disabled >
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="mb-3">
                                            <label class="form-label text-secondary" for="zipCode"><strong>ZipCode</strong></label>
                                            <input  type="text" id="zipCode" name="zipCode" required placeholder="<%=users.get(0).getZipCode()%>" disabled >
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="mb-3">
                                            <label class="form-label text-secondary" for="phoneNumber"><strong>Phone Number</strong></label>
                                            <input  type="text" id="phoneNumber" name="phoneNumber" required placeholder="<%=users.get(0).getPhoneNumber()%>" disabled >
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <button class="btn btn-info mt-2" type="button" id="editButton" onclick="editPressed()" style="visibility: visible; color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Edit&nbsp;Settings</button>
                                    <button class="btn btn-info mt-2" type="button" id="cancelButton" onclick="cancelPressed()" style="visibility: hidden; color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Cancel&nbsp;Settings</button>
                                    <button class="btn btn-info mt-2" type="submit" id="saveButton" style="visibility: hidden; background-color: rgb(227, 16, 16);color: white;border: rgb(227, 16, 16);">Save&nbsp;Settings</button>

                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>

    input{

        width: 100%;
        border-radius: 6px;
        height: 38px;
        border: 1px solid rgb(223,226,230);
        padding-left: 10px;

    }

    input::placeholder {
        color: rgb(214, 212, 212);
    }

</style>

<jsp:include page="footer.jsp" />


<script src="assets/JavaScript/profilePage.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
</body>

</html>