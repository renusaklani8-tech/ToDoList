package p1;

import java.sql.*;

public class DBConnection {
    // Change this to your MySQL 8.4.8 password
    private static final String URL = "jdbc:mysql://localhost:3307/tododb?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "root";  // CHANGE THIS

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}