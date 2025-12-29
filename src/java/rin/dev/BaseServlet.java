package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import rin.dev.data.dao.Database;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.util.Constants;
import rin.dev.util.GetDateTime;
import rin.dev.util.Helper;

public abstract class BaseServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {

        DatabaseDao.init(new Database());
    }

    protected void forwardToView(HttpServletRequest request, HttpServletResponse response, String viewName)
            throws ServletException, IOException {
        String path = "/WEB-INF/views/" + viewName;
        Helper.logInfo("➡️ Forwarding to view: " + path);
        request.getRequestDispatcher(path).forward(request, response);
    }

    /**
     * Redirect to a URL within the application context.
     */
    protected void redirectTo(HttpServletResponse response, String url) throws IOException {
        response.sendRedirect(url);
    }

    /**
     * Get the current logged-in user from session, if any.
     */
    protected Object getSessionUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null) ? session.getAttribute(Constants.SESSION_USER) : null;
    }

    /**
     * Store a user object in the session (login).
     */
    protected void setSessionUser(HttpServletRequest request, Object user) {
        HttpSession session = request.getSession(true);
        session.setAttribute(Constants.SESSION_USER, user);
    }

    /**
     * Remove the user object from session (logout).
     */
    protected void clearSessionUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(Constants.SESSION_USER);
        }
    }

    /**
     * Set common attributes accessible on all pages, like appName and
     * currentTime.
     */
    protected void setCommonAttributes(HttpServletRequest request) {
        try {
            request.setAttribute("appName", Constants.APP_NAME);
        } catch (NoSuchFieldError e) {
            // Fallback if Constants class is stale
            request.setAttribute("appName", "Savory Whisper");
        }
        request.setAttribute("currentTime", GetDateTime.now());
    }

    /**
     * Handle unexpected exceptions gracefully and forward to error.jsp.
     */
    protected void handleError(HttpServletRequest request, HttpServletResponse response, Exception e)
            throws ServletException, IOException {
        Helper.logError("🚨 Exception in servlet: " + e.getMessage());
        e.printStackTrace();

        request.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
        request.setAttribute("errorDetails", e.getMessage());

        forwardToView(request, response, "error.jsp");
    }
}
