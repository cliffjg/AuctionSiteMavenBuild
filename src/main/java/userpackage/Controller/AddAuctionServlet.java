package userpackage.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



/**
 * Servlet implementation class AddAuctionServlet
 */
@WebServlet("/AddAuctionServlet")
@MultipartConfig
public class AddAuctionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAuctionServlet() {
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
        // TODO Auto-generated method stub



//////////////////////////////////BEGINNING OF FILE UPLOAD//////////////////////////////////////////////////////////////////////////////////////////////////////////////

        String ImageName = null;

        // Get the directory of the current Java file
        Path currentPath;
        try {
            currentPath = Paths.get(AddAuctionServlet.class.getProtectionDomain().getCodeSource().getLocation().toURI()).getParent();

            System.out.println("currentPath: " + currentPath);

            // Construct the relative path to "AuctionSite/src/main/webapp/Images"
            Path relativePath = Paths.get("src", "main", "webapp", "Images");
            System.out.println("relativePath: " + relativePath);

            // Resolve the relative path against the current directory
            Path imagePaths = currentPath.resolve(relativePath);
            System.out.println("imagePath: " + imagePaths);

            // Convert the resolved path to a string and append the specific directory
            String imagePathString = imagePaths.toAbsolutePath().toString();
            //String imagePathString = imagePaths.toAbsolutePath().toString() + File.separator + "AliceSmith@gmail.com";
            System.out.println("imagePathString: " + imagePathString);

            // Strings of data to be removed
            String[] stringsToRemove = {".metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/","WEB-INF/"};

            // Removing unwanted parts of the path
            String modifiedString = imagePathString;
            for (String stringToRemove : stringsToRemove) {
                modifiedString = modifiedString.replace(stringToRemove, "");
            }
            System.out.println("modifiedString: " + modifiedString);

            // Create a File object representing the directory
            File folder = new File(modifiedString);

            // Check if the folder already exists
            if (!folder.exists()) {
                // If the folder doesn't exist, create it
                boolean created = folder.mkdirs(); // Changed to mkdirs() to create any necessary parent directories
                if (created) {
                    System.out.println("Folder created successfully.");
                } else {
                    System.out.println("Failed to create folder.");
                }
            } else {
                // If the folder already exists, print a message
                System.out.println("Folder already exists.");
            }



            // Process the uploaded file
            Part filePart = request.getPart("imagePath");

            if (filePart != null) {
                // Get the input stream of the uploaded file
                InputStream fileContent = filePart.getInputStream();

                // Define the output file path
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                ImageName = fileName;

                System.out.println("*FILE NAME: " + fileName);
                File outputFile = new File(modifiedString, fileName);

                // Write the file content to the output file
                try (FileOutputStream fos = new FileOutputStream(outputFile)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = fileContent.read(buffer)) != -1) {
                        fos.write(buffer, 0, bytesRead);
                    }
                    System.out.println("File uploaded successfully to " + outputFile.getPath());
                }
            } else {
                System.out.println("No file uploaded.");
            }
        } catch (URISyntaxException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

//////////////////////////////////ENDING OF FILE UPLOAD/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//






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

        String imagePath = ImageName;


        String filePathes = request.getParameter("filePath");
        System.out.println("This is the filePah:" + filePathes);


        System.out.println("Image Path: " + imagePath);

        if(imagePath == null || imagePath.equals("") || imagePath == "") {
            imagePath = "/Images/AwaitingPhoto.jpeg";
        }else {
            imagePath = "/Images/"+imagePath;
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


//////////////////////////////////BEGINNING OF FILE UPLOAD//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//            // Get the directory of the current Java file
//            Path currentPath = Paths.get(AddAuctionServlet.class.getProtectionDomain().getCodeSource().getLocation().toURI()).getParent();
//            System.out.println("currentPath: " + currentPath);
//
//            // Construct the relative path to "AuctionSite/src/main/webapp/Images"
//            Path relativePath = Paths.get("src", "main", "webapp", "Images");
//            System.out.println("relativePath: " + relativePath);
//
//            // Resolve the relative path against the current directory
//            Path imagePaths = currentPath.resolve(relativePath);
//            System.out.println("imagePath: " + imagePaths);
//
//            // Convert the resolved path to a string and append the specific directory
//            String imagePathString = imagePaths.toAbsolutePath().toString();
////            String imagePathString = imagePaths.toAbsolutePath().toString() + File.separator + "AliceSmith@gmail.com";
//            System.out.println("imagePathString: " + imagePathString);
//
//            // Strings of data to be removed
//            String[] stringsToRemove = {
//                ".metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/",
//                "WEB-INF/"
//            };
//
//            // Removing unwanted parts of the path
//            String modifiedString = imagePathString;
//            for (String stringToRemove : stringsToRemove) {
//                modifiedString = modifiedString.replace(stringToRemove, "");
//            }
//            System.out.println("modifiedString: " + modifiedString);
//
//            // Create a File object representing the directory
//            File folder = new File(modifiedString);
//
//            // Check if the folder already exists
//            if (!folder.exists()) {
//                // If the folder doesn't exist, create it
//                boolean created = folder.mkdirs(); // Changed to mkdirs() to create any necessary parent directories
//                if (created) {
//                    System.out.println("Folder created successfully.");
//                } else {
//                    System.out.println("Failed to create folder.");
//                }
//            } else {
//                // If the folder already exists, print a message
//                System.out.println("Folder already exists.");
//            }
//
//
//
//            // Process the uploaded file
//            Part filePart = request.getPart("imagePath");
//            if (filePart != null) {
//                // Get the input stream of the uploaded file
//                InputStream fileContent = filePart.getInputStream();
//
//                // Define the output file path
//                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//
//                System.out.println("*FILE NAME: " + fileName);
//                File outputFile = new File(modifiedString, fileName);
//
//                // Write the file content to the output file
//                try (FileOutputStream fos = new FileOutputStream(outputFile)) {
//                    byte[] buffer = new byte[1024];
//                    int bytesRead;
//                    while ((bytesRead = fileContent.read(buffer)) != -1) {
//                        fos.write(buffer, 0, bytesRead);
//                    }
//                    System.out.println("File uploaded successfully to " + outputFile.getPath());
//                }
//            } else {
//                System.out.println("No file uploaded.");
//            }
//
//
//////////////////////////////////ENDING OF FILE UPLOAD/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//



            session.setAttribute("userEmail", userEmail);
            request.getRequestDispatcher("BackToUserPageServlet").forward(request,response);
//			request.getRequestDispatcher("userPage.jsp").forward(request,response);

        }catch(Exception e){

            throw new IllegalStateException("Cannot connect the database!", e);
        }


    }















}
