package p1;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.DBConnection;
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM users WHERE username = ? OR email = ?"
            );
            check.setString(1, username);
            check.setString(2, email);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                req.setAttribute("error", "Username or email already exists!");
                req.getRequestDispatcher("register.jsp").forward(req, res);
                return;
            }

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users (username, email, password) VALUES (?, ?, ?)"
            );
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.executeUpdate();

            res.sendRedirect("login.jsp?msg=Registration successful! Please login.");

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error. Try again.");
            req.getRequestDispatcher("register.jsp").forward(req, res);
        }
    }
}
