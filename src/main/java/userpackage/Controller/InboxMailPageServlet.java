package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import userpackage.Model.Message;
import userpackage.Model.Users;

/**
 * Servlet implementation class MessagePage
 */
@WebServlet("/InboxMailPageServlet")
public class InboxMailPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InboxMailPageServlet() {
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

        ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
        ArrayList<Message> auctionMessage = new ArrayList();

        Message m = null;

//		String queryMessages = "select * from AuctionMessagesConversation where userEmail = ? or destinationEmail = ?;";


        String queryMessages = "select conversationID, auctionID, userEmail, profilePicture, car, sendMessage, destinationEmail, messageDateTime from " +
                "(select *, row_number() over(partition by auctionID, userEmail order by messageDateTime DESC) as row_num from AuctionMessagesConversation " +
                "where destinationEmail = ? ) as subquery where row_num = 1 order by messageDateTime DESC;";

        try {
            DatabaseAccess db = new DatabaseAccess();
            Connection connection = db.getConnection();


            PreparedStatement preparedStatement = connection.prepareStatement(queryMessages);
            preparedStatement.setString(1, users.get(0).getUserEmail());
//			preparedStatement.setString(2, users.get(0).getUserEmail());


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
//		request.getRequestDispatcher("inboxMailPage.jsp").forward(request,response);
        request.getRequestDispatcher("inboxMailPage.jsp").forward(request,response);


    }

}
