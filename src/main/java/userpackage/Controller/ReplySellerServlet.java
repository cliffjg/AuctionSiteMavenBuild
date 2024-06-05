package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userpackage.Model.Auction;
import userpackage.Model.Message;
import userpackage.Model.Users;

/**
 * Servlet implementation class ReplySellerServlet
 */
@WebServlet("/ReplySellerServlet")
public class ReplySellerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplySellerServlet() {
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


        Message m = null;
        ArrayList<Message> auctionMessage = (ArrayList<Message>)session.getAttribute("auctionMessage");
        String conversationID = auctionMessage.get(0).getConversationID();
        String auctionID = auctionMessage.get(0).getAuctionID();


        String car = auctionMessage.get(0).getCar();


        ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
        String profilePicture = users.get(0).getProfilePicture();
        String userEmail = users.get(0).getUserEmail();

        String destinationEmail = (String)session.getAttribute("destinationEmail");

        String message = request.getParameter("message");

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy @ HH:mm:ss");
        String formattedDateTime = now.format(formatter);


//		System.out.println("ConversationID: " + conversationID);
//		System.out.println("auctionID: " + auctionID);
//		System.out.println("Car: " + car);
//		System.out.println("Profile Picture: " + profilePicture);
//		System.out.println("From: " + userEmail);
//		System.out.println("To: " + destinationEmail);
//		System.out.println("Message: " + message);
//		System.out.println("Date @ Time: " + formattedDateTime );


        String insertMessage = "insert into AuctionMessagesConversation(conversationID, auctionID, userEmail, profilePicture, car, sendMessage, destinationEmail, messageDateTime) values (?,?,?,?,?,?,?,?)";
        String queryMessages = "select * from AuctionMessagesConversation where conversationID = ? and auctionID = ? order by messageID ASC;";


        try {
            DatabaseAccess db = new DatabaseAccess();
            Connection connection = db.getConnection();


            PreparedStatement preparedStatement = connection.prepareStatement(insertMessage);


            if(message != null) {

                preparedStatement.setString(1, conversationID);
                preparedStatement.setString(2, auctionID);
                preparedStatement.setString(3, userEmail);
                preparedStatement.setString(4, profilePicture);
                preparedStatement.setString(5, car);
                preparedStatement.setString(6, message);
                preparedStatement.setString(7, destinationEmail);
                preparedStatement.setString(8, formattedDateTime);

                preparedStatement.executeUpdate();
            }



            preparedStatement = connection.prepareStatement(queryMessages);
            preparedStatement.setString(1, conversationID);
            preparedStatement.setString(2, auctionID);




            ResultSet rs = preparedStatement.executeQuery();
            auctionMessage.clear();
            while(rs.next()) {

                m = new Message(rs.getString("conversationID"),
                        rs.getString("auctionID"),
                        rs.getString("userEmail"),
                        rs.getString("profilePicture"),
                        rs.getString("car"),
                        rs.getString("sendMessage"),
                        rs.getString("destinationEmail"),
                        rs.getString("messageDateTime"),
                        null

                );


                auctionMessage.add(m);

            }


        }catch(Exception e){

            throw new IllegalStateException("Cannot connect the database!", e);
        }

        session.setAttribute("auctionMessage", auctionMessage);
//	request.getRequestDispatcher("viewMessage.jsp").forward(request,response);
        request.getRequestDispatcher("viewMessagePage.jsp").forward(request,response);


    }

}
