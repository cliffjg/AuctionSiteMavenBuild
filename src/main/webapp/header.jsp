<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Users" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<header>

    <%
        ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");

    %>

    <nav class="navbar navbar-expand-md bg-body py-3">
        <div class="container">

            <form id="backToUserPageServletForm" action = "BackToUserPageServlet" method = "post">
                <a class="navbar-brand d-flex align-items-center" onclick="document.getElementById('backToUserPageServletForm').submit();" style="cursor: pointer;">
        		<span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon">
        			<img style="height: 32px;width: 32px;background: var(--bs-body-bg);" src="assets/img/auction.png">
        		</span>
                    <span style="color: #404040;">AuctionUp</span>
                </a>

            </form>

            <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
                <span class="visually-hidden">Toggle navigation</span>
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item d-flex flex-row justify-content-center align-items-center" style="margin-right: 20px;color: #404040;">


                        <a class="nav-link" href="newAuction.jsp" style="margin-left: 0px;color: rgba(0,0,0,0.65);">
                            <img style="width: 10px;height: 10px;color: #404040;" src="assets/img/plus.png">
                            <span style="color: #404040;margin-left: 5px;">New Auction</span>
                        </a>
                    </li>
                    <li class="nav-item d-flex d-md-flex flex-row justify-content-center align-items-center justify-content-md-center align-items-md-center" style="margin-right: 20px;">


                        <!-- <a class="nav-link d-flex justify-content-center align-items-center" href="inboxMailPage.jsp" style="margin-left: 0px;color: #404040;">
                            <img style="width: 12px;height: 12px;margin-right: 5px;color: #404040;" src="assets/img/mail.png">
                            <span style="color: #404040;">Messages</span>
                            <div style="height: 20px;width: 0px;color: rgb(64, 64, 64);margin-left: 10px;border: 1px solid #404040 ;"></div>
                        </a> -->





                        <!-- <form id="inboxMailPageServletForm" action = "InboxMailPageServlet" method = "post"> -->
                        <form id="inboxMailPageServletForm" action = "InboxMailPageServlet" method = "post">

                            <div style="padding: 10px;">
                                <!-- <a class="nav-link d-flex justify-content-center align-items-center" href="inboxMailPage.jsp" style="margin-left: 0px;color: #404040;">
                                 <img style="width: 12px;height: 12px;margin-right: 5px;color: #404040;" src="assets/img/mail.png">
                                 <span style="color: #404040;">Messages</span>
                                     <div style="height: 20px;width: 0px;color: rgb(64, 64, 64);margin-left: 10px;border: 1px solid #404040 ;"></div>
                                 </a>
                         -->

                                <a class="nav-link d-flex justify-content-center align-items-center" onclick="document.getElementById('inboxMailPageServletForm').submit();" style="margin-left: 0px;color: #404040;cursor: pointer;">
                                    <img style="width: 12px;height: 12px;margin-right: 5px;color: #404040;" src="assets/img/mail.png">
                                    <span style="color: #404040;">Messages</span>
                                    <div style="height: 20px;width: 0px;color: rgb(64, 64, 64);margin-left: 10px;border: 1px solid #404040 ;"></div>
                                </a>

                            </div>



                        </form>





                    </li>
                    <li class="nav-item d-flex d-md-flex flex-row justify-content-center align-items-center justify-content-md-center align-items-md-center">
                        <div class="nav-item dropdown">
                            <a aria-expanded="false" data-bs-toggle="dropdown" href="#" style="text-decoration: none;">
                                <span style="margin-right: 5px;color: #404040;"><%=users.get(0).getFirstName()%></span>
                                <span style="margin-right: 10px;color: #404040;"><%=users.get(0).getLastName()%></span>


                                <img class="rounded-circle border border-1 border-secondary shadow-lg focus-ring" style="width: 32px;height: 32px;"
                                     src="<%=users.get(0).getProfilePicture()%>"
                                     onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=users.get(0).getProfilePicture()%>';"
                                     onerror="this.onerror=null;this.src='Images/Default.jpg';">

<%--                                <img class="rounded-circle border border-1 border-secondary shadow-lg focus-ring" style="width: 32px;height: 32px;" src="<%=users.get(0).getProfilePicture()%>" />--%>
                                <%-- <img class="rounded-circle border border-1 border-secondary shadow-lg focus-ring" style="width: 32px;height: 32px;" src="AWSDownloadServlet?key=<%=users.get(0).getProfilePicture()%>" /> --%>

                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="profilePage.jsp" style="padding-top: 4px;padding-bottom: 4px;padding-right: 16px;padding-left: 16px;color: var(--bs-navbar-active-color);text-decoration-line: none;">
                                    <svg class="bi bi-person fa-sm fa-fw me-2 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z"></path>
                                    </svg>Profile</a>
                                <a class="dropdown-item" href="#">
                                    <svg class="bi bi-gear fa-sm fa-fw me-2 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16">
                                        <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"></path>
                                        <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"></path>
                                    </svg>Settings</a>


                                <!-- <a class="dropdown-item" href="#"><svg class="bi bi-chat fa-sm fa-fw me-2 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894m-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"></path>
                                            </svg>Message Admin</a> -->

                                <form id="userMessageServletForm" action = "UserMessageServlet" method = "post">

                                    <a class="dropdown-item" onclick="document.getElementById('userMessageServletForm').submit();" style="cursor: pointer;" ><svg class="bi bi-chat fa-sm fa-fw me-2 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16">
                                        <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894m-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"></path>
                                    </svg>Message Admin</a>
                                </form>




                                <a class="dropdown-item" href="login.jsp"><svg class="bi bi-box-arrow-right fa-sm fa-fw me-2 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"></path>
                                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"></path>
                                </svg>Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>



</header>

