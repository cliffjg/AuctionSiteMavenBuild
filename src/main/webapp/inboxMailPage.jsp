<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Message" %>
<%@ page import="userpackage.Model.Users" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>AuctionUp Inbox</title>
    <link rel="icon" type="image/png" href="Images/auction.png">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito&amp;display=swap">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/-Login-form-Page-BS4--Login-form-Page-BS4.css">
    <link rel="stylesheet" href="assets/css/Div-Overlay-Black.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
    <link rel="stylesheet" href="assets/css/Signup-page-with-overlay.css">

    <script src="assets/JavaScript/userPageErrorTest.js"></script>

</head>

<body style="background: rgb(225,225,225);">


<%ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users"); %>

<%ArrayList<Message> auctionMessage = (ArrayList<Message>)session.getAttribute("auctionMessage"); %>


<jsp:include page="header.jsp" />
<jsp:include page="tabBar.jsp" />



<div class="container-fluid">
    <div class="card shadow" style="border-radius: 0px;">



        <div class="card-body">

            <div class="row" >
                <div class="col-md-6 text-nowrap" >
                    <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable" >
                        <label class="form-label" >Show&nbsp;
                            <select class="d-inline-block form-select form-select-sm">
                                <option value="10" selected="">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>&nbsp;
                        </label>

                    </div>

                </div>


                <div class="col-md-6">

                    <div class="text-md-end dataTables_filter" id="dataTable_filter">
                        <label class="form-label">
                            <input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search">
                        </label>
                    </div>
                </div>


            </div>
            <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                <table class="table my-0" id="dataTable">
                    <thead>
                    <tr>
                        <th>Sender</th>
                        <th>Car</th>
                        <th>Message</th>
                        <th>Date/Time</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        for(int i = 0; i < auctionMessage.size(); i++){
                            Message m = new Message();
                            m = auctionMessage.get(i);


                    %>

                    <%

                        String userEmail = users.get(0).getUserEmail();
                        String destinationEmail = m.getUserEmail();
                        if (users.get(0).getUserEmail().equals(destinationEmail)){
                            destinationEmail = m.getDestinationEmail();
                        }
                    %>

                    <tr  style="cursor: pointer;" onmouseover="this.style.color='red'" onmouseout="this.style.color=''" onclick="submitFormForMessage('<%=m.getConversationID() %>','<%= m.getAuctionID() %>', '<%=userEmail %>', '<%=destinationEmail %>')">

                        <td>
                            <img class="rounded-circle me-2" width="30" height="30" src="<%=m.getProfilePicture()%>"
                                 onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=m.getProfilePicture()%>';"
                                 onerror="this.onerror=null;this.src='Images/Default.jpg';"
                            ><%=m.getUserEmail()%>

                        </td>

<%--                        <td><img class="rounded-circle me-2" width="30" height="30" src="<%=m.getProfilePicture()%>"><%=m.getUserEmail()%></td>--%>
                        <%-- <td><img class="rounded-circle me-2" width="30" height="30" src="AWSDownloadServlet?key=<%=m.getProfilePicture()%>"><%=m.getUserEmail()%></td> --%>

                        <td><%=m.getCar() %></td>

                        <%if(m.getSendMessage() != null){ %>
                        <td style="color: var(--bs-table-color);"><%=m.getSendMessage() %></td>
                        <%-- <%}else{ %>
                            <td style="color: var(--bs-table-color);"><%=m.getReceiveMessage() %></td> --%>
                        <%} %>
                        <td><%=m.getMessageDateTime() %></td>
                    </tr>


                    <%
                        }
                    %>


                    </tbody>
                    <tfoot>
                    <tr>
                        <td><strong>Sender</strong></td>
                        <th>Car</th>
                        <td><strong>Message</strong></td>
                        <td><strong>Date/Time</strong></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
            <div class="row">
                <div class="col-md-6 align-self-center">
                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p>
                </div>
                <div class="col-md-6">
                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                        <ul class="pagination">
                            <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">Â«</span></a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">Â»</span></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp" />

<script src="assets/JavaScript/userPageErrorTest.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<!--     <script src="assets/js/countDownTimer.js"></script>
    <script src="assets/js/newCountDownTimers.js"></script> -->
</body>

</html>