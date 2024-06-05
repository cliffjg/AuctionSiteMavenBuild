package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userpackage.Model.Users;

/**
 * Servlet implementation class ProfilePageServlet
 */
@WebServlet("/ProfilePageServlet")
public class ProfilePageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilePageServlet() {
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


        HttpSession session = request.getSession();

        String userEmail = (String)session.getAttribute("userEmail");

        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");


        System.out.println("Password: " + password);
        System.out.println("Confirm Password: " + confirmPassword);




        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipCode = request.getParameter("zipCode");
        String phoneNumber = request.getParameter("phoneNumber");




        if(password != null && password.equals(confirmPassword) ) {

            System.out.println("Passwords Match!" );



            String queryUpdate = "update Users set password = ? where userEmail= ?;";
            String query = "select * from Users where userEmail = ?";




            //Arrays for storing the user objects
            ArrayList<Users> users = new ArrayList();




            try {


                DatabaseAccess db = new DatabaseAccess();
                Connection connection = db.getConnection();


                PreparedStatement preparedStatement = connection.prepareStatement(queryUpdate);
                preparedStatement.setString(1, password);
                preparedStatement.setString(2, userEmail);





                preparedStatement.executeUpdate();

                System.out.println("Prepared Statement: " + preparedStatement.toString());

                preparedStatement = null;
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, userEmail);


                ResultSet rs = preparedStatement.executeQuery();

                while(rs.next()) {


                    Users user = new Users(
                            rs.getString("userEmail"),
                            rs.getString("password"),
                            rs.getString("firstName"),
                            rs.getString("lastName"),
                            rs.getString("address"),
                            rs.getString("city"),
                            rs.getString("state"),
                            rs.getString("zipCode"),
                            rs.getString("phoneNumber"),
                            rs.getString("profilePicture")
                    );




                    //add the user object to the users arrayList
                    //so and can be sent later
                    users.add(user);

                }


                System.out.println(users.toString());


                //set all the attributes to be forwarded to userPage.jsp
                session.setAttribute("users", users);

                request.getRequestDispatcher("profilePage.jsp").forward(request,response);



                db.closeConnection(connection);


            }catch(Exception e){

                throw new IllegalStateException("Cannot connect the database!", e);
            }







        }else if(firstName != null &&  lastName != null &&  address != null &&  city != null &&  state != null &&  zipCode != null &&  phoneNumber != null){



            System.out.println("User Email: " + userEmail);

            System.out.println("First Name: " + firstName);
            System.out.println("Last Name: " + lastName);
            System.out.println("Address: " + address);
            System.out.println("City: " + city);
            System.out.println("State: " + state);
            System.out.println("Zip Code: " + zipCode);
            System.out.println("Phone Number: " + phoneNumber);


            String queryUpdate = "update Users set firstName = ?, lastName = ?, address = ?, city = ?, state = ?, zipCode = ?, phoneNumber = ? where userEmail= ?;";
            String query = "select * from Users where userEmail = ?";




            //Arrays for storing the user objects
            ArrayList<Users> users = new ArrayList();




            try {


                DatabaseAccess db = new DatabaseAccess();
                Connection connection = db.getConnection();


                PreparedStatement preparedStatement = connection.prepareStatement(queryUpdate);
                preparedStatement.setString(1, firstName);
                preparedStatement.setString(2, lastName);
                preparedStatement.setString(3, address);
                preparedStatement.setString(4, city);
                preparedStatement.setString(5, state);
                preparedStatement.setString(6, zipCode);
                preparedStatement.setString(7, phoneNumber);
                preparedStatement.setString(8, userEmail);


//				ResultSet rs = preparedStatement.executeQuery();
                preparedStatement.executeUpdate();

                System.out.println("Prepared Statement: " + preparedStatement.toString());

                preparedStatement = null;
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, userEmail);


                ResultSet rs = preparedStatement.executeQuery();

                while(rs.next()) {


                    Users user = new Users(
                            rs.getString("userEmail"),
                            rs.getString("password"),
                            rs.getString("firstName"),
                            rs.getString("lastName"),
                            rs.getString("address"),
                            rs.getString("city"),
                            rs.getString("state"),
                            rs.getString("zipCode"),
                            rs.getString("phoneNumber"),
                            rs.getString("profilePicture")
                    );




                    //add the user object to the users arrayList
                    //so and can be sent later
                    users.add(user);

                }


                System.out.println(users.toString());


                //set all the attributes to be forwarded to userPage.jsp
                session.setAttribute("users", users);

                request.getRequestDispatcher("profilePage.jsp").forward(request,response);



                db.closeConnection(connection);


            }catch(Exception e){

                throw new IllegalStateException("Cannot connect the database!", e);
            }

        }else {
            System.out.println("Passwords Don't Match!");
            request.getRequestDispatcher("profilePage.jsp").forward(request,response);
        }





    }

}
