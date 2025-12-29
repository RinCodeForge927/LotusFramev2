package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.UserDao;
import rin.dev.data.model.User;

public class LoginServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("HomeServlet");
            return;
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.findByEmail(email);

        // Hash the input password to compare with the one in DB
        String hashedInputPassword = rin.dev.util.SecurityHelper.hashPassword(password);

        if (user == null || !user.getPassword().equals(hashedInputPassword)) {
            // Invalid credentials
            request.setAttribute("error", "Invalid email or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Successful login → store user in session
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("userId", user.getId());

        // Redirect based on role
        if ("ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("DashboardServlet");
        } else {
            response.sendRedirect("HomeServlet");
        }
    }
}
