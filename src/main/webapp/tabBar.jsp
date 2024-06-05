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

        String myAuctions = "myAuctions";
        String communityAuctions = "communityAuctions";
        String myBids = "myBids";
    %>

    <div class="d-inline-flex flex-column align-content-start flex-wrap flex-sm-shrink-1" style="width: 100%;height: 30px;background: rgb(44,47,50);overflow: scroll;overflow-y: hidden;">
        <div class="highlightTabs" onclick="submitFormWhatTabPressed('<%=communityAuctions%>')" id="communityAuctions" style="height: 100%; display: flex; align-items: center;color: white; margin-left: 20px; font-family: Abel, sans-serif;font-weight: bold;  ">
            <span style="padding-left: 20px; padding-right: 20px;">Community Auctions</span>
        </div>
        <div class="highlightTabs" onclick="submitFormWhatTabPressed('<%=myBids%>')" id="myBidsFavorites" style="height: 100%; display: flex; align-items: center;color: white; font-family: Abel, sans-serif;font-weight: bold;">
            <span style="padding-left: 20px; padding-right: 20px;">My Bids</span>
        </div>
        <div class="highlightTabs" onclick="submitFormWhatTabPressed('<%=myAuctions%>')" id="myAuctions" style="height: 100%; display: flex; align-items: center;color: white; font-family: Abel, sans-serif;font-weight: bold;">
            <span style="padding-left: 20px; padding-right: 20px;">My Auctions</span>
        </div>
    </div>


    <style>

        .highlightTabs{
            cursor:pointer;
        }

        #myAuctions:hover{
            background-color: rgb(110, 107, 107);

        }

        .highlightTabs:hover{
            /* background-color: rgb(0, 0, 0) !important; */
            background-color: rgb(84, 84, 84) !important;
        }
    </style>

    <script>
        function switchToMyAuction() {

            document.getElementById("myAuctions").style.backgroundColor = "rgb(110, 107, 107)";
            document.getElementById("communityAuctions").style.backgroundColor = "rgb(44,47,50)";
            document.getElementById("communityAuctions").style.textDecoration = "none";
            document.getElementById("myAuctions").style.textDecoration = "underline";

        }


        function switchToCommunityAuction() {

            document.getElementById("myAuctions").style.backgroundColor = "rgb(44,47,50)";
            document.getElementById("communityAuctions").style.backgroundColor = "rgb(110, 107, 107)";
            document.getElementById("communityAuctions").style.textDecoration = "underline";
            document.getElementById("myAuctions").style.textDecoration = "none";

        }

        document.getElementById("myAuctions").addEventListener("click", switchToMyAuction);
        document.getElementById("communityAuctions").addEventListener("click", switchToCommunityAuction);



    </script>

    <script src="assets/JavaScript/userPageErrorTest.js"></script>

</header>

