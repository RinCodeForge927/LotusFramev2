package rin.dev.admin.contact;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.ContactDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Contact;

public class ViewContactServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Parse message ID from the request URL
            int id = Integer.parseInt(request.getParameter("id"));

            ContactDao contactDao = DatabaseDao.getInstance().getContactDao();
            Contact contact = contactDao.findById(id);

            // Validate message existence
            if (contact == null) {
                handleError(request, response, "Message not found.");
                return;
            }

            // Attach contact object for JSP rendering
            request.setAttribute("contact", contact);

            request.getRequestDispatcher("/admin/contact/view.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            // Pass exception to the BaseAdminServlet for uniform error handling
            handleError(request, response, e);
        }
    }
}
