package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.UserDao;
import rin.dev.data.model.User;

public class RegisterServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Basic validation: Check required fields
        if (fullName == null || fullName.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || password == null || password.isEmpty()
                || confirmPassword == null || confirmPassword.isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        UserDao userDao = DatabaseDao.getInstance().getUserDao();

        // Check if email already exists
        User existingUser = userDao.findByEmail(email.trim());
        if (existingUser != null) {
            request.setAttribute("error", "Email already exists. Please use another one.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check password confirmation
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Create new user with default role CUSTOMER
        User newUser = new User(fullName.trim(), email.trim(), password);
        boolean success = userDao.insert(newUser);

        if (success) {
            // Redirect to login page after successful registration
            response.sendRedirect("LoginServlet");
        } else {
            request.setAttribute("error", "Something went wrong! Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
