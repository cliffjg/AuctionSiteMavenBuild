package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userpackage.Model.Auction;

/**
 * Servlet implementation class Userpage
 */
@WebServlet("/UserPageServlet")
public class UserPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPageServlet() {
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






        ArrayList<Auction> communityAuction = new ArrayList();

        System.out.println("In Product Page");

        String auctionID = request.getParameter("auctionID");

        System.out.println("Auction ID: " +auctionID);

        HttpSession session = request.getSession();


        session.setAttribute("auctionID", auctionID);


        String query = "select * from Auction where auctionID = ?;";

        String query2 = "select * from Users where userEmail = ?;";

        try {

            DatabaseAccess db = new DatabaseAccess();
            Connection connection = db.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, auctionID);



            ResultSet rs = preparedStatement.executeQuery();

            Auction auction = null;


            while(rs.next()) {


                System.out.println("auctionID: " + rs.getString("auctionID"));
                System.out.println("userEmail: " + rs.getString("userEmail"));
                System.out.println("carYear: " + rs.getString("carYear"));
                System.out.println("carMake: " + rs.getString("carMake"));
                System.out.println("carModel: " + rs.getString("carModel"));
                System.out.println("carColor: " + rs.getString("carColor"));
                System.out.println("startingBid: " + rs.getString("startingBid"));
                System.out.println("carPrice: " + rs.getString("carPrice"));

                System.out.println("carDescription: " + rs.getString("carDescription"));

                System.out.println("imagePath: " + rs.getString("imagePath"));


                auction = new Auction(
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
                        rs.getString("imagePath"),
                        rs.getString("currentBid"),
                        rs.getString("bidderEmail")
                );

                communityAuction.add(auction);

            }

            preparedStatement = connection.prepareStatement(query2);
            preparedStatement.setString(1, auction.getUserEmail());

            rs = preparedStatement.executeQuery();


            String fullName = null;
            String sellerEmail = null;
            String sellerProfilePicture = null;
            String pickUpLocation = null;

            while(rs.next()) {

                fullName = rs.getString("firstName")+ " " +rs.getString("lastName");
                sellerEmail = rs.getString("userEmail");
                sellerProfilePicture = rs.getString("profilePicture");
                pickUpLocation = rs.getString("city") + ", " + rs.getString("state");




            }



            session.setAttribute("fullName", fullName);
            session.setAttribute("sellerEmail", sellerEmail);
            session.setAttribute("sellerProfilePicture", sellerProfilePicture);
            session.setAttribute("pickUpLocation", pickUpLocation);
            session.setAttribute("auction", auction);
            session.setAttribute("communityAuction", communityAuction);

            db.closeConnection(connection);


        }catch(Exception e){

            throw new IllegalStateException("Cannot connect the database!", e);
        }


        response.sendRedirect("productPage.jsp");




    }

}
