package userpackage.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccountServlet() {
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

        //retrieve input from user
        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String userEmail = request.getParameter("userEmail").trim();
        String userPassword = request.getParameter("password").trim();
        String confirmPassword = request.getParameter("confirmPassword").trim();

        System.out.println("First Name: " + firstName);
        System.out.println("Last Name: " + lastName);
        System.out.println("User Email: " + userEmail);
        System.out.println("User Password: " + userPassword);
        System.out.println("Conf Password: " + confirmPassword);


        String query = "select * from Users where userEmail = '" + userEmail + "';";

        String insertIntoSeller = "insert into Seller(userEmail) values (?);";

//		String query = "select * from Users where userEmail = ?;"
//		PreparedStatement preparedStatement = connection.prepareStatement(query);
//		preparedStatement.setString(1, userEmail);
//		preparedStatement.setString(2, userPassword);

        //if input in userEmail or Password is null
        //send error message to user that account was not created
        //need to reenter input
        if(userEmail.trim() == null || userPassword.trim() == null || userEmail.trim() == "" || userPassword.trim() == "" || !(userPassword.trim().equals(confirmPassword))) {
            System.out.println("UserEmail: " + userEmail);
            System.out.println("Password: " + userPassword);
            System.out.println("Conf Password: " + confirmPassword);
            System.out.println("Name: " + firstName + " " + lastName);

            request.setAttribute("success", "passwordDoesntMatch");
            request.getRequestDispatcher("createAccountPage.jsp").forward(request,response);

        }else {
            try {
                DatabaseAccess db = new DatabaseAccess();
                Connection connection = db.getConnection();

                Statement statement = connection.createStatement();

                ResultSet rs = statement.executeQuery(query);


                //if query returns this means user is in database
                //informs user to re-enter credentials
                //else creates account
                if((rs.next())) {


                    System.out.println("The user is in the list! Can't add user!\n");
                    System.out.println("!User: " + userEmail + "\n");


                    request.setAttribute("success", "error");
                    request.getRequestDispatcher("createAccountPage.jsp").forward(request,response);


                }else {

//	            	String query1 = "insert into Users values ('"+userEmail + "', '"+ userPassword +"' ,'" + firstName + " " + lastName + "', NULL, NULL);";


                    String query1 = "insert into Users values (?,?,?,?,null,null,null,null,null,?);";



                    PreparedStatement preparedStatement = connection.prepareStatement(query1);
                    preparedStatement.setString(1, userEmail);
                    preparedStatement.setString(2, userPassword);
                    preparedStatement.setString(3, firstName);
                    preparedStatement.setString(4, lastName);
                    preparedStatement.setString(5, "Images/Default.jpg");



                    preparedStatement.executeUpdate();


                    preparedStatement = null;

                    preparedStatement = connection.prepareStatement(insertIntoSeller);
                    preparedStatement.setString(1, userEmail);

                    preparedStatement.executeUpdate();


//	            	statement.executeUpdate(query1);





//	                // Get the directory of the current Java file
//	                Path currentPath = Paths.get(CreateAccountServlet.class.getProtectionDomain().getCodeSource().getLocation().getPath()).getParent();
//
//
//	                System.out.println("currentPath: " + currentPath);
//
//	                // Construct the relative path to "AuctionSite/src/main/webapp/Images"
//	                Path relativePath = Paths.get("src", "main", "webapp", "Images");
//
//	                System.out.println("relativePath: " + relativePath);
//
//	                // Resolve the relative path against the current directory
//	                Path imagePath = currentPath.resolve(relativePath);
//
//	                System.out.println("imagePath: " + imagePath);
//
//	                // Convert the resolved path to a string
//	                String imagePathString = imagePath.toAbsolutePath().toString() + File.separator + userEmail;
//
//	                System.out.println("imagePathString: " + imagePathString);
//
//	                //String of data to be removed that was inserted due to it running on a server
//	                String stringToRemove = ".metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/";
//	                String modifiedString = imagePathString.replace(stringToRemove, "");
//
//	                //further removal of data
//	                stringToRemove = "WEB-INF/";
//	                modifiedString = modifiedString.replace(stringToRemove, "");
//
//
//
//	                System.out.println("modifiedString: " + modifiedString);
//
//
//	                // Create a File object representing the directory
//	                File folder = new File(modifiedString);
//
//
//
////	              Check if the folder already exists
//	                if (!folder.exists()) {
//	                    // If the folder doesn't exist, create it
//	                    boolean created = folder.mkdir();
//	                    if (created) {
//	                        System.out.println("Folder created successfully.");
//	                    } else {
//	                        System.out.println("Failed to create folder.");
//	                    }
//	                } else {
//	                    // If the folder already exists, print a message
//	                    System.out.println("Folder already exists.");
//	                }
//


                    /////////////////////////////////////////////////////////////////////


                    System.out.println("User '" + userEmail + "' was entered successfully!");

                    request.setAttribute("success", "success");
                    request.getRequestDispatcher("createAccountPage.jsp").forward(request,response);

                }


            }catch(Exception e){

                throw new IllegalStateException("Cannot connect the database!", e);
            }
        }







    }

}
