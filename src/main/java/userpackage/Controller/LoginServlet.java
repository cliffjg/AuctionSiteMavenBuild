package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userpackage.Model.Auction;
import userpackage.Model.Users;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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


        System.out.println("IN LOGIN SERVLET");


        //Arrays for storing the auction objects
        ArrayList<Auction> allAuctions = new ArrayList();
        ArrayList<Auction> myAuction = new ArrayList();
        ArrayList<Auction> communityAuction = new ArrayList();
        ArrayList<Auction> myBids = new ArrayList();
        ArrayList<Users> users = new ArrayList();


        //Getting the userEmail and Password form the input box
        String userEmail = request.getParameter("userEmail");
        String userPassword = request.getParameter("pass");


        //String for sql query to check if field is in database
        String query = "select * from Users where userEmail = ? and password = ?;";



        try {


            DatabaseAccess db = new DatabaseAccess();
            Connection connection = db.getConnection();


            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userEmail);
            preparedStatement.setString(2, userPassword);


            ResultSet rs = preparedStatement.executeQuery();

            System.out.println("Prepared Statement: " + preparedStatement.toString());




            //if Result set returns null or is empty the user
            //is not in the database
            //else if admin -> go to admin page
            if(!(rs.next())) {


                System.out.println("The user " + userEmail + "is NOT in the list! False\n");

                System.out.println("RS: " + rs.next());

                //send error message to userPageTest.jsp
                request.setAttribute("success", "error");
                request.getRequestDispatcher("login.jsp").forward(request,response);


            }else {



                rs = preparedStatement.executeQuery();

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


//
                }


                System.out.println(users.toString());

                HttpSession session = request.getSession();


                //set all the attributes to be forwarded to userPage.jsp
                session.setAttribute("users", users);


                //checks if either admin or User
                if(userEmail.equals("admin@gmail.com")) {

                    //set the session and if can be retrieved when forwarded other page
                    session = request.getSession();
                    session.setAttribute("userEmail", userEmail);


                    //Forward to the servlet AdminPageServlet.java
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminPageServlet");
                    dispatcher.forward(request, response);





                }else {



                    query = "select * from Auction;";

                    preparedStatement = connection.prepareStatement(query);

                    rs = preparedStatement.executeQuery();

                    System.out.println("Prepared Statement: " + preparedStatement.toString());



                    while(rs.next()) {


                        Auction auction = new Auction(
                                rs.getString("auctionID"),
                                rs.getString("userEmail"),
                                rs.getString("carImage"),
                                rs.getString("carYear"),
                                rs.getString("carMake"),
                                rs.getString("carModel"),
                                rs.getString("carColor"),
                                rs.getString("startingBid"),
                                rs.getString("carPrice"),
                                rs.getString("startDate"),
                                rs.getString("expirationDate"),
                                rs.getString("carDescription"),
                                rs.getString("imagePath")
                        );

                        auction.setCurrentBid(rs.getString("currentBid"));
                        auction.setBidderEmail(rs.getString("bidderEmail"));


                        //add the auction object to the myAuction arrayList
                        //so and can be sent later
//        				myAuction.add(auction);

                        allAuctions.add(auction);

                    }

                    System.out.println(allAuctions.toString());


                    response.sendRedirect("userPage.jsp");

//                	//set all the attributes to be forwarded to userPage.jsp
                    session.setAttribute("userEmail", userEmail);
                    session.setAttribute("allAuctions", allAuctions);
//                	session.setAttribute("myAuction", myAuction);
//                	session.setAttribute("communityAuction", communityAuction);
//


                }



            }


            db.closeConnection(connection);


        }catch(Exception e){

            throw new IllegalStateException("Cannot connect the database!", e);
        }




    }


}
