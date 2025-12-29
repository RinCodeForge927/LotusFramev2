package rin.dev.admin.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.User;

public class CreateUserServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
    }

    /**
     * Handle POST request: Validate and create a new user.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // --- Read parameters ---
            String fullName = trimOrNull(request.getParameter("fullName"));
            String email = trimOrNullLower(request.getParameter("email"));
            String password = trimOrNull(request.getParameter("password"));
            String repeatPassword = trimOrNull(request.getParameter("repeatPassword"));
            String role = trimOrNullUpper(request.getParameter("role"));

            // --- Validate required fields ---
            if (isEmpty(fullName) || isEmpty(email) || isEmpty(password)
                    || isEmpty(repeatPassword) || isEmpty(role)) {

                request.setAttribute("errorMessage", "Please fill out the registration information completely.");
                request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
                return;
            }

            // --- Email duplication check ---
            if (DatabaseDao.getInstance().getUserDao().findByEmail(email) != null) {
                request.setAttribute("errorMessage", "Email already exists.");
                request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
                return;
            }

            // --- Password confirm ---
            if (!password.equals(repeatPassword)) {
                request.setAttribute("errorMessage", "Re-entered password does not match.");
                request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
                return;
            }

            // --- Role validation ---
            if (!"ADMIN".equals(role) && !"CUSTOMER".equals(role)) {
                request.setAttribute("errorMessage", "Invalid role.");
                request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
                return;
            }

            // --- Create new User object ---
            User newUser = new User();
            newUser.setFullName(fullName);
            newUser.setEmail(email);
            newUser.setPassword(password); // Note: Password should ideally be hashed.
            newUser.setRole(role);

            // --- Insert user ---
            boolean success = DatabaseDao.getInstance().getUserDao().insert(newUser);

            if (success) {
                // Redirect to user list after successful creation
                response.sendRedirect("IndexUserServlet");
            } else {
                request.setAttribute("errorMessage", "User creation failed. Please try again.");
                request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
            }

        } catch (Exception e) {
            super.handleError(request, response, e);
        }
    }

    // ============================
    // Helper Methods
    // ============================
    /**
     * Trim value or return null.
     */
    private String trimOrNull(String value) {
        return (value == null) ? null : value.trim();
    }

    /**
     * Trim value & convert to lowercase.
     */
    private String trimOrNullLower(String value) {
        return (value == null) ? null : value.trim().toLowerCase();
    }

    /**
     * Trim value & convert to uppercase.
     */
    private String trimOrNullUpper(String value) {
        return (value == null) ? null : value.trim().toUpperCase();
    }

    /**
     * Check if value is null or empty.
     */
    private boolean isEmpty(String value) {
        return value == null || value.isEmpty();
    }
}
