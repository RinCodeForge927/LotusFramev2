package rin.dev.admin.contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.ContactDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Contact;

public class DeleteContactServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null) {
            handleError(request, response, "Contact ID is required.");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            ContactDao contactDao = DatabaseDao.getInstance().getContactDao();

            // Fetch contact to verify existence
            Contact contact = contactDao.findById(id);
            if (contact == null) {
                handleError(request, response, "Contact not found.");
                return;
            }

            // Attach contact to request for JSP rendering
            request.setAttribute("contact", contact);

            // Forward to delete confirmation page
            request.getRequestDispatcher("/admin/contact/delete.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid Contact ID.");
        } catch (Exception e) {
            handleError(request, response, e);
        }
    }

    /**
     * POST: Perform actual deletion of the contact.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ContactDao contactDao = DatabaseDao.getInstance().getContactDao();

            boolean deleted = contactDao.delete(id);

            if (deleted) {
                // Redirect back to index with a success indicator
                response.sendRedirect(
                        request.getContextPath() + "/IndexContactServlet?success=deleted"
                );
            } else {
                handleError(request, response, "Failed to delete contact.");
            }

        } catch (Exception e) {
            handleError(request, response, e);
        }
    }
}
