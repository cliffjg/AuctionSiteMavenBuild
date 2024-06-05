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
    <title>AuctionUp New Auction</title>
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



<jsp:include page="header.jsp" />
<jsp:include page="tabBar.jsp" />





<%--<form action="AddAuctionServlet" method="post" enctype="multipart/form-data">--%>
<form action="AddAuctionServletAWS" method="post" enctype="multipart/form-data">

    <div class="d-flex d-lg-flex justify-content-center align-items-center justify-content-lg-center align-items-lg-start" style="height: 100%;background: linear-gradient(black 0%, rgb(134,134,134) 100%, white 100%);">
        <div class="d-flex d-lg-flex justify-content-center align-items-center justify-content-sm-center justify-content-lg-center align-items-lg-start" style="padding-top: 20px;height: 100%;width: 85%;background: var(--bs-body-bg);">
            <div class="d-lg-flex justify-content-lg-start align-items-lg-start" style="width: 80%;margin-right: 0px0px;margin-left: 0px;height: 100%;">



                <div style="width: 100%;height: 100%;">
                    <div class="m-auto w-lg-75 w-xl-50" style="width: 90%;">



                        <div  class="d-flex d-lg-flex justify-content-center align-items-center justify-content-lg-center align-items-lg-center" style="width: 100%;height: 400px;border: 1px solid #dee2e6;border-radius: 2px;position: relative;">

                            <%--                 	<%
                                                    if(){
                                                %>
                                                        <div style="width: 50px;height: 50px;position: relative;z-index: 0;">
                                                            <img width="100" height="80" style="width: 100%;height: 100%;border-radius: 2px;border: 1px none #dee2e6;position: relative;z-index: 0;" src="Images/add.png" name="imagePath">
                                                        </div>

                                                <%
                                                    }else{
                                                %>
                                                        <div style="width: 50px;height: 50px;position: relative;z-index: 0;">
                                                            <img width="100" height="80" style="width: 100%;height: 100%;border-radius: 2px;border: 1px none #dee2e6;position: relative;z-index: 0;" src="Images/add.png" name="imagePath">
                                                        </div>
                                                <%
                                                    }
                                                %>

                                 --%>


                            <div id="divAboveImage" style="width: 50px;height: 50px;position: relative;z-index: 1;">
                                <img id="imagePath" width="100" height="80" style="width: 100%;height: 100%;border-radius: 2px;border: 1px none #dee2e6;position: relative;z-index: 1;" src="Images/add.png" name="imagePath">
                            </div>

                            <!-- 	<div style="width: 100%;height: 100%;position: relative;z-index: 1;">
                            		<img id="imagePath" width="100" height="80" style="width: 100%;height: 100%;border-radius: 2px;border: 1px none #dee2e6;position: relative;z-index: 1;" src="Images/add.png" name="imagePath">
                            	</div> -->

                            <div style="height: 100%; width: 100%;position: absolute; z-index: 2;">
                                <input id="imagePath" name="imagePath" type="file" accept="image/*" style="height: 100%; width: 100%;cursor: pointer; opacity: 0;position: absolute;z-index: 2;" onchange="previewImage(event)" required>
                                <p id="filePath" name="filePath"></p>
                            </div>
                            <!-- <input type="file" style="height: 100%; width: 100%;cursor: pointer; z-index: 2;opacity: 1;"> -->

                        </div>


                        <!--THIS SCRIPT IS FOR CHANGING THE ADD IMAGE ICON TO THE IMAGE SELECTED BY USER  -->
                        <script>

                            function previewImage(event) {

                                var img = document.getElementById('imagePath');
                                var divAboveImage = document.getElementById('divAboveImage');
                                console.log("The image: " + img.value);

                                // Check if a file was selected
                                if (event.target.files && event.target.files[0]) {
                                    var reader = new FileReader();

                                    reader.onload = function(e) {


                                        //set the size of the image and also the result
                                        img.style.width = '100%';
                                        img.style.height = '100%';
                                        img.src = e.target.result;

                                        //expand div above image from icon to full image
                                        divAboveImage.style.width = '100%';
                                        divAboveImage.style.height = '100%';

                                    }

                                    // Read the selected file as a Data URL
                                    reader.readAsDataURL(event.target.files[0]);
                                }
                            }


                            function handleFileSelect(event) {
                                const file = event.target.files[0];
                                const filePath = URL.createObjectURL(file);
                                document.getElementById('filePath').textContent = filePath;

                            }



                        </script>



                        <div>
                            <div class="form-group mb-3">
                                <label class="form-label text-secondary">Year</label>
                                <input class="d-flex" required=""  name="carYear" type="number" min="1900" max="2025" step="1" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label text-secondary">Make</label>
                                <!-- <input class="d-flex" type="text" required=""  name="carMake" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;"> -->
                                <select class="d-flex" name="carMake" class="addAuctionInputs" id="year" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;" required>

                                    <option id="make" value="0" disabled selected></option>
                                    <option id="make">Abarth</option>
                                    <option id="make">Acura</option>
                                    <option id="make">Alfa Romeo</option>
                                    <option id="make">Aston Martin</option>
                                    <option id="make">Audi</option>
                                    <option id="make">Bentley</option>
                                    <option id="make">BMW</option>
                                    <option id="make">Bugatti</option>
                                    <option id="make">Buick</option>
                                    <option id="make">Cadillac</option>
                                    <option id="make">Chevrolet</option>
                                    <option id="make">Chrysler</option>
                                    <option id="make">Citroen</option>
                                    <option id="make">Dacia</option>
                                    <option id="make">Dodge</option>
                                    <option id="make">Ferrari</option>
                                    <option id="make">Fiat</option>
                                    <option id="make">Ford</option>
                                    <option id="make">GMC</option>
                                    <option id="make">Honda</option>
                                    <option id="make">Hummer</option>
                                    <option id="make">Hyundai</option>
                                    <option id="make">Infiniti</option>
                                    <option id="make">Isuzu</option>
                                    <option id="make">Jaguar</option>
                                    <option id="make">Jeep</option>
                                    <option id="make">Kia</option>
                                    <option id="make">Lamborghini</option>
                                    <option id="make">Lancia</option>
                                    <option id="make">Land Rover</option>
                                    <option id="make">Lexus</option>
                                    <option id="make">Lincoln</option>
                                    <option id="make">Lotus</option>
                                    <option id="make">Maserati</option>
                                    <option id="make">Mazda</option>
                                    <option id="make">McLaren</option>
                                    <option id="make">Mercedes-Benz</option>
                                    <option id="make">Mercury</option>
                                    <option id="make">Mini</option>
                                    <option id="make">Mitsubishi</option>
                                    <option id="make">Nissan</option>
                                    <option id="make">Opel</option>
                                    <option id="make">Peugeot</option>
                                    <option id="make">Pontiac</option>
                                    <option id="make">Porsche</option>
                                    <option id="make">Ram</option>
                                    <option id="make">Renault</option>
                                    <option id="make">Saab</option>
                                    <option id="make">Saturn</option>
                                    <option id="make">Scion</option>
                                    <option id="make">Seat</option>
                                    <option id="make">Skoda</option>
                                    <option id="make">Smart</option>
                                    <option id="make">SsangYong</option>
                                    <option id="make">Subaru</option>
                                    <option id="make">Suzuki</option>
                                    <option id="make">Tesla</option>
                                    <option id="make">Toyota</option>
                                    <option id="make">Volkswagen</option>
                                    <option id="make">Volvo</option>
                                    <option id="make">Wiesmann</option>
                                    <option id="make">Other</option>





                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label text-secondary">Model</label>
                                <input class="d-flex" type="text" required="" name="carModel" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 100%;height: 100%;padding-right: 20px;padding-left: 20px;">
                    <div class="form-group mb-3">
                        <label class="form-label text-secondary">Color</label>
                        <input class="d-flex" type="text" required=""  name="carColor" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label text-secondary">Car Price</label>
                        <input class="d-flex" type="number" min="1" step="1" name="carPrice" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label text-secondary">Starting Bid</label>
                        <input class="d-flex" type="number" min="1" step="1" name="startingBid" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label text-secondary">Expiration Date</label>
                        <input class="d-flex" type="datetime-local" required="" name="expirationDate" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label text-secondary">Car Description</label>
                        <textarea name="carDescription" style="width: 100%;height: 150px;border-radius: 6px;border: 1px solid #dee2e6;"></textarea>
                    </div>

                    <button class="btn btn-info mt-2" type="submit" style="color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);width: 100%;">Submit</button>
                    <a class="btn btn-info mt-2" role="button" href="userPage.jsp" style="color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(255,103,103) -5%, #ff0000 100%), rgb(103,170,247);width: 100%;border-color: #ff0000;">Cancel</a>
                </div>






            </div>
        </div>
    </div>


</form>


<jsp:include page="footer.jsp" />

<script src="assets/JavaScript/userPageErrorTest.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65f1335b449f2a64b6d20ec9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="assets/js/webflow.js" type="text/javascript"></script>
</body>
</html>