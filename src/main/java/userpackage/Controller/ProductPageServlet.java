package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
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

/**
 * Servlet implementation class ProductPage
 */
@WebServlet("/ProductPageServlet")
public class ProductPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductPageServlet() {
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


        System.out.println("In ProductPageServlet");

        HttpSession session = request.getSession();

        //get auctionID attributes from userPage.jsp
        String auctionID = (String)session.getAttribute("auctionID");

        //get bidderEmail attribute from userPage.jsp
        String bidderEmail = (String)session.getAttribute("userEmail");

        //get bidderPrice that they input
        String bidderPrice = request.getParameter("bidderPrice");


        //bidder price has to be greater than the startingBid or currentBid
        String checkBidQuery = "select * from Auction where auctionID = " + auctionID +
                " and startingBid < " + bidderPrice +
                " and currentBid IS NULL" +
                " or auctionID = " + auctionID +
                " and currentBid IS NOT NULL" +
                " and currentBid < " + bidderPrice + ";";


        //string to update query once bid is checked to be greater than previous bid
        String query = "update Auction set currentBid = " + bidderPrice + ", bidderEmail = '" + bidderEmail + "' where auctionID = " + auctionID + ";";


        //if nothing is entered show error
        if(bidderPrice.trim() == null || bidderPrice.trim() == "" || bidderPrice.trim().equals("")) {

            request.setAttribute("success", "error");

            request.getRequestDispatcher("productPage.jsp").forward(request,response);

        }else {

            try {
                DatabaseAccess db = new DatabaseAccess();
                Connection connection = db.getConnection();

                Statement statement = connection.createStatement();

                ResultSet rs = statement.executeQuery(checkBidQuery);


                //if resultSet returns null bid is not greater
                if(!(rs.next())) {


                    System.out.println("\nBid is not greater than both starting Price and current Bid\n");
                    request.setAttribute("success", "error");
//					response.sendRedirect("productPage.jsp");

                    request.getRequestDispatcher("productPage.jsp").forward(request,response);


                }else {


                    System.out.println("\nALL GOOD PRICE ENTERED!\n");


                    statement.executeUpdate(query);

                    ///////////////////////////////////BEGINNING OF INSERT INTO BIDHISTORY ////////////////////////////////////////////////////////////////////////


                    LocalDateTime currentDate;
                    LocalDateTime now = LocalDateTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    currentDate = LocalDateTime.parse(formatter.format(now), formatter);


                    String insertBidHistory = "insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values (" + auctionID +
                            ", '" + bidderEmail + "', " + bidderPrice + ", '" + currentDate +  "');";


                    statement.executeUpdate(insertBidHistory);

                    ///////////////////////////////////ENDING OF INSERT INTO BIDHISTORY ////////////////////////////////////////////////////////////////////////



                    ////////////////////////////////////////////BEGINNING OF LOOKUP BID HISTORY///////////////////////////////////////////////////////////////////////////


                    String queryBidHistory = "select * from BidHistory where AuctionID =" + auctionID +";";

                    ResultSet resultSet = statement.executeQuery(queryBidHistory);

                    ArrayList<String> bidHistory = new ArrayList<String>();

                    while(resultSet.next()) {

//	            		bidHistory.add(resultSet.getString("bidPrice") + " " + resultSet.getString("userEmail") + " " + resultSet.getString("bidDateTime"));
                        bidHistory.add(resultSet.getString("userEmail") + " " +resultSet.getString("bidDateTime") + " " + resultSet.getString("bidPrice"));
                        System.out.println(resultSet.getString("userEmail") + " " +resultSet.getString("bidDateTime") + " " + resultSet.getString("bidPrice"));
                    }

                    //sends bid history to productPage.jsp for display
                    session.setAttribute("bidHistory", bidHistory);

                    ////////////////////////////////////////////ENDING OF LOOKUP BID HISTORY///////////////////////////////////////////////////////////////////////////////


                    String query2 = "select * from Auction where auctionID = '"
                            + auctionID + "';";

                    ResultSet rs2 = statement.executeQuery(query2);

                    //gets number of columns from the query
                    //for for loop
//	    			ResultSetMetaData metadata2 = rs2.getMetaData();

                    Auction auction = null;

                    while(rs2.next()) {

                        auction = new Auction(
                                rs2.getString("auctionID"),
                                rs2.getString("userEmail"),
                                rs2.getString("carImage"),
                                rs2.getString("carYear"),
                                rs2.getString("carMake"),
                                rs2.getString("carModel"),
                                rs2.getString("carColor"),
                                rs2.getString("startingBid"),
                                rs2.getString("carPrice"),
                                rs2.getString("startDate"),
                                rs2.getString("expirationDate"),
                                rs2.getString("carDescription"),
                                rs2.getString("imagePath")
                        );//this end parentheses is for Auction object


                        auction.setCurrentBid(rs2.getString("currentBid"));
                        auction.setBidderEmail(rs2.getString("bidderEmail"));

                    }


                    session.setAttribute("auction", auction);


                    System.out.println(auction.auctionID);
                    System.out.println(auction.userEmail);
                    System.out.println(auction.carYear);
                    System.out.println(auction.carMake);
                    System.out.println(auction.carModel);
                    System.out.println(auction.carColor);

                    System.out.println("Current Bid: " + auction.currentBid);
                    System.out.println("Bidder Email: " + auction.bidderEmail);


//	    			response.sendRedirect("productPage.jsp");

                    request.setAttribute("success", "success");
//					response.sendRedirect("productPage.jsp");

                    request.getRequestDispatcher("productPage.jsp").forward(request,response);



                }

                db.closeConnection(connection);


            }catch(Exception e){

                throw new IllegalStateException("Cannot connect the database!", e);
            }


        }










    }



}
