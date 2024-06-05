package userpackage.Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseAccess {


    public DatabaseAccess() {

    }

    public Connection getConnection() {


        CredentialsLoader credentialsLoader = new CredentialsLoader();

        String connectionUrl = credentialsLoader.getProperty("DATABASE_CONNECTION");
        String username = credentialsLoader.getProperty("DATABASE_USERNAME");
        String password = credentialsLoader.getProperty("DATABASE_PASSWORD");


        System.out.println("Connection URL: " + connectionUrl);
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        System.out.println("Connecting to database ...\n");

        Connection connection = null;

        try {

            //Load JDBC driver - the interface standardizing the connection procedure.
            //Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

        } catch (InstantiationException e) {

            e.printStackTrace();
        } catch (IllegalAccessException e) {

            e.printStackTrace();
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        }


        try {

            connection = DriverManager.getConnection(connectionUrl,username, password);

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return connection;

    }


    public void closeConnection(Connection connection){
        try {
            connection.close();
            System.out.println("Connection closed!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




}
