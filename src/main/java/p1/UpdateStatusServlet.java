package p1;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.DBConnection;
public class UpdateStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int taskId = Integer.parseInt(req.getParameter("id"));

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "UPDATE tasks SET status = 'Completed' WHERE id = ? AND user_id = ?"
            );
            ps.setInt(1, taskId);
            ps.setInt(2, (int) session.getAttribute("user_id"));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        res.sendRedirect("viewTasks");
    }
}
