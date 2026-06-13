package p1;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.DBConnection;
public class AddTaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        String task = req.getParameter("task");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO tasks (user_id, task, status) VALUES (?, ?, 'Pending')"
            );
            ps.setInt(1, userId);
            ps.setString(2, task);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        res.sendRedirect("index.jsp");
    }
}
