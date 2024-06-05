package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileOutputStream;

import java.io.InputStream;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.Part;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.PutObjectRequest;


/**
 * Servlet implementation class AddAuctionServletAWS
 */
@WebServlet("/AddAuctionServletAWS")
@MultipartConfig
public class AddAuctionServletAWS extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAuctionServletAWS() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ImageName = null;

////////////////////////////////////////AWS BEGINNING/////////////////////////////////////////////////////////////////////////////////////////////

        // Get the file part from the request
        Part filePart = request.getPart("imagePath");
        if (filePart == null || filePart.getSize() == 0) {
            System.out.println("No file part received");
            response.getWriter().println("No file uploaded");
            return;
        }
        String fileName = getFileName(filePart);
        System.out.println("File name received: " + fileName);


//        String imagePath = fileName;

        // Create a temporary file
        File tempFile = File.createTempFile("upload-", fileName);
        System.out.println("Temporary file created: " + tempFile.getAbsolutePath());


        System.out.println("Printing out tempFile.getName(): " + tempFile.getName());

        String imagePath = tempFile.getName();



        try (InputStream input = filePart.getInputStream();
             FileOutputStream output = new FileOutputStream(tempFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }
        System.out.println("File written to temporary file");



////////////////////////////////////////AWS ENDING///////////////////////////////////////////////////////////////////////////////////////////////






        //Date formatter and get current date and time
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String startDate = formatter.format(now);


        HttpSession session = request.getSession();


        //Get all attributes from user
        String userEmail = (String)session.getAttribute("userEmail");
        String carImage = request.getParameter("carImage");
        String carYear = request.getParameter("carYear");
        String carMake = request.getParameter("carMake");
        String carModel = request.getParameter("carModel");
        String carColor = request.getParameter("carColor");
        String startingBid = request.getParameter("startingBid");
        String carPrice = request.getParameter("carPrice");
        String expirationDate = request.getParameter("expirationDate");
        String carDescription = request.getParameter("carDescription");
//		String imagePath = request.getParameter("imagePath");

//		String imagePath = ImageName;


        String filePathes = request.getParameter("filePath");
        System.out.println("This is the filePah:" + filePathes);


        System.out.println("Image Path: " + imagePath);

        if(imagePath == null || imagePath.equals("") || imagePath == "") {
            imagePath = "Images/AwaitingPhoto.jpeg";
        }else {
            imagePath = "Images/"+imagePath;
        }



        System.out.println("\n");


        System.out.println("User Email: " + userEmail);
        System.out.println("Car Year: " + carYear);
        System.out.println("Car Make: " + carMake);
        System.out.println("Car Model: " + carModel);
        System.out.println("Car Color: " + carColor);
        System.out.println("Starting Bid: " + startingBid);
        System.out.println("Car Price: " + carPrice);
        System.out.println("Car Description: " + carDescription);
        System.out.println("Image Path: " + imagePath);




        String queryAddAuction = "insert into Auction(userEmail, carImage, carYear, carMake, carModel, carColor, startingBid, carPrice, startDate, expirationDate, carDescription, imagePath) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?);";


        String queryAddBidHistory = null;
        String queryAddBidHistory1 = null;
        String auctionID = null;

        //query to get last entry in auction by current userEmail
        String queryLastAddAuctionEntry = "select * from Auction where userEmail = '"+ userEmail + "' ORDER BY auctionID DESC LIMIT 1;";



        try{
            DatabaseAccess db = new DatabaseAccess();
            Connection connection = db.getConnection();


            PreparedStatement preparedStatement = connection.prepareStatement(queryAddAuction);
            preparedStatement.setString(1, userEmail);
            preparedStatement.setString(2, carImage);
            preparedStatement.setString(3, carYear);
            preparedStatement.setString(4, carMake);
            preparedStatement.setString(5, carModel);
            preparedStatement.setString(6, carColor);
            preparedStatement.setString(7, startingBid);
            preparedStatement.setString(8, carPrice);
            preparedStatement.setString(9, startDate);
            preparedStatement.setString(10, expirationDate);
            preparedStatement.setString(11, carDescription);
            preparedStatement.setString(12, imagePath);


            preparedStatement.executeUpdate();


            Statement statement = connection.createStatement();


            //get last new auction that was inserted by the current user
            ResultSet rs = statement.executeQuery(queryLastAddAuctionEntry);

            while(rs.next()) {

                auctionID = rs.getString("auctionID");

            }

            //insert the bid into bidHistory
            queryAddBidHistory = "insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values (?,?,?,?);";

            PreparedStatement ps = connection.prepareStatement(queryAddBidHistory);
            ps.setString(1, auctionID);
            ps.setString(2, userEmail);
            ps.setString(3, startingBid);
            ps.setString(4, startDate);

            ps.executeUpdate();

////////////////////////////////////////AWS BEGINNING/////////////////////////////////////////////////////////////////////////////////////////////


            CredentialsLoader credentialsLoader = new CredentialsLoader();

            //BucketName and Region
            String region = credentialsLoader.getProperty("AWS_REGION");
            String bucketName = credentialsLoader.getProperty("AWS_BUCKET");


            // Define the folder name (object key with trailing slash)
            String folderName = "Images/";

            // Create an S3 client
            AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withRegion(region).build();

            // Define the file to upload
            String filePath = tempFile.getAbsolutePath();

            File file = new File(filePath);

            // Upload the file to the folder
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, folderName + file.getName(), file);
            s3Client.putObject(putObjectRequest);

            System.out.println("File ("+file.getName()+") uploaded successfully to the folder.");







            // Clean up the temporary file
            if (tempFile.delete()) {
                System.out.println("Temporary file deleted successfully");
            } else {
                System.out.println("Failed to delete temporary file");
            }

            response.getWriter().println("File uploaded successfully!");


            System.out.println("Image Path: " + imagePath);


////////////////////////////////////////AWS ENDING///////////////////////////////////////////////////////////////////////////////////////////////




            session.setAttribute("userEmail", userEmail);
            request.getRequestDispatcher("BackToUserPageServlet").forward(request,response);
//			request.getRequestDispatcher("userPage.jsp").forward(request,response);

        }catch(Exception e){

            throw new IllegalStateException("Cannot connect the database!", e);
        }


    }


    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }


}
