package p1;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.DBConnection;
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username = ? AND password = ?"
            );
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("user_id", rs.getInt("id"));
                session.setAttribute("username", rs.getString("username"));
                res.sendRedirect("index.jsp");
            } else {
                req.setAttribute("error", "Invalid username or password!");
                req.getRequestDispatcher("login.jsp").forward(req, res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error. Try again.");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}
