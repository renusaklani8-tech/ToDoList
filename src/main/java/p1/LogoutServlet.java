package p1;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import p1.DBConnection;
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        res.sendRedirect("login.jsp");
    }
}