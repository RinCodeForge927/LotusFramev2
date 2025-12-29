package rin.dev.admin;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import rin.dev.data.dao.Database;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.UserDao;
import rin.dev.data.model.User;

public class BaseAdminServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // Initialize singleton DatabaseDao with Database instance
        DatabaseDao.init(new Database());
    }

    // ===================== Core GET/POST Handling =====================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!checkAdminPermission(request, response, false)) {
            return;
        }
        handleGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!checkAdminPermission(request, response, false)) {
            return;
        }
        handlePost(request, response);
    }

    /**
     * Check if current user has ADMIN role.
     *
     * @param reloadFromDB: true to reload fresh user from DB (after role
     * change), false for performance.
     * @return true if OK; false if redirected/forwarded to error.
     */
    protected boolean checkAdminPermission(HttpServletRequest request, HttpServletResponse response, boolean reloadFromDB)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            redirectToLogin(request, response, "Please login first");
            return false;
        }

        User user = (User) session.getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            forwardToError(request, response, "Access denied: Admin role required!");
            return false;
        }

        // Generate CSRF token if not exists in session
        if (session.getAttribute("csrfToken") == null) {
            session.setAttribute("csrfToken", rin.dev.util.SecurityHelper.generateCsrfToken());
        }

        // Optional: reload fresh user from DB if needed
        if (reloadFromDB) {
            UserDao userDao = getUserDao();
            User freshUser = userDao.findByEmail(user.getEmail());
            if (freshUser == null || !"ADMIN".equals(freshUser.getRole())) {
                session.invalidate();
                forwardToError(request, response, "Session invalid: Role changed or user deleted.");
                return false;
            }
            session.setAttribute("user", freshUser);
            user = freshUser;
        }

        request.setAttribute("currentUser", user);
        return true;
    }

    // ===================== DAO Helpers =====================
    protected UserDao getUserDao() {
        return DatabaseDao.getInstance().getUserDao();
    }

    // Example: Add other DAO getters if needed
    // protected ProductDao getProductDao() { return DatabaseDao.getInstance().getProductDao(); }
    // protected CategoryDao getCategoryDao() { return DatabaseDao.getInstance().getCategoryDao(); }
    // ===================== Subclass Hooks =====================
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getAttribute("currentUser");
        if (currentUser != null) {
            request.setAttribute("welcomeMessage", "Welcome, " + currentUser.getFullName() + "!");
        }
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }

    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED,
                "POST not supported in base class. Override handlePost().");
    }

    // ===================== Error Handling Helpers =====================
    private void redirectToLogin(HttpServletRequest request, HttpServletResponse response, String errorMsg)
            throws IOException {
        String redirectUrl = request.getContextPath() + "/login.jsp?error=" + URLEncoder.encode(errorMsg, "UTF-8");
        response.sendRedirect(redirectUrl);
    }

    private void forwardToError(HttpServletRequest request, HttpServletResponse response, String errorMsg)
            throws ServletException, IOException {
        request.setAttribute("error", errorMsg);
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    }

    protected void handleError(HttpServletRequest request, HttpServletResponse response, Throwable throwable)
            throws ServletException, IOException {
        throwable.printStackTrace();
        String msg = throwable.getMessage();
        if (msg == null || msg.isEmpty()) {
            msg = "An unexpected error occurred while processing your request.";
        }
        request.setAttribute("errorMessage", msg);
        request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
    }

    protected void handleError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
    }
}
