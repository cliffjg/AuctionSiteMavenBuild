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
 * Servlet implementation class ContactSellerServlet
 */
@WebServlet("/ContactSellerServlet")
public class ContactSellerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactSellerServlet() {
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

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy @ HH:mm:ss");
        String formattedDateTime = now.format(formatter);


        Auction auction = (Auction) session.getAttribute("auction");

        ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
        ArrayList<Message> auctionMessage = new ArrayList();

        Message m = null;

        String conversationID = null;
        String auctionID = auction.getAuctionId();
        String userEmail = users.get(0).getUserEmail();
        String destinationEmail = (String)session.getAttribute("sellerEmail");
        String message = request.getParameter("message");
        String profilePicture = users.get(0).getProfilePicture();

        String car = auction.getCarYear()+ " " + auction.getCarMake() + " " + auction.getCarModel();


//		System.out.println("ConversationID: " + conversationID);
//		System.out.println("auctionID: " + auctionID);
//		System.out.println("Car: " + car);
//		System.out.println("Profile Picture: " + profilePicture);
//		System.out.println("From: " + userEmail);
//		System.out.println("To: " + destinationEmail);
//		System.out.println("Message: " + message);
//		System.out.println("Date @ Time: " + formattedDateTime );

        String checkIfConversationIsInTable = "select * from ConversationCount where auctionID = ? and userEmail = ? and destinationEmail = ?;";
        String insertMessage = "insert into AuctionMessagesConversation(conversationID, auctionID, userEmail, profilePicture, car, sendMessage, destinationEmail, messageDateTime) values (?,?,?,?,?,?,?,?)";
        String queryMessages = "select * from AuctionMessagesConversation where conversationID = ? and auctionID = ? order by messageID ASC;";



        try {
            DatabaseAccess db = new DatabaseAccess();
            Connection connection = db.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(checkIfConversationIsInTable);
            preparedStatement.setString(1, auctionID);
            preparedStatement.setString(2, userEmail);
            preparedStatement.setString(3, destinationEmail);


            ResultSet rs = preparedStatement.executeQuery();

            int count = 0;
            while(rs.next()) {
                count++;
            }

            //check if the conversation is in Conversation count if not check the count and add one-> this will be conversationCountID;
            if(count == 0) {

                String countRowsForConversationID = "select count(*) from ConversationCount;";
                count = 0;
                preparedStatement = null;
                preparedStatement = connection.prepareStatement(countRowsForConversationID);
                rs = preparedStatement.executeQuery();

                //find the count of for ConversationID
                if(rs.next()) {

                    count = rs.getInt(1);
                    count++;

                    conversationID = String.valueOf(count);

                    message = "Started new conversation!";

                }

                //insert the next row in ConversationCount table
                String insertIntoConversationCount = "insert into ConversationCount(auctionID, userEmail, destinationEmail) values(?,?,?);";
                preparedStatement = null;
                preparedStatement = connection.prepareStatement(insertIntoConversationCount);
                preparedStatement.setString(1, auctionID);
                preparedStatement.setString(2, userEmail);
                preparedStatement.setString(3, destinationEmail);
                preparedStatement.executeUpdate();

            }else {

                rs = preparedStatement.executeQuery();
                while(rs.next()) {
                    conversationID = rs.getString("conversationID");

                }

            }



            preparedStatement = null;
            preparedStatement = connection.prepareStatement(insertMessage);

            //when message is typed(not null)insert into the table else skip over
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


            rs = preparedStatement.executeQuery();

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
        session.setAttribute("destinationEmail", destinationEmail);
        request.getRequestDispatcher("viewMessage.jsp").forward(request,response);








//		String insertMessage = "insert into AuctionMessages(auctionID, userEmail, car, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values(?,?,?,?,?,null,?,?)";
//		String queryMessages = "select * from AuctionMessages where auctionID = ? and userEmail = ? and destinationEmail = ?  order by messageID ASC;";
//
//
//		try {
//			DatabaseAccess db = new DatabaseAccess();
//			Connection connection = db.getConnection();
//
//
//			PreparedStatement preparedStatement = connection.prepareStatement(insertMessage);
//			String formattedDateTime = now.format(formatter);
//
//			if(message != null) {
//				preparedStatement.setString(1, auctionID);
//				preparedStatement.setString(2, userEmail);
//				preparedStatement.setString(3, car);
//				preparedStatement.setString(4, message);
//				preparedStatement.setString(5, destinationEmail);
//				preparedStatement.setString(6, formattedDateTime);
//				preparedStatement.setString(7, profilePicture);
//
//				preparedStatement.executeUpdate();
//			}
//
//
//
//			preparedStatement = connection.prepareStatement(queryMessages);
//			preparedStatement.setString(1, auctionID);
//			preparedStatement.setString(2, userEmail);
//			preparedStatement.setString(3, destinationEmail);
//
//
//        	ResultSet rs = preparedStatement.executeQuery();
//
//        	while(rs.next()) {
//
//        		m = new Message(rs.getString("auctionID"),
//        				rs.getString("userEmail"),
//        				rs.getString("car"),
//        				rs.getString("sendMessage"),
//        				rs.getString("destinationEmail"),
//        				rs.getString("receiveMessage"),
//        				rs.getString("messageDateTime"),
//        				rs.getString("profilePicture")
//        				);
//
//        		if(rs.getString("sendMessage") != null) {
//        			System.out.println(rs.getString("userEmail")+ ": " + rs.getString("sendMessage"));
//        		}
//
//        		if(rs.getString("receiveMessage") != null) {
//        			System.out.println(rs.getString("destinationEmail")+ ": " + rs.getString("receiveMessage"));
//        		}
//
//        		auctionMessage.add(m);
//
//        	}
//
//
//		}catch(Exception e){
//
//			 throw new IllegalStateException("Cannot connect the database!", e);
//		}
//
//		session.setAttribute("auctionMessage", auctionMessage);
//		request.getRequestDispatcher("contactSeller.jsp").forward(request,response);
//		request.getRequestDispatcher("productPage.jsp").forward(request,response);













































        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//		HttpSession session = request.getSession();
//
//		LocalDateTime now = LocalDateTime.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy @ HH:mm:ss");
////		String formattedDateTime = now.format(formatter);
//
//
////		String submittingString = request.getParameter("submittingString");
//
//
//
//
//
////		System.out.println("SUBMITTING STRING: "+ submittingString);
//
//		Auction auction = (Auction) session.getAttribute("auction");
//
//		ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
//		ArrayList<Message> auctionMessage = new ArrayList();
//
//		Message m = null;
//
////		String sellerEmail = (String)session.getAttribute("sellerEmail");
//		String destinationEmail = (String)session.getAttribute("sellerEmail");
//		String message = request.getParameter("message");
//
//		String car = auction.getCarYear()+ " " + auction.getCarMake() + " " + auction.getCarModel();
//
//
//		System.out.println("Auction ID: " + auction.getAuctionId());
//		System.out.println("User Email: " + users.get(0).getUserEmail());
//		System.out.println("Seller Email: " + destinationEmail);
//		System.out.println("Message: " + message);
//
//
//
//
//		String insertMessage = "insert into AuctionMessages(auctionID, userEmail, car, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values(?,?,?,?,?,null,?,?)";
//		String queryMessages = "select * from AuctionMessages where auctionID = ? and userEmail = ? and destinationEmail = ?  order by messageID ASC;";
//
//
//		try {
//			DatabaseAccess db = new DatabaseAccess();
//			Connection connection = db.getConnection();
//
//
//			PreparedStatement preparedStatement = connection.prepareStatement(insertMessage);
//			String formattedDateTime = now.format(formatter);
//
//			if(message != null) {
//				preparedStatement.setString(1, auction.getAuctionId());
//				preparedStatement.setString(2, users.get(0).getUserEmail());
//				preparedStatement.setString(3, car);
//				preparedStatement.setString(4, message);
//				preparedStatement.setString(5, destinationEmail);
//				preparedStatement.setString(6, formattedDateTime);
//				preparedStatement.setString(7, users.get(0).getProfilePicture());
//
//				preparedStatement.executeUpdate();
//			}
//
//
//
//			preparedStatement = connection.prepareStatement(queryMessages);
//			preparedStatement.setString(1, auction.getAuctionId());
//			preparedStatement.setString(2, users.get(0).getUserEmail());
//			preparedStatement.setString(3, destinationEmail);
//
//
//        	ResultSet rs = preparedStatement.executeQuery();
//
//
//
//        	while(rs.next()) {
//
//
//
//        		m = new Message(rs.getString("auctionID"),
//        				rs.getString("userEmail"),
//        				rs.getString("car"),
//        				rs.getString("sendMessage"),
//        				rs.getString("destinationEmail"),
//        				rs.getString("receiveMessage"),
//        				rs.getString("messageDateTime"),
//        				rs.getString("profilePicture")
//        				);
//
//        		if(rs.getString("sendMessage") != null) {
//        			System.out.println(rs.getString("userEmail")+ ": " + rs.getString("sendMessage"));
//        		}
//
//        		if(rs.getString("receiveMessage") != null) {
//        			System.out.println(rs.getString("destinationEmail")+ ": " + rs.getString("receiveMessage"));
//        		}
//
//        		auctionMessage.add(m);
//
//        	}
//
////        	System.out.println("auctionMessage: " + auctionMessage.toString());
//
//		}catch(Exception e){
//
//			 throw new IllegalStateException("Cannot connect the database!", e);
//		}
//
//		session.setAttribute("auctionMessage", auctionMessage);
//		request.getRequestDispatcher("contactSeller.jsp").forward(request,response);
////		request.getRequestDispatcher("productPage.jsp").forward(request,response);
//
    }

}
