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
 * Servlet implementation class TestingMessageServlet
 */
@WebServlet("/ViewMessageServlet")
public class ViewMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMessageServlet() {
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

        String conversationID = request.getParameter("conversationID");
        String auctionID = request.getParameter("auctionID");
        String userEmail = request.getParameter("userEmail");
        String destinationEmail = request.getParameter("destinationEmail");


//		System.out.println("ConversationID: " + conversationID);
//		System.out.println("AuctionID: " + auctionID);
//		System.out.println("User Email: " + userEmail);
//		System.out.println("Destination Email: " + destinationEmail);


        Auction auction = (Auction) session.getAttribute("auction");

        ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
        ArrayList<Message> auctionMessage = new ArrayList();

        Message m = null;


//		String queryMessages = "select * from AuctionMessagesConversation where conversationID = ? and auctionID = ? and userEmail = ?  order by messageID ASC;";
//		String queryMessages = "select * from AuctionMessagesConversation where conversationID = ? and auctionID = ? and userEmail = ? and destinationEmail = ?  order by messageID ASC;";

        String queryMessages = "select * from AuctionMessagesConversation where conversationID = ? and auctionID = ? order by messageID ASC;";


        try {

            DatabaseAccess db = new DatabaseAccess();
            Connection connection = db.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(queryMessages);


            preparedStatement = connection.prepareStatement(queryMessages);
            preparedStatement.setString(1, conversationID);
            preparedStatement.setString(2, auctionID);
//		preparedStatement.setString(3, userEmail);
//		preparedStatement.setString(4, userEmail);
//		preparedStatement.setString(4, destinationEmail);


            ResultSet rs = preparedStatement.executeQuery();



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
//	request.getRequestDispatcher("viewMessage.jsp").forward(request,response);
        request.getRequestDispatcher("viewMessagePage.jsp").forward(request,response);
































//		String queryMessages = "select * from AuctionMessages where auctionID = ? and userEmail = ? and destinationEmail = ?  order by messageID ASC;";
//
//
//		try {
//
//			DatabaseAccess db = new DatabaseAccess();
//			Connection connection = db.getConnection();
//
//			PreparedStatement preparedStatement = connection.prepareStatement(queryMessages);
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
//
//
//		}catch(Exception e){
//
//			 throw new IllegalStateException("Cannot connect the database!", e);
//		}
//
//		session.setAttribute("auctionMessage", auctionMessage);
//		request.getRequestDispatcher("viewMessage.jsp").forward(request,response);

    }

}
