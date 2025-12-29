package rin.dev.admin.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.User;

public class EditUserServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String idParam = request.getParameter("id");

            // Validate ID parameter
            if (idParam == null || idParam.trim().isEmpty()) {
                request.setAttribute("errorMessage", "User ID is required for editing.");
                request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
                return;
            }

            int userId = Integer.parseInt(idParam.trim());

            // Fetch user from DB
            User user = DatabaseDao.getInstance().getUserDao().findById(userId);

            if (user == null) {
                request.setAttribute("errorMessage", "User not found.");
                request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
                return;
            }

            // Pass user object to JSP
            request.setAttribute("user", user);
            request.getRequestDispatcher("/admin/user/edit.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid user ID.");
            request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
        } catch (Exception e) {
            super.handleError(request, response, e);
        }
    }

    /**
     * Handles POST request. Validates form input and updates user information.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            // Read params
            String idParam = request.getParameter("id");
            String fullName = sanitize(request.getParameter("fullName"));
            String email = sanitizeLower(request.getParameter("email"));
            String password = sanitize(request.getParameter("password"));
            String role = sanitizeUpper(request.getParameter("role"));

            // Required field validation
            if (idParam == null || idParam.isEmpty()
                    || fullName == null || fullName.isEmpty()
                    || email == null || email.isEmpty()
                    || role == null || role.isEmpty()) {

                request.setAttribute("errorMessage", "Please fill in all required fields.");
                reloadUserAndForward(request, response, idParam);
                return;
            }

            int userId = Integer.parseInt(idParam);

            // Load existing user
            User user = DatabaseDao.getInstance().getUserDao().findById(userId);

            if (user == null) {
                request.setAttribute("errorMessage", "User does not exist.");
                request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
                return;
            }

            // Do not allow email change (security requirement)
            if (!email.equals(user.getEmail())) {
                request.setAttribute("errorMessage", "Email cannot be changed.");
                request.setAttribute("user", user);
                request.getRequestDispatcher("/admin/user/edit.jsp").forward(request, response);
                return;
            }

            // Validate allowed roles
            if (!"ADMIN".equals(role) && !"CUSTOMER".equals(role)) {
                request.setAttribute("errorMessage", "Invalid user role.");
                request.setAttribute("user", user);
                request.getRequestDispatcher("/admin/user/edit.jsp").forward(request, response);
                return;
            }

            // Apply updates
            user.setFullName(fullName);

            // Only update password if provided
            if (password != null && !password.isEmpty()) {
                user.setPassword(password);
            }

            user.setRole(role);

            // Save to database
            boolean success = DatabaseDao.getInstance().getUserDao().update(user);

            if (success) {
                response.sendRedirect("IndexUserServlet");
            } else {
                request.setAttribute("errorMessage", "Update failed. Please try again.");
                request.setAttribute("user", user);
                request.getRequestDispatcher("/admin/user/edit.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid user ID.");
            request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
        } catch (Exception e) {
            super.handleError(request, response, e);
        }
    }

    /**
     * Helper method: Reload user and forward back to edit page when validation
     * fails.
     */
    private void reloadUserAndForward(HttpServletRequest request, HttpServletResponse response, String idParam)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(idParam.trim());
            User user = DatabaseDao.getInstance().getUserDao().findById(userId);
            request.setAttribute("user", user);
        } catch (Exception ignored) {
            // Ignore reload errors; just forward
        }

        request.getRequestDispatcher("/admin/user/edit.jsp").forward(request, response);
    }

    // -------------------------
    // Utility sanitizing methods
    // -------------------------
    private String sanitize(String value) {
        return value == null ? null : value.trim();
    }

    private String sanitizeLower(String value) {
        return value == null ? null : value.trim().toLowerCase();
    }

    private String sanitizeUpper(String value) {
        return value == null ? null : value.trim().toUpperCase();
    }
}
