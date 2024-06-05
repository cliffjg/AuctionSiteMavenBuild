<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Message" %>
<%@ page import="userpackage.Model.Users" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en" style="overflow-y: visible;">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>NewAuction</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito&amp;display=swap">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/-Login-form-Page-BS4--Login-form-Page-BS4.css">
    <link rel="stylesheet" href="assets/css/Div-Overlay-Black.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
    <link rel="stylesheet" href="assets/css/Signup-page-with-overlay.css">
</head>

<body>


<%ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users"); %>

<%ArrayList<Message> auctionMessage = (ArrayList<Message>)session.getAttribute("auctionMessage"); %>

<%String destinationEmail = (String)session.getAttribute("destinationEmail");%>


<jsp:include page="header.jsp" />

<jsp:include page="tabBar.jsp" />








<div class="d-flex d-sm-flex d-md-flex d-lg-flex flex-column flex-sm-column align-items-sm-center flex-md-column align-items-md-center flex-lg-row justify-content-lg-center align-items-lg-start backPanel" style="width: 100%;border-color: rgb(239,239,239);background: #efefef;overflow: hidden;">



    <div style="width: 600px;height: 610px;margin-left: 5px;margin-top: 10px;background: #ffffff;border: 0.4px solid rgb(217,217,217);box-shadow: 0px 0px 7px rgb(111,111,111);border-radius: 3px;min-width: 360px;">




        <div class="d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-lg-start align-items-lg-start" style="width: 100%;height: 75px;padding-right: 20px;padding-left: 20px;padding-top: 10px;padding-bottom: 10px;border-bottom: 1px solid rgb(221,221,221) ;">


            <!-- Message Chat Heading  -->
            <div class="d-lg-flex justify-content-lg-start" style="height: 100%;width: 60px;">
                <img class="rounded-circle"  style="height: 100%;width: 100%;" src="<%=auctionMessage.get(0).getProfilePicture()%>"
                     onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=auctionMessage.get(0).getProfilePicture()%>';"
                     onerror="this.onerror=null;this.src='Images/Default.jpg';">
<%--                <img class="rounded-circle"  style="height: 100%;width: 100%;" src="<%=auctionMessage.get(0).getProfilePicture()%>">--%>
            </div>
            <div style="width: 100%;height: 100%;margin-left: 10px;">
                <div class="d-flex d-lg-flex flex-row" style="width: 100%;height: 33.333%;">
                    <div class="d-lg-flex justify-content-lg-start" style="width: 50%;padding-left: 10px;">
                        <label class="form-label" style="height: 100%;color: rgb(79,79,79);font-weight: bold;width: 100%;"><%=destinationEmail%></label>
                    </div>
                    <div class="d-md-flex d-lg-flex justify-content-md-end justify-content-lg-end" style="width: 50%;height: 100%;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-three-dots-vertical" style="width: 20px;height: 30px;">
                        <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"></path>
                    </svg>
                    </div>
                </div>
                <div class="d-flex d-lg-flex flex-row" style="width: 100%;height: 33.333%;">
                    <div class="d-lg-flex justify-content-lg-start" style="width: 100%;padding-left: 10px;">
                        <label class="form-label" style="height: 100%;width: 100%;font-size: 14px;color: rgb(118,118,118);"><%=auctionMessage.get(0).getCar()%></label>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex flex-column justify-content-lg-start align-items-lg-start" style="width: 100%;height: 460px;padding-right: 20px;padding-left: 20px;padding-top: 10px;padding-bottom: 10px;overflow: scroll;">
            <%

                System.out.println("AuctionMessage Size: "+auctionMessage.size());
                for(int i = 0; i < auctionMessage.size(); i++) {
                    Message m = new Message();
                    m = auctionMessage.get(i);


            %>






            <%
                if(m.getSendMessage() != null && m.getDestinationEmail().equals(destinationEmail)){
            %>



            <!-- Current User  -->
            <div class="d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-lg-start align-items-lg-start" style="width: 100%;height: 75px;padding-right: 20px;padding-left: 20px;padding-top: 10px;padding-bottom: 10px;">
                <div class="d-lg-flex justify-content-lg-end" style="width: 100%;height: 100%;margin-left: 10px;">
                    <div class="d-flex d-lg-flex flex-column justify-content-lg-start align-items-lg-start messageBlueBubble" style="padding-left: 10px;height: 100%;border-radius: 10px;border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-right-radius: 0px;border-bottom-left-radius: 10px;background: #46b3fe;border-style: solid;border-color: #46b3fe;overflow: visible;overflow-y: auto;">
                        <label class="form-label d-lg-flex align-items-lg-center" style="height: 100%;color: rgb(255,255,255);width: 100%;margin-bottom: 0px;"><%=m.getSendMessage()%></label>
                        <label class="form-label d-flex d-lg-flex justify-content-end justify-content-lg-end align-items-lg-center" style="height: 100%;color: rgb(255,255,255);width: 100%;margin-bottom: 0px;padding-right: 5px;font-size: 12px;"><%=m.getMessageDateTime() %></label>
                    </div>
                </div>
            </div>


            <%
            } 	else{


            %>

            <!-- Other User  -->

            <div class="d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-lg-start align-items-lg-start" style="width: 100%;height: 75px;padding-right: 20px;padding-left: 20px;padding-top: 10px;padding-bottom: 10px;">
                <div style="width: 100%;height: 100%;margin-left: 10px;">
                    <div class="d-flex d-lg-flex flex-column align-items-lg-start messageGrayBubble" style="padding-left: 10px;height: 100%;border-radius: 10px;border-top-left-radius: 0px;border-top-right-radius: 10px;border-bottom-right-radius: 10px;border-bottom-left-radius: 10px;background: #f1f1f1;border: 0.5px solid #cbcbcb ;overflow: visible;overflow-y: auto;">
                        <label class="form-label d-lg-flex justify-content-lg-start align-items-lg-center" style="height: 100%;color: rgb(142,142,142);width: 100%;margin-bottom: 0px;"><%=m.getSendMessage()%></label>
                        <label class="form-label d-flex d-lg-flex justify-content-end justify-content-lg-end align-items-lg-center" style="height: 100%;color: rgb(142,142,142);width: 100%;margin-bottom: 0px;padding-right: 5px;font-size: 12px;"><%=m.getMessageDateTime() %></label>
                    </div>
                </div>
            </div>




            <%} %>

            <%

                }

            %>

        </div>

        <form action="ReplySellerServlet" method="post">
            <!-- Message Input -->
            <div class="d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-lg-start align-items-lg-center justify-content-xl-center align-items-xl-center phoneSize" style="height: 75px;padding-right: 20px;padding-left: 20px;padding-top: 10px;padding-bottom: 10px;min-width: 360px;border-top: 1px solid rgb(221,221,221);border-bottom-style: solid;border-bottom-color: rgb(221,221,221);position: static;display: flex;">
                <div class="d-lg-flex justify-content-lg-start align-items-lg-center" style="height: 100%;width: 80%;">
                    <input type="text" name="message" style="width: 100%;height: 80%;border-style: none;" placeholder="Enter Message!">
                </div>
                <div class="d-lg-flex justify-content-lg-start" style="height: 80%;width: 20%;margin-left: 5px;">
                    <button class="btn btn-primary" type="submit" style="width: 100%;height: 100%;background: linear-gradient(-91deg, rgb(69,166,248), #00e0ff 100%), rgb(69,166,248);">Send</button>
                </div>
            </div>
        </form>

    </div>
</div>


<jsp:include page="footer.jsp" />


<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>

</body>

</html>