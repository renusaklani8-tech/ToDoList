package p1;

import java.io.*;
import p1.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import p1.DBConnection;
public class ViewTasksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("user_id");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM tasks WHERE user_id = ? ORDER BY id DESC"
            );
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            req.setAttribute("tasks", rs);
            req.getRequestDispatcher("view.jsp").forward(req, res);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
