package rin.dev.admin.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.UserDao;
import rin.dev.data.model.User;

public class DeleteUserServlet extends BaseAdminServlet {

    protected UserDao getUserDao() {
        return DatabaseDao.getInstance().getUserDao();
    }

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String idParam = request.getParameter("id");

            // Validate ID parameter
            if (idParam == null || idParam.trim().isEmpty()) {
                super.handleError(request, response, "User ID is required for deletion.");
                return;
            }

            int userId = Integer.parseInt(idParam.trim());

            // Load the user to be deleted
            User userToDelete = getUserDao().findById(userId);

            if (userToDelete == null) {
                super.handleError(request, response, "User does not exist or has already been deleted.");
                return;
            }

            // Optional: Prevent admin from deleting their own account
            User currentUser = (User) request.getAttribute("currentUser");
            if (currentUser != null && currentUser.getId() == userId) {
                super.handleError(request, response, "You cannot delete your own account.");
                return;
            }

            // Pass user to JSP
            request.setAttribute("userToDelete", userToDelete);
            request.getRequestDispatcher("/admin/user/delete.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            super.handleError(request, response, "Invalid user ID.");
        } catch (Exception e) {
            super.handleError(request, response, e);
        }
    }

    /**
     * Handles POST request: Deletes the user after confirmation form is
     * submitted.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String idParam = request.getParameter("id");

            // Validate ID parameter
            if (idParam == null || idParam.trim().isEmpty()) {
                super.handleError(request, response, "Missing user ID for deletion.");
                return;
            }

            int userId = Integer.parseInt(idParam.trim());

            // Perform delete operation
            boolean success = getUserDao().delete(userId);

            if (success) {
                response.sendRedirect("IndexUserServlet");
            } else {
                super.handleError(request, response,
                        "Failed to delete user (user may not exist or is referenced by other data).");
            }

        } catch (NumberFormatException e) {
            super.handleError(request, response, "Invalid user ID.");
        } catch (Exception e) {
            super.handleError(request, response, e);
        }
    }
}
