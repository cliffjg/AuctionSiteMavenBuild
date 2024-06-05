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
    <title>AuctionUp Home</title>
    <link rel="icon" type="image/png" href="Images/auction.png">
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



<jsp:include page="header.jsp" />

<jsp:include page="tabBar.jsp" />




<% ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
    /* ArrayList<Users> auction = (ArrayList<Users>)session.getAttribute("allAuctions"); */

    NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();

    String carPrice = null;
%>



<div class="container" style="height: auto;">

    <!--//////////////////////////////////////////BEGINNING OF MY LISTINGS//////////////////////////////////////////////////////////////////////-->




    <form id="myForm" action = "UserPageServlet" method = "post">
        <input type="hidden" id="dataField" name="data">


        <div class="row" style="margin-top: 20px;height: 100%;">

            <%

                ArrayList<Auction> myAuction = new ArrayList<Auction>();
                /* myAuction = (ArrayList<Auction>) session.getAttribute("communityAuction"); */
                myAuction = (ArrayList<Auction>) session.getAttribute("allAuctions");


                int countBids = 0;

                for(int i = 0; i < myAuction.size(); i++) {
                    Auction auction = new Auction();
                    auction = myAuction.get(i);

            %>



            <div class="col-md-4" style="height: 100%; margin-top: 10px;cursor: pointer;"  onclick="submitForm(<%=auction.getAuctionId()%>)">
                <div style="width: 100%;height: 60%;">
                    <img style="width: 100%;height: 250px;" src="<%=auction.getImagePath()%>"
                         onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=auction.getImagePath()%>';"
                         onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">
<%--                    <img style="width: 100%;height: 250px;" src="<%=auction.getImagePath()%>" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>
<%--                     <img style="width: 100%;height: 250px;border-radius: 10px;" src="AWSDownloadServlet?key=<%=auction.getImagePath()%>" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>


                </div>
                <div style="width: 100%;height: 40%;padding-top: 10px;">
                    <h5 class="fw-normal">Car: <%=auction.getCarYear()%> <%=auction.getCarMake()%> <%=auction.getCarModel()%></h5>
                    <span>Color: <%=auction.getCarColor()%><br></span>

                    <%if(auction.getCurrentBid() != null){ %>
                    <% carPrice = currencyFormatter.format(Integer.parseInt(auction.getCurrentBid()));%>

                    <span>Current Bid:&nbsp;<span style="color: rgb(0, 128, 0);"><%=carPrice%></span></span>

                    <% }else{ %>

                    <%String number = auction.getStartingBid(); %>
                    <% carPrice = currencyFormatter.format(Integer.parseInt(auction.getStartingBid()));%>

                    <span>Current Bid:&nbsp;<span style="color: rgb(0, 128, 0);"><%=carPrice%></span></span>

                    <%}%>

                    <% session.setAttribute("userEmail", users.get(0).getUserEmail());%>



                    <span><br>Time Remaining:&nbsp;<span id="countdown<%=auction.getAuctionId()%>" style="color: rgb(255,0,0);"></span></span>

                    <%if(users.get(0).getUserEmail().equals(auction.bidderEmail)){ %>

                    <span><br><span style="color: rgb(0, 128, 0);"><strong>*Currently Winning!</strong></span></span>

                    <%}%>
                </div>
            </div>



            <script src="assets/JavaScript/userPageErrorTest.js"></script>


            <script >


                // Set the end time for the countdown
                var endTime<%=auction.getAuctionId()%> = new Date('<%=auction.getExpirationDate()%>').getTime();

                // Start the countdown
                startCountdown("<%=auction.getAuctionId()%>", endTime<%=auction.getAuctionId()%>);




            </script>




            <%
                }
            %>

            <%

                String whatTabPressed = (String)session.getAttribute("whatTabPressed");

                if(myAuction.size() == 0 && whatTabPressed != null && whatTabPressed.equals("myAuctions")){
            %>
            <div>
                You have no auctions! Click "<a href="newAuction.jsp">New Auction</a>" to add an Auction!
            </div>



            <%
            } else if(myAuction.size() == 0 && whatTabPressed != null && whatTabPressed.equals("myBids")){
                String communityAuctions = "communityAuctions";
            %>
            <div>
                You have no bids! Please place bid in "<a style="cursor:pointer; text-decoration: underline; color: rgb(49,108,244);" onclick="submitFormWhatTabPressed('<%=communityAuctions%>')">Community Auctions</a>"!
            </div>
            <%
                }
            %>

        </div>




    </form>




    <!--//////////////////////////////////////////END OF MY LISTINGS//////////////////////////////////////////////////////////////////////-->




</div>





<jsp:include page="footer.jsp" />


<script src="assets/JavaScript/userPageErrorTest.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>

</body>

</html>