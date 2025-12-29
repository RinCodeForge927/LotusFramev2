package rin.dev.admin.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.UserDao;
import rin.dev.data.model.User;

public class IndexUserServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve UserDao from the DAO factory (Singleton)
        UserDao userDao = DatabaseDao.getInstance().getUserDao();

        // Fetch all users from the database
        List<User> userList = userDao.findAll();

        // Attach user list to the request so JSP can render it
        request.setAttribute("userList", userList);

        // Forward to JSP (full page rendering)
        request.getRequestDispatcher("/admin/user/index.jsp").forward(request, response);
    }

    /**
     * Handles POST requests. Currently not used for the user index page. This
     * can be extended later for search or filtering features.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Not supporting POST for now (delegates to BaseAdminServlet)
        super.doPost(request, response);
    }
}
