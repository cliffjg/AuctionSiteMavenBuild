<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Users" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>


<!DOCTYPE html>
<html >
<head>




    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>AuctionUp Product Page</title>
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
<body >

<!-- style="flex-direction: column;" -->
<!-- display: flex; direction: column; align: center; -->

<%ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");

    String auctionID = (String)session.getAttribute("auctionID");
    String auctionIDFromData = request.getParameter("auctionID");

    ArrayList<Auction> communityAuction = (ArrayList<Auction>) session.getAttribute("communityAuction");

    Auction auction = new Auction();

    auction = (Auction) session.getAttribute("auction");

    session.setAttribute("auction", auction);

    String fullName = (String)session.getAttribute("fullName");
    String sellerEmail = (String)session.getAttribute("sellerEmail");
    String sellerProfilePicture = (String)session.getAttribute("sellerProfilePicture");
    String pickUpLocation = (String)session.getAttribute("pickUpLocation");

    NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();

    String carPrice = null;

    /* DateFormatter date = new DateFormatter(); */

    // Define input and output date formats
    DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MMMM dd, yyyy ' @ ' HHmm");

    // Parse the input date string
    LocalDateTime dateTime = LocalDateTime.parse(auction.getExpirationDate(), inputFormatter);

    // Format the parsed date
    String formattedDate = dateTime.format(outputFormatter);

    // Print the formatted date
    System.out.println(formattedDate);

    System.out.println("Date: " + auction.getExpirationDate());

		/*
		Auction auction = new Auction();

	 	auction = (Auction) session.getAttribute("auction");
	 */
%>


<jsp:include page="header.jsp" />
<jsp:include page="tabBar.jsp" />





<div class="container" style="margin-top: 0px;background: var(--bs-body-bg);border-radius: 0px;border-top-left-radius: 0px;border-top-right-radius: 0px;width: 100%;max-height: 1400px;height: 1100px;">
    <div class="row justify-content-sm-center justify-content-xl-center justify-content-xxl-center">
        <div class="col-md-6 col-lg-6" style="height: 100%;width: 610px;margin-top: 0px;">

            <form id="backToUserPageServletForm" action="BackToUserPageServlet" method="post">
                <div class="d-inline-flex flex-column justify-content-center align-content-start flex-wrap flex-sm-shrink-1" style="width: 100%;height: 20px;background: rgb(255,255,255);overflow: scroll;overflow-y: hidden;margin-left: 0px;">

                    <a class="form-label" style="margin-right: 2px;font-size: 14px; text-decoration: none; color: gray; cursor: pointer;" onclick="document.getElementById('backToUserPageServletForm').submit();">Home</a>

                    <!-- <a class="form-label" style="margin-right: 2px;font-size: 14px; text-decoration: none; color: gray;" href="userPage.jsp">Home</a> -->
                    <label class="form-label" style="margin-right: 2px;--bs-primary: #05d3ef;--bs-primary-rgb: 5,211,239;color: var(--bs-primary);">&gt;</label>
                    <label class="form-label d-lg-flex" style="font-size: 14px;color: gray;">Product Page</label>


                </div>
            </form>

            <div style="height: 100%;width: 100%;">
                <img style="width: 100%;height: 100%;border-radius: 8px;" src="<%=auction.getImagePath()%>"
                     onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=auction.getImagePath()%>';"
                     onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">
<%--                <img src="<%=auction.getImagePath()%>" style="width: 100%;height: 100%;border-radius: 8px;" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>
<%--                 <img src="AWSDownloadServlet?key=<%=auction.getImagePath()%>" style="width: 100%;height: 100%;border-radius: 8px;" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>

            </div>
            <div class="d-flex d-lg-flex flex-row justify-content-lg-start" style="height: 60px;margin-top: 10px;">


                <img style="height: 100%;width: 100px;border-radius: 8px;margin-right: 10px;" src="<%=auction.getImagePath()%>"
                     onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=auction.getImagePath()%>';"
                     onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">
                <img style="height: 100%;width: 100px;border-radius: 8px;margin-right: 10px;opacity: 0.40;" src="<%=auction.getImagePath()%>"
                     onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=auction.getImagePath()%>';"
                     onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">
                <img style="height: 100%;width: 100px;border-radius: 8px;opacity: 0.40;" src="<%=auction.getImagePath()%>"
                     onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=auction.getImagePath()%>';"
                     onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">


            <%--                <img style="height: 100%;width: 100px;border-radius: 8px;margin-right: 10px;" src="<%=auction.getImagePath()%>" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>
<%--                <img style="height: 100%;width: 100px;border-radius: 8px;margin-right: 10px;opacity: 0.40;" src="<%=auction.getImagePath()%>" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>
<%--                <img style="height: 100%;width: 100px;border-radius: 8px;opacity: 0.40;" src="<%=auction.getImagePath()%>" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>

<%--                <img style="height: 100%;width: 100px;border-radius: 8px;margin-right: 10px;" src="AWSDownloadServlet?key=<%=auction.getImagePath()%>" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>
<%--                <img style="height: 100%;width: 100px;border-radius: 8px;margin-right: 10px;opacity: 0.40;" src="AWSDownloadServlet?key=<%=auction.getImagePath()%>" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>
<%--                <img style="height: 100%;width: 100px;border-radius: 8px;opacity: 0.40;" src="AWSDownloadServlet?key=<%=auction.getImagePath()%>" onerror="this.onerror=null;this.src='Images/AwaitingPhoto.jpeg';">--%>

            </div>
        </div>
        <div class="col-md-6" style="width: 100%;min-width: 350px;max-width: 350px;margin-top: 0px;">
            <div class="d-inline-flex flex-column justify-content-center align-content-start flex-wrap flex-sm-shrink-1" style="width: 100%;height: 10px;background: rgb(255,255,255);overflow: scroll;overflow-y: hidden;margin-left: 0px;">
                <label class="form-label" style="margin-right: 2px;font-size: 14px;"></label>
                <label class="form-label" style="margin-right: 2px;"></label>
                <label class="form-label d-lg-flex" style="font-size: 14px;"></label>
            </div>
            <div style="height: 30px;">
                <label class="form-label" style="width: 100%;height: 100%;--bs-secondary: #6c757d;--bs-secondary-rgb: 108,117,125;color: #6c757d;font-weight: bold;font-size: 20px;">Car: <%=auction.getCarYear()%> <%=auction.getCarMake()%> <%=auction.getCarModel()%> </label>
            </div>
            <div style="height: 25px;">
                <label class="form-label" style="width: 100%;height: 100%;color: var(--bs-secondary);font-size: 15px;font-weight: bold;">Color: <%=auction.getCarColor()%></label>
            </div>
            <div style="width: 100%;height: 60px;margin-top: 10px;">
                <div class="d-flex d-lg-flex flex-row justify-content-center align-items-center justify-content-lg-center align-items-lg-center justify-content-xl-center align-items-xl-end" style="text-align: center;">
                    <label class="form-label" style="width: 50%;height: 100%;color: var(--bs-secondary);font-weight: bold;text-align: left;">Current Bid:</label>

                    <!--  /////////////////////////////////////////////////////////////////////// -->

                    <%if(auction.getCurrentBid() != null){ %>

                    <% carPrice = currencyFormatter.format(Integer.parseInt(auction.getCurrentBid()));%>
                    <%-- <div class="text-block-23"><%=carPrice%></div> --%>
                    <label class="form-label" style="width: 100%;height: 100%;color: var(--bs-secondary);font-weight: bold;text-align: left;"><strong><span style="color: rgb(1, 177, 95);"><%=carPrice%></span></strong></label>

                    <% }else{ %>

                    <%String number = auction.getStartingBid(); %>


                    <% carPrice = currencyFormatter.format(Integer.parseInt(auction.getStartingBid()));%>
                    <%-- <div class="text-block-23"><%=carPrice%></div> --%>
                    <label class="form-label" style="width: 100%;height: 100%;color: var(--bs-secondary);font-weight: bold;text-align: left;"><strong><span style="color: rgb(1, 177, 95);"><%=carPrice%></span></strong></label>


                    <%} %>



                    <!--   //////////////////////////////////////////////////////////////////////// -->






                    <!-- <label class="form-label" style="width: 100%;height: 100%;color: var(--bs-secondary);font-weight: bold;text-align: left;"><strong><span style="color: rgb(1, 177, 95);">$2,750,243.00</span></strong></label> -->
                </div>
                <div class="d-flex d-lg-flex flex-row justify-content-center align-items-center justify-content-lg-start" style="text-align: center;">
                    <label class="form-label" style="width: 65%;height: 100%;--bs-success: #01b15f;--bs-success-rgb: 1,177,95;color: #6c757d;text-align: left;font-size: 16px;font-weight: bold;">Current Bidder:</label>

                    <% if(auction.getBidderEmail() == null){ %>
                    <label class="form-label" style="width: 100%;height: 100%;font-size: 12px;color: #00c8e3;font-weight: bold;text-align: left;">No Current Bidders!</label>

                    <%}else{ %>
                    <label class="form-label" style="width: 100%;height: 100%;font-size: 12px;color: #00c8e3;font-weight: bold;text-align: left;"><%=auction.getBidderEmail()%></label>
                    <%} %>

                </div>
                <div class="d-flex d-lg-flex flex-row justify-content-center align-items-center justify-content-lg-start" style="text-align: center;">
                    <label class="form-label" style="width: 100%;height: 100%;--bs-success: #01b15f;--bs-success-rgb: 1,177,95;color: #6c757d;text-align: left;font-size: 14px;font-weight: bold;">&nbsp;Active Bids:&nbsp;<strong>3 Bids</strong></label>
                    <label class="form-label" style="width: 100%;height: 100%;font-size: 12px;color: #00c8e3;font-weight: bold;text-align: left;">Show bid history</label>
                </div>
            </div>
            <div class="d-flex d-lg-flex align-items-center align-content-center justify-content-lg-start" style="text-align: center;background: #d5d5d5;border-radius: 8px;margin-top: 30px;filter: brightness(112%);">

                <script src="assets/JavaScript/userPageErrorTest.js"></script>

                <%-- <label id="countdown<%=auction.getAuctionId()%>"></label> --%>

                <label class="form-label d-lg-flex justify-content-lg-center align-items-lg-center" id="countdown<%=auction.getAuctionId()%>" style="width: 100%;height: 100%;margin-top: 10px;font-size: 13px;--bs-danger: #dc3545;--bs-danger-rgb: 220,53,69;color: #dc3545;font-weight: bold;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none" style="margin-right: 5px;">
                        <path d="M5.45887 2L1 6.01478L2.33826 7.50107L6.79713 3.48629L5.45887 2Z" fill="currentColor"></path>
                        <path d="M11 8H13V12H16V14H11V8Z" fill="currentColor"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12ZM5 12C5 8.13401 8.13401 5 12 5C15.866 5 19 8.13401 19 12C19 15.866 15.866 19 12 19C8.13401 19 5 15.866 5 12Z" fill="currentColor"></path>
                        <path d="M18.5411 2L23 6.01478L21.6617 7.50107L17.2029 3.48629L18.5411 2Z" fill="currentColor"></path>
                    </svg></label>    <!--21d 4h 20m 38s  -->

                <label class="form-label" style="width: 100%;height: 100%;margin-top: 10px;font-size: 10px;color: #01b4cc;font-weight: bold;padding-right: 10px;padding-left: 10px;">Ends: <%=formattedDate %></label>
            </div>





            <!-- <form action="ProductPageServlet" method="post"> -->

            <!-- bidder can't bid on own auction or if auction is expired -->
            <%if(!users.get(0).getUserEmail().equals(auction.getUserEmail()) && !auction.getCalculatedExpirationDate().contains("-")){ %>


            <form action="ProductPageServlet" method="post">
                <div style="height: 30px;margin-top: 20px;">
                    <label class="form-label" style="width: 100%;height: 100%;--bs-secondary: #6c757d;--bs-secondary-rgb: 108,117,125;color: #6c757d;font-weight: bold;font-size: 20px;">Enter Bid Price Below:&nbsp;</label>
                </div>
                <div class="d-flex d-lg-flex flex-row justify-content-start align-items-baseline justify-content-lg-start" style="margin: 0px;height: 38px;margin-top: 10px;">
                    <input type="number" name= "bidderPrice" style="width: 100%;height: 100%;--bs-secondary: #6c757d;--bs-secondary-rgb: 108,117,125;border-radius: 15px;border: 1px solid #d2d2d2;margin-left: 5px;margin-top: 0px;padding-left: 20px;" placeholder="Enter Bid Price">
                </div>
                <div style="margin-top: 20px;">
                    <button class="btn btn-primary" data-bss-hover-animate="pulse" type="submit" style="width: 100%;height: 100%;margin-top: 0px;border-radius: 20px;font-weight: bold;background: linear-gradient(55deg, #11e5fe 58%, #4eacfe 82%);border-color: rgb(54,207,254);">Place Bid</button>
                </div>

                <%
                    String check = (String)request.getAttribute("success");

                    if(check != null && check.equals("error")){
                %>

                <div class="d-flex flex-row justify-content-center justify-content-lg-start align-items-lg-center" style="width: 100%;"><svg class="bi bi-x d-lg-flex" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" style="width: 10%;color: #dc3545;margin-right: 0px;height: 100%;">
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"></path>
                </svg><label class="form-label d-lg-flex align-items-lg-center" style="width: 100%;height: 100%;color: #dc3545;font-weight: bold;margin-bottom: 0px;">Bid is lower than current bid</label></div>


                <%
                } else if (check != null && check.equals("success")){

                %>

                <div class="d-flex flex-row justify-content-center justify-content-lg-start align-items-lg-center" style="width: 100%;"><svg class="bi bi-check d-lg-flex" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" style="width: 10%;color: rgba(79, 174, 103);margin-right: 0px;height: 100%;">
                    <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"></path>
                </svg><label class="form-label d-lg-flex align-items-lg-center" style="width: 100%;height: 100%;color: rgba(79, 174, 103);font-weight: bold;margin-bottom: 0px;">Successfully placed bid!</label></div>




                <%
                    }
                %>


            </form>

            <%}else if(users.get(0).getUserEmail().equals(auction.getUserEmail())){ %>
            <!--////////////////////////////////////////////////////////////////////////////  -->


            <div class="d-flex flex-row justify-content-center justify-content-lg-start align-items-lg-center" style="width: 100%;"><svg class="bi bi-check d-lg-flex" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" style="width: 10%;color: rgba(79, 174, 103);margin-right: 0px;height: 100%;">
                <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"></path>
            </svg><label class="form-label d-lg-flex align-items-lg-center" style="width: 100%;height: 100%;color: rgba(79, 174, 103);font-weight: bold;margin-bottom: 0px;">This is your auction!</label></div>




            <!--////////////////////////////////////////////////////////////////////////////////  -->


            <%} %>


            <%--                 	<div style="height: 30px;margin-top: 20px;">
                                    <label class="form-label" style="width: 100%;height: 100%;--bs-secondary: #6c757d;--bs-secondary-rgb: 108,117,125;color: #6c757d;font-weight: bold;font-size: 20px;">Enter Bid Price Below:&nbsp;</label>
                                </div>
                                <div class="d-flex d-lg-flex flex-row justify-content-start align-items-baseline justify-content-lg-start" style="margin: 0px;height: 38px;margin-top: 10px;">
                                    <input type="number" name= "bidderPrice" style="width: 100%;height: 100%;--bs-secondary: #6c757d;--bs-secondary-rgb: 108,117,125;border-radius: 15px;border: 1px solid #d2d2d2;margin-left: 5px;margin-top: 0px;padding-left: 20px;" placeholder="Enter Bid Price">
                                </div>
                                   <div style="margin-top: 20px;">
                                       <button class="btn btn-primary" data-bss-hover-animate="pulse" type="submit" style="width: 100%;height: 100%;margin-top: 0px;border-radius: 20px;font-weight: bold;background: linear-gradient(55deg, #11e5fe 58%, #4eacfe 82%);border-color: rgb(54,207,254);">Place Bid</button>
                                   </div>

                                <%
                                    String check = (String)request.getAttribute("success");

                                       if(check != null && check.equals("error")){
                                %>

                                    <div class="d-flex flex-row justify-content-center justify-content-lg-start align-items-lg-center" style="width: 100%;"><svg class="bi bi-x d-lg-flex" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" style="width: 10%;color: #dc3545;margin-right: 0px;height: 100%;">
                                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"></path>
                                        </svg><label class="form-label d-lg-flex align-items-lg-center" style="width: 100%;height: 100%;color: #dc3545;font-weight: bold;margin-bottom: 0px;">Bid is lower than current bid</label></div>


                                <%
                                        } else if (check != null && check.equals("success")){

                                %>

                                     <div class="d-flex flex-row justify-content-center justify-content-lg-start align-items-lg-center" style="width: 100%;"><svg class="bi bi-check d-lg-flex" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" style="width: 10%;color: rgba(79, 174, 103);margin-right: 0px;height: 100%;">
                                        <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"></path>
                                            </svg><label class="form-label d-lg-flex align-items-lg-center" style="width: 100%;height: 100%;color: rgba(79, 174, 103);font-weight: bold;margin-bottom: 0px;">Successfully placed bid!</label></div>




                                <%
                                    }
                                %>
             --%>
            <!-- </form> -->



        </div>
        <div class="w-100"></div>
    </div>
    <div class="row justify-content-sm-center justify-content-xl-center justify-content-xxl-center" style="height: 200px;">
        <div class="col-md-6 col-lg-6" style="height: 100%;width: 610px;margin-top: 0px;">
            <div class="d-flex d-lg-flex justify-content-start justify-content-lg-start" style="width: 100%;height: 60px;margin-top: 10px;">
                <div style="width: 40px;height: 40px;">

                    <img class="border-1" style="width: 100%;height: 100%;border-radius: 100%;border-style: solid;border-color: #6c757d;"
                         src="<%=sellerProfilePicture%>"
                         onerror="this.onerror=null;this.src='AWSDownloadServlet?key=<%=sellerProfilePicture%>';"
                         onerror="this.onerror=null;this.src='Images/Default.jpg';">

<%--                    <img class="border-1" style="width: 100%;height: 100%;border-radius: 100%;border-style: solid;border-color: #6c757d;" src="<%=sellerProfilePicture%>">--%>
                    <%-- <img class="border-1" style="width: 100%;height: 100%;border-radius: 100%;border-style: solid;border-color: #6c757d;" src="AWSDownloadServlet?key=<%=sellerProfilePicture%>"> --%>


                </div>
                <div class="d-flex d-lg-flex justify-content-start align-items-center align-items-lg-center" style="width: 200px;height: 40px;">
                    <label class="form-label" style="margin-left: 5px;color: #6c757d;">Sold by</label>
                    <label class="form-label" style="margin-left: 2px;font-weight: bold;color: #6c757d;"><%=fullName%></label>
                </div>

                <form action="ContactSellerServlet" method="post">
                    <div data-bss-hover-animate="pulse" style="height: 40px;width: 180px;">
                        <button type="submit" name="sellerEmail" value="<%=sellerEmail %>"  class="btn btn-primary d-lg-flex justify-content-lg-center align-items-lg-center" type="button" style="width: 100%;height: 100%;border-radius: 20px;color: rgb(255,255,255);background: linear-gradient(55deg, #11e5fe 30%, #4eacfe 82%);font-weight: bold;font-size: 14px;border: 2px solid rgb(54,207,254);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M3.00977 5.83789C3.00977 5.28561 3.45748 4.83789 4.00977 4.83789H20C20.5523 4.83789 21 5.28561 21 5.83789V17.1621C21 18.2667 20.1046 19.1621 19 19.1621H5C3.89543 19.1621 3 18.2667 3 17.1621V6.16211C3 6.11449 3.00333 6.06765 3.00977 6.0218V5.83789ZM5 8.06165V17.1621H19V8.06199L14.1215 12.9405C12.9499 14.1121 11.0504 14.1121 9.87885 12.9405L5 8.06165ZM6.57232 6.80554H17.428L12.7073 11.5263C12.3168 11.9168 11.6836 11.9168 11.2931 11.5263L6.57232 6.80554Z" fill="currentColor"></path>
                        </svg>Contact Seller</button></div>


                </form>
                <%--   <div data-bss-hover-animate="pulse" style="height: 40px;width: 180px;"><button name="sellerEmail" value="<%=sellerEmail %>" onclick="window.location.href = 'contactSeller.jsp'" class="btn btn-primary d-lg-flex justify-content-lg-center align-items-lg-center" type="button" style="width: 100%;height: 100%;border-radius: 20px;color: rgb(255,255,255);background: linear-gradient(55deg, #11e5fe 30%, #4eacfe 82%);font-weight: bold;font-size: 14px;border: 2px solid rgb(54,207,254);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none">
                              <path fill-rule="evenodd" clip-rule="evenodd" d="M3.00977 5.83789C3.00977 5.28561 3.45748 4.83789 4.00977 4.83789H20C20.5523 4.83789 21 5.28561 21 5.83789V17.1621C21 18.2667 20.1046 19.1621 19 19.1621H5C3.89543 19.1621 3 18.2667 3 17.1621V6.16211C3 6.11449 3.00333 6.06765 3.00977 6.0218V5.83789ZM5 8.06165V17.1621H19V8.06199L14.1215 12.9405C12.9499 14.1121 11.0504 14.1121 9.87885 12.9405L5 8.06165ZM6.57232 6.80554H17.428L12.7073 11.5263C12.3168 11.9168 11.6836 11.9168 11.2931 11.5263L6.57232 6.80554Z" fill="currentColor"></path>
                          </svg>Contact Seller</button></div>
                           --%>

            </div>
            <div class="d-flex d-lg-flex justify-content-start align-items-center align-items-lg-center" style="width: 100%px;height: 40px;">
                <label class="form-label" style="margin-left: 5px;color: #6c757d;width: 140px;">Pick up Location:</label>
                <label class="form-label" style="margin-left: 2px;font-weight: bold;color: #6c757d;width: 200px;"><%=pickUpLocation %></label>
            </div>
        </div>
        <div class="col-md-6" style="width: 100%;min-width: 350px;max-width: 350px;margin-top: 10px;">
            <div style="height: 150px;width: 100%;">
                <label class="form-label d-lg-flex align-items-lg-start" style="font-size: 15px;font-weight: bold;color: #6c757d;">Car Description:</label>
                <label class="form-label" style="color: #6c757d;"><%=auction.getCarDescription()%></label>
            </div>
        </div>
    </div>
</div>

<script >


    // Set the end time for the countdown
    var endTime<%=auction.getAuctionId()%> = new Date('<%=auction.getExpirationDate()%>').getTime();

    // Start the countdown
    startCountdown("<%=auction.getAuctionId()%>", endTime<%=auction.getAuctionId()%>);




</script>

<jsp:include page="footer.jsp" />

<script src="assets/JavaScript/userPageErrorTest.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65f1335b449f2a64b6d20ec9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="assets/js/webflow.js" type="text/javascript"></script>
</body>
</html>